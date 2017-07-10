# coding=utf-8
#

"""
测试用的接口
后续页面都会渲染成静态页面
"""

import time
import datetime

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
    """ 关于我们的页面 """
    basic_params = get_basic_params()

    # 取出产品中心的导航
    cur_menu = Menus.objects.filter(name=u"产品中心", is_root=True).first()
    cates = Menus.objects.filter(parent_cate=cur_menu)

    basic_params["cates"] = cates

    target_dir = "/about"

    if dir_name:
        target_dir = "%s/%s" %(target_dir, dir_name)

    if Menus.objects.filter(dir_name=target_dir).first():
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


def sceneImgUpload(request):
    """ ckeditor用到的上传图片功能 """
    if request.method == 'POST':
        callback = request.GET.get('CKEditorFuncNum')
        try:
            url_path = "static/uploads/" + time.strftime("%Y%m%d%H%M%S",time.localtime())
            path = "droplets/static/uploads/" + time.strftime("%Y%m%d%H%M%S",time.localtime())
            f = request.FILES["upload"]
            file_name = path + "_" + f.name
            des_origin_f = open(file_name, "wb+")
            for chunk in f.chunks():
                des_origin_f.write(chunk)
            des_origin_f.close()
        except Exception, e:
            print e
        url_name = url_path + "_" + f.name
        res = "<script>window.parent.CKEDITOR.tools.callFunction("+callback+",'/"+url_name+"', '');</script>"
        print res
        return HttpResponse(res)
    else:
        raise Http404()
