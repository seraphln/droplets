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

from droplets.preview.models import Preview


BASE_DIR = "%s/droplets/templates/html/" % settings.BASE_DIR


def generate_index():
    """ 生成首页的多站静态页面 """

    # 创建目录
    path = BASE_DIR

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
        filename = "index_%s.html" % city
        with open(filename, "w") as fp:
            fp.write(resp.content)

        fpath = "%s%s" % (path, filename)
        Preview.objects.get_or_create(title=u"首页_%s" % city, url="index_%s.html" % city,
                                      fpath=fpath, content=resp.content, ptype=u"首页")

    resp = index(request, None)
    filename = "index.html"
    with open(filename, "w") as fp:
        fpath = "%s%s" % (path, filename)
        fp.write(resp.content)
        Preview.objects.get_or_create(title=u"首页", url="index.html",
                                      fpath=fpath, content=resp.content, ptype=u"首页")


def generate_products():
    """ 生成产品的多站静态页面 """
    # 创建目录
    path = BASE_DIR

    # 创建目录
    os.system("mkdir -p %s" % path)

    # 切换目录
    os.chdir(path)

    # 生成首页
    request = HttpRequest()

    lt = LongTailKeywords.objects.filter().first()
    cities = generate_pinyin_mapper(getattr(lt, "cities", ""))

    for city, _ in cities.iteritems():
        new_path = path + "supply_%s/" % city
        os.system("mkdir -p %s" % new_path)

        # 切换目录
        os.chdir(new_path)

        for product in Products.objects.filter():
            resp = get_products_by_id(request, product.id, city)

            filename = "%s.html" % product.id
            with open(filename, "w") as fp:
                fpath = "%s%s" % (new_path, filename)
                fp.write(resp.content)
                Preview.objects.get_or_create(title=u"产品_%s" % product.title,
                                              fpath=fpath, url="/products/%s.html" % product.id,
                                              content=resp.content, ptype=u"产品")

    # 生成分页静态页面
    for city, _ in cities.iteritems():
        new_path = path + "supply_%s/" % city

        # 切换目录
        os.chdir(new_path)

        products = Products.objects.filter()

        for i in range(1, int(math.ceil(products.count()/float(10)))+1):
            resp = get_products_by_page(request, None, "Products",
                                        page=i, cur_city=city)
            filename = "Products_%s.html" % i
            with open(filename, "w") as fp:
                fp.write(resp.content)
                fpath = "%s%s" % (new_path, filename)
                Preview.objects.get_or_create(title=u"产品_%s_%s" % (product.title, city),
                                              fpath=fpath, url="/Products_%s.html" % product.id,
                                              content=resp.content, ptype=u"产品")



def generate_cases():
    """ 生成案例的静态页面 """
    # 先生成每一个案例的静态页面
    request = HttpRequest()

    path = BASE_DIR + "cases/"

    # 创建目录
    os.system("mkdir -p %s" % path)

    # 切换目录
    os.chdir(path)
    for cur_news in Cases.objects.filter():
        resp = get_case_by_id(request, 1)
        filename = "%s.html" % cur_news.id
        with open(filename, "w") as fp:
            fp.write(resp.content)

            fpath = "%s%s" % (path, filename)
            Preview.objects.get_or_create(title=u"案例_%s" % cur_news.title,
                                          fpath=fpath, url="/cases/%s.html" % cur_news.id,
                                          content=resp.content, ptype=u"案例")


def generate_news():
    """ 生成新闻的静态页面 """
    # 先生成每一个新闻的静态页面
    request = HttpRequest()

    path = BASE_DIR + "news/"

    # 创建目录
    os.system("mkdir -p %s" % path)

    # 切换目录
    os.chdir(path)
    for cur_news in News.objects.filter():
        resp = get_news_by_id(request, 1)
        filename = "%s.html" % cur_news.id
        with open(filename, "w") as fp:
            fp.write(resp.content)

            fpath = "%s%s" % (path, filename)
            Preview.objects.get_or_create(title=u"新闻_%s" % cur_news.title,
                                          fpath=fpath,
                                          url="/news/%s.html" % cur_news.id,
                                          content=resp.content, ptype=u"案例")


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