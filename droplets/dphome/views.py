# coding=utf8
#

"""
测试用的接口
后续页面都会渲染成静态页面
"""


from django.shortcuts import render
from django.shortcuts import render_to_response

from droplets.seo.models import HotKeywords
from droplets.news.models import News
from droplets.dphome.models import Menus
from droplets.dphome.models import Banners
from droplets.dphome.models import SiteConfig
from droplets.dphome.models import CompanyInfo
from droplets.products.models import Cases
from droplets.products.models import Products


def index(request):
    """ 渲染网站首页 """
    site = SiteConfig.objects.filter().first()
    banners = Banners.objects.filter()
    news = News.objects.filter()
    hot_keywords = HotKeywords.objects.filter()
    cases = Cases.objects.filter(title=u"施工案例")
    menus = Menus.objects.filter()
    ci = CompanyInfo.objects.filter().first()
    products = Products.objects.filter()[:10]
    return render_to_response("index.html",
                              {"site": site,
                               "banners": banners,
                               "hot_keywords": hot_keywords,
                               "menus": menus,
                               "total_news": news,
                               "ci": ci,
                               "products": products,
                               "cases": cases})
