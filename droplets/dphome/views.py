# coding=utf-8
#

"""
测试用的接口
后续页面都会渲染成静态页面
"""

import datetime

from django import http
from django.shortcuts import render
from django.shortcuts import render_to_response

from droplets.seo.models import HotKeywords
from droplets.seo.models import LongTailKeywords
from droplets.news.models import News
from droplets.news.models import NewsCategory
from droplets.dphome.models import Links
from droplets.dphome.models import Menus
from droplets.dphome.models import Banners
from droplets.dphome.models import SiteConfig
from droplets.dphome.models import CompanyInfo
from droplets.dphome.models import UserMessage
from droplets.products.models import Cases
from droplets.products.models import CasesCategory
from droplets.products.models import Products

from droplets.seo.utils import generate_pinyin_mapper

from droplets.dphome.utils import make_api_response
from droplets.dphome.utils import get_basic_params
from droplets.dphome.utils import get_and_format_site
from droplets.dphome.utils import get_data_by_page

from droplets.seo.utils import do_generate_product_name


def index(request, city=None):
    """ 渲染网站首页 """
    basic_params = get_basic_params()
    basic_params["site"] = get_and_format_site(request, city)
    category = CasesCategory.objects.filter(name=u"施工案例").first()

    basic_params["cases"] = Cases.objects.filter(category=category)

    # 更新产品信息
    prod_page_info, products = get_data_by_page(Products)
    basic_params["products"] = do_generate_product_name(products, city)

    # 获取链接信息
    links_page_info, links = get_data_by_page(Links)
    basic_params["links"] = links

    # 获取新闻信息
    news_page_info, news = get_data_by_page(News)
    basic_params["total_news"] = news

    lt = LongTailKeywords.objects.filter().first()

    # 处理多站
    pinyin_mapper = generate_pinyin_mapper(lt.cities)
    basic_params["subsites"] = pinyin_mapper
    basic_params["cur_city_name"] = pinyin_mapper.get(city, u"北京")
    basic_params["cur_city"] = city or "BeiJing"
    return render_to_response("index.html", basic_params)


def about(request, dir_name=None):
    site = SiteConfig.objects.filter().first()
    banners = Banners.objects.filter()
    news = News.objects.filter()
    hot_keywords = HotKeywords.objects.filter()
    menus = Menus.objects.filter(is_root=True)
    cases = []

    # 取出产品中心的导航
    b = Menus.objects.filter(name=u"产品中心",
                             is_root=True).first()
    a = Menus.objects.filter(parent_cate=b)

    ci = CompanyInfo.objects.filter().first()
    products = Products.objects.filter()[:10]
    target_dir = "/about"
    result = {"site": site,"banners": banners,
            "hot_keywords": hot_keywords,
              "menus": menus,"total_news": news,
              "a": a,
              "ci": ci, "products": products,"cases": cases}
    if dir_name:
        target_dir = "%s/%s" %(target_dir, dir_name)
    if Menus.objects.filter(dir_name=target_dir).first():
        if dir_name:
            template_names = target_dir
            template_name = template_names.split("/")[2]
        else:
            template_name = "about.html"
        return render_to_response(template_name,result)
    else:
        return http.HttpResponseRedirect(site.url)


def get_supply_by_id(request, id=None):
    """
        获取产品中心的页面

        @param id: 产品id，如果为None则取产品中心页面
        @type id: Int

        :return: resp
    """
    basic_params = get_basic_params()
    basic_params["case"] = Cases.objects.filter(id=int(id)).first()

    return render_to_response("supply_detail.html", basic_params)

def news(request, dir_name=None):
    site = SiteConfig.objects.filter().first()
    banners = Banners.objects.filter()
    news = News.objects.filter()
    newsc = NewsCategory.objects.filter()
    menus = Menus.objects.filter()
    ci = CompanyInfo.objects.filter().first()
    products = Products.objects.filter()[:10]
    target_dir = ""
    result = {"site": site,"banners": banners,
              "menus": menus,"total_news": news,
              "ci": ci,"products": products, "newsc": newsc}
    if dir_name:
        target_dir = "%s/%s" %(target_dir, dir_name)
        if NewsCategory.objects.filter(dir_name=target_dir).first():
            if dir_name:
                template_names = target_dir
                template_name = template_names.split("/")[2]
            else:
                template_name = "new.html"
            return render_to_response(template_name,result)
    else:
        return render_to_response("new.html", result)


