# coding=utf-8
#


"""
项目用到的装饰器相关
"""

import os

try:
    from functools import wraps
except ImportError:
    from django.utils.functional import wraps

from django.conf import settings
from django.shortcuts import render_to_response


def generate_products(request, *args, **kwargs):
    return False, None


def generate_index(request, *args, **kwargs):
    """ 检查首页是否已经生成静态页面 """
    if "city" in kwargs:
        name = "index_%s.html" % kwargs.get("city")
    else:
        name = "index.html"

    path = "%s/droplets/templates/html/" % settings.BASE_DIR
    path = "%s%s" % (path, name)

    if os.path.isfile(path):
        return True, render_to_response("html/%s" % name, locals())
    else:
        return False, None


def generate_news(request, *args, **kwargs):
    """ 检查新闻页面是否存在，如果存在，则返回新闻页面 """
    cid = kwargs.get("cid")
    path = "%s/droplets/templates/html/news/" % settings.BASE_DIR
    path = "%s%s.html" % (path, cid)

    if os.path.isfile(path):
        return True, render_to_response("html/news/%s" % name, locals())
    else:
        return False, None


def check_static_files(function=None):
    """
        检查给定的目录是否有已经生成好的静态页面
        如果有，则返回静态页面，否则函数继续执行
    """
    function_mapper = {"index": generate_index,
                       "products": generate_products,
                       "get_news_by_id": generate_news,}
    @wraps(function)
    def decorator(request, *args, **kwargs):
        """ """
        fname = function.func_name
        flag, ret = function_mapper[fname](request, args, kwargs)
        if flag and settings.USE_STATIC_HTML:
            return ret
        else:
            return function(request, *args, **kwargs)

    return decorator


def check_cate(function=None):
    """
    检查给定的类别是否在已有的类别列表里
    """
    @wraps(function)
    def decorator(request, cate, pid=None, cur_city=None, *args, **kwargs):
        """ """
        from droplets.products.models import Cases, CasesCategory
        from droplets.products.models import Products, ProductsCategory
        from droplets.news.models import News, NewsCategory
        from droplets.about.models import Abouts, AboutCategory

        cate_mapper = {"supply": (Cases, CasesCategory, "cases/cases.html", "cases/case_detail.html"),
                       "case": (Products, ProductsCategory, "products/products.html", "products/product_detailf.html"),
                       "about": (Abouts, AboutCategory, "about/about.html", "about/about_detail.html"),
                       "news": (News, NewsCategory, "news/news.html", "news/news_detail.html")}

        model_cls, cate_cls, template_list, template_detail = cate_mapper.get(cate, {})
        if not cate_cls:
            return redirect("/")
        else:
            data = getattr(request, "data", {})
            data.update({"cate_cls": cate_cls,
                         "model_cls": model_cls,
                         "template_list": template_list,
                         "template_detail": template_detail})
            setattr(request, "data", data)
            return function(request, cate=cate, pid=pid, cur_city=cur_city, *args, **kwargs)

    return decorator