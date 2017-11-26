# coding=utf-8
#

"""
测试用的接口
后续页面都会渲染成静态页面
"""

import time
import datetime

from xpinyin import Pinyin

from django import http
from django.shortcuts import render
from django.shortcuts import Http404
from django.shortcuts import HttpResponse
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
from droplets.products.models import ProductsCategory

from droplets.seo.utils import generate_pinyin_mapper

from droplets.dphome.utils import make_api_response
from droplets.dphome.utils import get_basic_params
from droplets.dphome.utils import get_and_format_site
from droplets.dphome.utils import get_data_by_page


from droplets.seo.utils import do_generate_product_name


def get_cur_city(city):
    """
        根据传入的city，获取city的name和city
    """
    lt = LongTailKeywords.objects.filter().first()

    cities = getattr(lt, "cities", "").split(",")
    default_city = cities[0] if len(cities) else ""

    cur_city_name, cur_city = "", ""

    pinyin = Pinyin()
    cur_pinyin = pinyin.get_pinyin(default_city)
    cur_city = "".join(map(lambda x: x.capitalize(), cur_pinyin.split("-")))

    pinyin_mapper = generate_pinyin_mapper(getattr(lt, "cities", ""))

    cur_city = city or cur_city
    cur_city_name = pinyin_mapper.get(cur_city, u"")

    return cur_city_name, cur_city


def index(request, city=None):
    """ 渲染网站首页 """
    basic_params = get_basic_params()
    basic_params["site"] = get_and_format_site(request, city)

    basic_params["cases"] = Cases.objects.filter()[:10]

    from droplets.products.views import get_products_categories
    basic_params.update({"products_categories": get_products_categories()})

    # 更新产品信息
    prod_page_info, products = get_data_by_page(Products)
    basic_params["products"] = do_generate_product_name(products, city)

    # 获取链接信息
    links_page_info, links = get_data_by_page(Links)
    basic_params["links"] = links

    # 获取新闻信息
    news_categories = NewsCategory.objects.filter()[:2]
    news_dict = {}
    for new_cate in news_categories:
        _, news = get_data_by_page(News, {"category": new_cate}, reverse=False)
        news_dict[new_cate] = news

    news_cate = NewsCategory.objects.filter(dir_name="hydt").first()
    _, hydt_news = get_data_by_page(News, {"category": news_cate}, reverse=False)

    basic_params["total_news"] = news_dict

    lt = LongTailKeywords.objects.filter().first()

    cur_city_name, cur_city = get_cur_city(city)
    pinyin_mapper = generate_pinyin_mapper(getattr(lt, "cities", ""))

    basic_params.update({"subsites": pinyin_mapper,
                         "cur_city_name": cur_city_name,
                         "hydt_news": hydt_news,
                         "cur_city": cur_city})

    # 处理多站
    return render_to_response("index.html", basic_params)


def about(request, dir_name=None):
    """ 关于我们的页面 """
    basic_params = get_basic_params()

    # 取出产品中心的导航
    cur_menu = Menus.objects.filter(name=u"产品中心", is_root=True).first()
    cates = Menus.objects.filter(parent_cate=cur_menu)

    target_dir = "/about"

    if dir_name:
        target_dir = "%s/%s" %(target_dir, dir_name)

    menu = Menus.objects.filter(dir_name=target_dir).first()
    basic_params.update({"cates": cates, "menu": menu})
    if menu:
        if dir_name:
            template_names = target_dir
            template_name = template_names.split("/")[2]
        else:
            template_name = "about.html"
        return render_to_response(template_name, basic_params)
    else:
        return http.HttpResponseRedirect(site.url)


def message(request):
    return render_to_response("MessageLeftMain.htm", locals())


def sitemap(request):
    """ 返回站点地图 """
    # 返回最近的1024条记录
    basic_params = get_basic_params()
    prod_page_info, products = get_data_by_page(Products, per_page=1024)

    basic_params["products"] = products
    return render_to_response("sitemap.html", basic_params)


def get_supply_by_page(request, page=1, cur_city=None):
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
    products = do_generate_product_name(products, cur_city)
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


def sceneImgUpload(request):
    """ ckeditor用到的上传图片功能 """
    if request.method == 'POST':
        callback = request.GET.get('CKEditorFuncNum')
        try:
            url_path = "static/uploads/" + time.strftime("%Y%m%d%H%M%S",time.localtime())
            path = "droplets/static/uploads/" + time.strftime("%Y%m%d%H%M%S",time.localtime())
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


def supplyproducts(request):
    """ 二次开发示例 """
    basic_params = get_basic_params()
    basic_params.update({"products_categories": ProductsCategory.objects.filter()})

    query_dict = {}

    cur_city = "BeiJing"
    products_page_info, products = get_data_by_page(Products, query_dict)

    lt = LongTailKeywords.objects.filter().first()
    pinyin_mapper = generate_pinyin_mapper(lt.cities)
    products = do_generate_product_name(products, cur_city)

    basic_params.update({"products_page_info": products_page_info,
                         "cur_city_name": pinyin_mapper.get(cur_city, u"北京"),
                         "cur_city": cur_city or "BeiJing",
                         "products": products})

    return render_to_response("supplyproducts/index.html", basic_params)
