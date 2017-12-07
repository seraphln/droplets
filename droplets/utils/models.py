# coding=utf-8
#


"""
跟数据库交互的共用函数集合
"""

from droplets.news.models import NewsCategory
from droplets.products.models import CasesCategory
from droplets.products.models import ProductsCategory


def get_categories(cate_name, name=None):
    """
        获取分类

        @param cate_name: 分类名称
        @type cate_name: String

        @param name: 分类名
        @type name: String

        :return: {}
    """
    cate_mapper = {"case": (CasesCategory, u"工程案例"),
                   "supply": (ProductsCategory, u"产品中心"),
                   "news": (NewsCategory, u"公司新闻")}

    cls, default_name = cate_mapper.get(cate_name, (None, None))
    if not cls:
        return {}
    else:
        cate_dict = {}
        default_name = name or default_name

        par_cate = cls.objects.filter(name=default_name, is_online=True).first()
        categories = cls.objects.filter(parent_cate=par_cate, is_online=True)
        for cate in categories:
            cate_dict[cate] = cls.objects.filter(parent_cate=cate, is_online=True)

        return cate_dict
