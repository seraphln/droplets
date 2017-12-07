# coding=utf-8
#


"""
移动端请求的实现
"""

from django import http

from django.shortcuts import render_to_response

from droplets.dphome.views import get_cur_city
from droplets.dphome.utils import get_basic_params
from droplets.dphome.utils import get_data_by_page
from droplets.dphome.utils import get_and_format_site
from droplets.dphome.utils import get_prev_and_next_page

from droplets.dphome.models import Links
from droplets.dphome.models import Menus
from droplets.dphome.models import SiteConfig

from droplets.products.models import Cases
from droplets.products.models import CasesCategory
from droplets.products.models import Products
from droplets.products.models import ProductsCategory

from droplets.products.views import get_case_by_page
from droplets.products.views import get_products_by_page

from droplets.seo.models import LongTailKeywords
from droplets.seo.utils import generate_pinyin_mapper
from droplets.seo.utils import do_generate_product_name

from droplets.news.models import News
from droplets.news.models import NewsCategory



def m(basic_params, request, city=None):
    """ 渲染网站首页 """
    is_jump = int(request.GET.get("is_jump", "1"))

    # 更新产品信息
    prod_page_info, products = get_data_by_page(Products)

    # 获取链接信息
    links_page_info, links = get_data_by_page(Links)

    # 获取新闻信息
    news_categories = NewsCategory.objects.filter()[:2]
    news_dict = {}
    for new_cate in news_categories:
        _, news = get_data_by_page(News, {"category": new_cate}, reverse=False)
        news_dict[new_cate] = news

    lt = LongTailKeywords.objects.filter().first()

    cur_city_name, cur_city = get_cur_city(city)
    pinyin_mapper = generate_pinyin_mapper(lt.cities)

    basic_params.update({"subsites": pinyin_mapper,
                         "site": get_and_format_site(request, city),
                         "cases": get_data_by_page(Cases)[1],
                         "products_categories": get_data_by_page(ProductsCategory)[1],
                         "cur_city_name": cur_city_name,
                         "is_jump": is_jump,
                         "products": do_generate_product_name(products, city),
                         "links": links,
                         "total_news": news_dict,
                         "cur_city": cur_city})

    # 处理多站
    return render_to_response("m/index.html", basic_params)


def process_about(basic_params, request, cur_city=None,
                  dir_name=None, cate_name=None, cid=None, page=None):
    """
        处理关于我们页面
    """
    site = SiteConfig.objects.filter().first()
    # 取出产品中心的导航
    cur_menu = Menus.objects.filter(name=u"产品中心", is_root=True).first()
    cates = Menus.objects.filter(parent_cate=cur_menu)

    basic_params["cates"] = cates

    target_dir = "/about"

    if dir_name:
        template_name = "m/%s" % dir_name
    else:
        template_name = "m/about.html"

    return render_to_response(template_name, basic_params)


def process_supply(basic_params, request, cur_city=None,
                   dir_name=None, cate_name=None, cid=None, page=None):
    """
    处理产品相关信息
    """
    basic_params["site"] = get_and_format_site(request, cur_city)
    basic_params.update({"products_categories": ProductsCategory.objects.filter()})

    # 单页信息
    if cid:
        products = Products.objects.filter(id=int(cid)).first()
        prev_prod, next_prod = get_prev_and_next_page(Products, cid)
        prev_prod = do_generate_product_name([prev_prod, ], cur_city)[0]
        next_prod = do_generate_product_name([next_prod, ], cur_city)[0]
        products = do_generate_product_name([products,], cur_city)[0]

        cur_city_name, cur_city = get_cur_city(cur_city)

        basic_params.update({"products_categories": ProductsCategory.objects.filter(),
                             "products": products,
                             "cur_cate": products.category,
                             "prev_prod": prev_prod,
                             "next_prod": next_prod,
                             "cur_city_name": cur_city_name,
                             "cur_city": cur_city})

        return render_to_response("m/product_detail.html", basic_params)

    # 处理分页
    if page:
        template_name = "m/product.html"
        return get_products_by_page(request, cate_name=cate_name, page=page,
                                    dir_name=dir_name, template_name=template_name)

    if dir_name:
        cate = ProductsCategory.objects.filter(dir_name=dir_name).first()
        basic_params["cur_cate"] = cate
        query_dict = {"category": cate.id}
    else:
        query_dict = {}

    products_page_info, products = get_data_by_page(Products, query_dict)
    products = do_generate_product_name(products, cur_city)

    cur_city_name, cur_city = get_cur_city(cur_city)

    basic_params.update({"products_page_info": products_page_info,
                         "cur_city_name": cur_city_name,
                         "cur_city": cur_city,
                         "products": products})

    return render_to_response("m/product.html", basic_params)


def process_cases(basic_params, request, cur_city=None,
                  dir_name=None, cate_name=None, cid=None, page=None):
    """
    处理案例相关信息
    """
    basic_params.update({"case_categories": CasesCategory.objects.filter()})

    if cid:
        case = Cases.objects.filter(id=int(cid)).first()
        prev_case, next_case = get_prev_and_next_page(Cases, cid)

        basic_params.update({"case_categories": CasesCategory.objects.filter(),
                             "case": case,
                             "cur_cate": case.category,
                             "prev_case": prev_case,
                             "next_case": next_case})

        return render_to_response("m/case_detail.html", basic_params)

    # 处理分页
    if page:
        template_name = "m/cases.html"
        return get_case_by_page(request, cate_name, page,
                                dir_name=dir_name, template_name=template_name)

    # 有dir_name的时候，用dir_name来获取分类信息
    if dir_name:
        cate = CasesCategory.objects.filter(dir_name=dir_name).first()
        query_dict = {"category": cate.id}
        basic_params["cur_cate"] = cate
    else:
        query_dict = {}

    case_page_info, cases = get_data_by_page(Cases, query_dict)
    basic_params.update({"case_page_info": case_page_info,
                         "cases": cases})

    return render_to_response("m/cases.html", basic_params)


def process_news(basic_params, request, cur_city=None,
                 dir_name=None, cate_name=None, cid=None, page=None):
    """
    处理新闻
    """
    # 处理单独页面请求
    if cid:
        news = News.objects.filter(id=cid).first()
        prev_news, next_news = get_prev_and_next_page(News, cid)

        basic_params.update({"news_categories": NewsCategory.objects.filter(),
                             "news": news,
                             "cur_cate": news.category,
                             "prev_news": prev_news,
                             "next_news": next_news})

        return render_to_response("m/news_detail.html", basic_params)

    if dir_name:
        cate = NewsCategory.objects.filter(dir_name=dir_name).first()
    else:
        # 默认使用公司动态
        cate = NewsCategory.objects.filter(name=u"公司动态").first()

    if cate:
        query_dict = {"category": cate.id}
    else:
        query_dict = {}
    basic_params["cur_cate"] = cate

    news_page_info, news = get_data_by_page(News)
    basic_params.update({"news_page_info": news_page_info,
                         "news": news})

    return render_to_response("m/news.html", basic_params)


def url_dispatcher(request, cate=None, cur_city=None, dir_name=None,
                   cate_name=None, cid=None, page=None):
    """
        一定程度的url适配
        根据cate_name来决定取数据的内容
        根据page来决定模板页面
    """
    cate_mapper = {"cases": process_cases,
                   "supply": process_supply,
                   "news": process_news,
                   "about": process_about}

    basic_params = get_basic_params()

    if cate:
        #
        resp = cate_mapper[cate](basic_params, request, cur_city,
                                 dir_name, cate_name, cid, page)
    else:
        resp = m(basic_params, request, cur_city)

    return resp

