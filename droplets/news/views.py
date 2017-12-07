#coding=utf-8
# Create your views here.

from django import http
from django.shortcuts import render
from django.shortcuts import render_to_response

from droplets.dphome.models import CompanyInfo

from droplets.dphome.models import SiteConfig
from droplets.news.models import News
from droplets.news.models import NewsCategory

from droplets.dphome.utils import get_basic_params
from droplets.dphome.utils import get_data_by_page
from droplets.dphome.utils import get_prev_and_next_page

from droplets.dphome.utils import format_dir_name

from droplets.utils.models import get_categories


def news(request, dir_name=None):
    """
        获取新闻展示页面

        @param request: 当前请求的request对象
        @type request: django.request

        @param dir_name: 当前目录的dir_name
        @type dir_name: String

        :return: rener_to_response("cases/cases.html")
    """

    basic_params = get_basic_params()
    basic_params.update({"news_categories": get_categories("news")})

    if dir_name:
        dir_name = format_dir_name(dir_name)
        cate = NewsCategory.objects.filter(dir_name=dir_name).first()
    else:
        # 默认使用公司动态
        cate = NewsCategory.objects.filter().first()

    if cate:
        query_dict = {"category": cate.id}
    else:
        query_dict = {}
    basic_params["cur_cate"] = cate

    news_page_info, news = get_data_by_page(News, query_dict)
    basic_params.update({"news_page_info": news_page_info,
                         "news": news})

    return render_to_response("news/news.html", basic_params)


def get_news_by_id(request, cid):
    """
        根据id获取新闻的详细信息

        @param request: 当前请求的request对象
        @type request: django.request

        @param cid: 当前传入的新闻id
        @type cid: Int

        :return: render_to_response("news/news_detail.html")
    """
    basic_params = get_basic_params()

    news = News.objects.filter(id=cid).first()
    prev_news, next_news = get_prev_and_next_page(News, cid)

    _, total_news = get_data_by_page(News, {"category": news.category})

    basic_params.update({"news_categories": get_categories("news"),
                         "news": news,
                         "cur_cate": news.category,
                         "prev_news": prev_news,
                         "next_news": next_news,
                         "total_news": total_news,
                         "ci": CompanyInfo.objects.filter().first()})

    return render_to_response("news/news_detail.html", basic_params)


def get_news_by_page(request, dir_name, cate_name, page, per_page=10):
    cate_mapper = {"News": News}

    site = SiteConfig.objects.filter().first()

    if not cate_name or not page:
        return http.HttpResponseRedirect(site.url)
    else:
        if dir_name:
            dir_name = format_dir_name(dir_name)
            cate = NewsCategory.objects.filter(dir_name=dir_name).first()
        else:
            cate = NewsCategory.objects.filter(name=u"公司动态").first()

        basic_params = get_basic_params()
        query_dict = {"category": cate.id}
        basic_params["cur_cate"] = cate

        page_info, news = get_data_by_page(cate_mapper.get(cate_name),
                                               query_dict,
                                               page=int(page),
                                               per_page=int(per_page))

        basic_params.update({"news_categories": get_categories("news"),
                                               "news_page_info": page_info,
                                               "news": news,
                                               "ci": CompanyInfo.objects.filter().first()})

        return render_to_response("news/news.html", basic_params)
