# coding=utf-8
#

"""
测试用的接口
后续页面都会渲染成静态页面
"""

import time

from django.shortcuts import Http404
from django.shortcuts import HttpResponse
from django.shortcuts import render_to_response

from droplets.dphome.utils import get_basic_params
from droplets.dphome.utils import get_data_by_page

from droplets.dphome.models import Menus

from droplets.article.models import Articles
from droplets.article.models import HotArticles
from droplets.article.models import ArticlesCategory

default_height = 182


def get_inside_news():
    """
        获取首页右侧的新闻列表
    """
    inside_dct = {}
    inside_categories = Menus.objects.filter(is_inside=True)

    for category in inside_categories:
        _, news = get_data_by_page(Articles, {"category": category, "is_online": True})
        inside_dct[category] = news

    return inside_dct


def index(request, city=None):
    """ 渲染网站首页 """
    basic_params = get_basic_params()
    _, recommand_news = get_data_by_page(Articles,
                                         {"is_recommend": True,
                                          "is_online": True},
                                         per_page=8)
    _, hot_news = get_data_by_page(HotArticles, per_page=4)

    # 处理新闻列表
    _, news = get_data_by_page(Articles, {"is_online": True})

    basic_params.update({"recommand_news": recommand_news,
                         "hot_news": hot_news,
                         "total_height": default_height * len(news),
                         "inside_dct": get_inside_news(),
                         "news": news,})
    return render_to_response("index.html", basic_params)


def sitemap(request):
    """ 返回站点地图 """
    # 返回最近的1024条记录
    basic_params = get_basic_params()
    prod_page_info, products = get_data_by_page(Articles, per_page=1024)

    basic_params["products"] = products
    return render_to_response("sitemap.html", basic_params)


def sceneImgUpload(request):
    """ ckeditor用到的上传图片功能 """
    if request.method == 'POST':
        callback = request.GET.get('CKEditorFuncNum')
        try:
            url_path = "static/uploads/" + time.strftime("%Y%m%d%H%M%S", time.localtime())
            path = "droplets/static/uploads/" + time.strftime("%Y%m%d%H%M%S", time.localtime())
            f = request.FILES["upload"]
            file_name = path + "_" + f.name
            file_name = file_name.encode("utf-8")
            des_origin_f = open(file_name, "wb+")
            for chunk in f.chunks():
                des_origin_f.write(chunk)
            des_origin_f.close()
        except Exception, e:
            print e
        url_name = url_path + "_" + f.name
        res = u"<script>window.parent.CKEDITOR.tools.callFunction(%s,'/%s', '');</script>" % (callback, url_name)
        res = res.encode("utf-8")
        return HttpResponse(res)
    else:
        raise Http404()


def page_router(request, dir_name=None, plural=None):
    """
    获取url的匹配
    """
    basic_params = get_basic_params()
    inside_dct = get_inside_news()
    basic_params["inside_dct"] = inside_dct

    def _format_dir_name(dir_name):
        if not dir_name.startswith("/"):
            dir_name = "/" + dir_name

        if not dir_name.endswith("/"):
            dir_name = dir_name + "/"

        return dir_name

    cate = Menus.objects.filter(dir_name=_format_dir_name(dir_name)).first()
    basic_params["cate"] = cate
    # 根据dir_name无法查询到对应的分类
    if not dir_name or not cate:
        raise Http404()
    else:
        query_dict = {"category": cate}

    if plural:
        article = Articles.objects.filter(plural=plural).first()
        if not article:
            raise Http404()
        else:
            basic_params["article"] = article
            return render_to_response("article/article.html", basic_params)
    else:
        _, articles = get_data_by_page(Articles, query_dict)
        basic_params.update({"articles": articles,
                             "total_height": default_height*len(articles)})
        return render_to_response("article/article_list.html", basic_params)