def cases(request, dir_name=None):
    """
        获取案例中心页面
    """

    basic_params = get_basic_params()

    # 获取案例
    category = CasesCategory.objects.filter(name=u"施工案例").first()
    case_page_info, cases = get_data_by_page(Cases, {"category": category})

    basic_params["case_page_info"] = case_page_info
    basic_params["cases"] = cases
    basic_params["new_cases"] = CasesCategory.objects.filter()
    basic_params["ci"] = CompanyInfo.objects.filter().first()

    target_dir = ""
    if dir_name:
        target_dir = "%s/%s" %(target_dir, dir_name)
        if CasesCategory.objects.filter(dir_name=target_dir).first():
            if dir_name:
                template_names = target_dir
                template_name = template_names.split("/")[2]
            else:
                template_name = "new_case.html"
            return render_to_response(template_name, basic_params)
    else:
        return render_to_response("new_case.html", basic_params)


def get_case_by_page(request, cate_name, page, per_page=10):
    """ 根据当前传入的参数来获取对应分页的结果 """
    cate_mapper = {"Products": Products,
                   "Cases": Cases}
    site = SiteConfig.objects.filter().first()
    # 传入的参数错误，则直接返回首页
    if not cate_name or not page:
        return http.HttpResponseRedirect(site.url)
    else:
        data, page_info = cate_mapper.get(cate_name)(int(page), int(per_page))

        basic_params = get_basic_params()
        basic_params["data"] = data
        basic_params["page_info"] = page_info
        return render_to_response("new_case.html", basic_params)


def get_news_by_id(request, id):
    """
        根据给定的id获取新闻信息

        @param id: 给定的新闻id
        @type id: Int

        :return: resp
    """
    site = SiteConfig.objects.filter().first()

    # 传入的参数错误，则直接返回首页
    news = News.objects.filter(id=id).first()
    if not news:
        return http.HttpResponseRedirect(site.url)
    else:
        basic_params = get_basic_params()
        basic_params["news"] = news
        return render_to_response("news_detail.html", basic_params)


def cpzx(request, city):
    """
        根据city来分页获取产品中心的信息

        @param request: 当前请求的request对象
        @type request: Django.Request
    """

def supply(request, dir_name=None):
    """
        获取产品展示页面
    """

    basic_params = get_basic_params()

    # 获取公司联系人信息
    basic_params["ci"] = CompanyInfo.objects.filter().first()

    # 更新产品信息
    prod_page_info, products = get_data_by_page(Products)
    basic_params["prod_page_info"] = prod_page_info
    basic_params["products"] = products

    target_dir = ""
    if dir_name:
        target_dir = "%s/%s" %(target_dir, dir_name)
        if NewsCategory.objects.filter(dir_name=target_dir).first():
            if dir_name:
                template_names = target_dir
                template_name = template_names.split("/")[2]
            else:
                template_name = "supply.html"
            return render_to_response(template_name, basic_params)
    else:
        return render_to_response("supply.html", basic_params)


def message(request):
    return render_to_response("MessageLeftMain.htm", locals())


def sitemap(request):
    """ 返回站点地图 """
    # 返回最近的1024条记录
    basic_params = get_basic_params()
    prod_page_info, products = get_data_by_page(Products, per_page=1024)

    basic_params["products"] = products
    return render_to_response("sitemap.html", basic_params)


def get_supply_by_page(request, page=1):
    """
        分页获取产品信息

        @param request: 当前请求的request对象
        @type request: Django.Request

        @param page: 当前页数
        @type page: Int

        :return:
    """
    basic_params = get_basic_params()

    # 获取案例
    category = CasesCategory.objects.filter(name=u"施工案例").first()
    basic_params["cases"] = Cases.objects.filter(category=category)
    basic_params["ci"] = CompanyInfo.objects.filter().first()

    # 更新产品信息
    prod_page_info, products = get_data_by_page(Products, page=page)
    basic_params["prod_page_info"] = prod_page_info
    basic_params["products"] = products

    return render_to_response("supply.html", basic_params)


def add_msg(request):
    """ 记录用户留言 """
    data = eval(request.body)
    username = data.get("username", "")
    telephone = data.get("telephone", "")
    email = data.get("email", "")
    content = data.get("content", "")

    msg, flag = UserMessage.objects.get_or_create(username=username,
                                                  telephone=telephone,
                                                  email=email,
                                                  content=content)

    if flag:
        msg.created_on = datetime.datetime.utcnow()

    return make_api_response()
