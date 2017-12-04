# coding=utf-8
#


"""
将CMS系统中的动态请求批量生成静态HTML文件

需要特殊处理的地方：
1. 多站的首页
2. 多站的产品列表
3. 案例
4. 新闻
5. 关于我们页面
"""

import os
import math
from xpinyin import Pinyin

from django.conf import settings
from django.http import HttpRequest

from droplets.dphome.views import index

from droplets.news.models import News

from droplets.news.views import news
from droplets.news.views import get_news_by_id
from droplets.news.views import get_news_by_page

from droplets.products.models import Cases
from droplets.products.models import Products
from droplets.products.views import get_case_by_id
from droplets.products.views import get_products_by_id
from droplets.products.views import get_products_by_page

from droplets.seo.models import LongTailKeywords
from droplets.seo.utils import generate_pinyin_mapper


BASE_DIR = "%s/droplets/scripts/html/" % settings.BASE_DIR


def generate_index():
    """ 生成首页的多站静态页面 """

    # 创建目录
    path = "%s/" % BASE_DIR

    # 创建目录
    os.system("mkdir -p %s" % path)

    # 切换目录
    os.chdir(path)

    # 生成首页
    request = HttpRequest()

    lt = LongTailKeywords.objects.filter().first()
    cities = generate_pinyin_mapper(getattr(lt, "cities", ""))

    for city, _ in cities.iteritems():
        resp = index(request, city)
        with open("index_%s.html" % city, "w") as fp:
            fp.write(resp.content)

    resp = index(request, None)
    with open("index.html", "w") as fp:
        fp.write(resp.content)


def generate_products():
    """ 生成产品的多站静态页面 """
    # 创建目录
    path = "%s/" % BASE_DIR

    # 创建目录
    os.system("mkdir -p %s" % path)

    # 切换目录
    os.chdir(path)

    # 生成首页
    request = HttpRequest()

    lt = LongTailKeywords.objects.filter().first()
    cities = generate_pinyin_mapper(getattr(lt, "cities", ""))

    for city, _ in cities.iteritems():
        new_path = "%s/supply_%s" % (path, city)
        os.system("mkdir -p %s" % new_path)

        # 切换目录
        os.chdir(new_path)

        for product in Products.objects.filter():
            resp = get_products_by_id(request, product.id, city)

            with open("%s.html" % product.id, "w") as fp:
                fp.write(resp.content)

    # 生成分页静态页面
    for city, _ in cities.iteritems():
        new_path = "%s/supply_%s" % (path, city)

        # 切换目录
        os.chdir(new_path)

        products = Products.objects.filter()

        for i in range(1, int(math.ceil(products.count()/float(10)))+1):
            resp = get_products_by_page(request, None, "Products",
                                        page=i, cur_city=city)
            with open("Products_%s.html" % i, "w") as fp:
                fp.write(resp.content)


def generate_cases():
    """ 生成案例的静态页面 """
    # 先生成每一个案例的静态页面
    request = HttpRequest()

    path = "%s/cases/" % BASE_DIR

    # 创建目录
    os.system("mkdir -p %s" % path)

    # 切换目录
    os.chdir(path)
    for cur_news in Cases.objects.filter():
        resp = get_case_by_id(request, 1)
        with open("%s.html" % cur_news.id, "w") as fp:
            fp.write(resp.content)


def generate_news():
    """ 生成新闻的静态页面 """
    # 先生成每一个新闻的静态页面
    request = HttpRequest()

    path = "%s/news/" % BASE_DIR

    # 创建目录
    os.system("mkdir -p %s" % path)

    # 切换目录
    os.chdir(path)
    for cur_news in News.objects.filter():
        resp = get_news_by_id(request, 1)
        with open("%s.html" % cur_news.id, "w") as fp:
            fp.write(resp.content)


def generate_about():
    """ 生成关于我们的静态页面 """
    pass


def backend():
    generate_index()
    generate_products()
    generate_cases()
    generate_news()
    #generate_about()


if __name__ == "__main__":
    backend()