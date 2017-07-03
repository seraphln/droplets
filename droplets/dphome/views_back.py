# coding=utf-8
#

"""
测试用的接口
后续页面都会渲染成静态页面
"""


from django.shortcuts import render
from django.shortcuts import render_to_response

from droplets.seo.models import HotKeywords
from droplets.seo.models import LongTailKeywords
from droplets.news.models import News
from droplets.dphome.models import Links
from droplets.dphome.models import Menus
from droplets.dphome.models import Banners
from droplets.dphome.models import SiteConfig
from droplets.dphome.models import CompanyInfo
from droplets.products.models import Cases
from droplets.products.models import Products

from droplets.seo.utils import generate_pinyin_mapper
from droplets.dphome.utils import get_and_format_site


def index(request, city=None):
    """ 渲染网站首页 """
    site = get_and_format_site(request, city)
    banners = Banners.objects.filter()
    news = News.objects.filter()
    hot_keywords = HotKeywords.objects.filter()
    cases = Cases.objects.filter(title=u"施工案例")
    menus = Menus.objects.filter()
    ci = CompanyInfo.objects.filter().first()
    products = Products.objects.filter()[:10]
    links = Links.objects.filter()
    lt = LongTailKeywords.objects.filter().first()
    subsites = generate_pinyin_mapper(lt.cities)
    return render_to_response("index.html",
                              {"site": site,
                               "banners": banners,
                               "hot_keywords": hot_keywords,
                               "menus": menus,
                               "total_news": news,
                               "ci": ci,
                               "products": products,
                               "links": links,
                               "subsites": subsites,
                               "city": city or u"BeiJing",
                               "cases": cases})

def about(request, path=None):
    """ 渲染关于我们"""
    site = SiteConfig.objects.filter().first()
    banners = Banners.objects.filter()
    news = News.objects.filter()
    hot_keywords = HotKeywords.objects.filter()
    cases = Cases.objects.filter(title=u"施工案例")
    menus = Menus.objects.filter()
    ci = CompanyInfo.objects.filter().first()
    products = Products.objects.filter()[:10]
    return render_to_response("about.html",
                              {"site": site,
                               "banners": banners,
                               "hot_keywords": hot_keywords,
                               "menus": menus,
                               "total_news": news,
                               "ci": ci,
                               "products": products,
                               "cases": cases})


def message(request):
    return render_to_response("MessageLeftMain.htm", locals())
