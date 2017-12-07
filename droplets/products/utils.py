# coding=utf-8
#


"""
产品页面的共有函数
"""

from droplets.products.models import Cases
from droplets.products.models import Products
from droplets.products.models import CasesCategory
from droplets.products.models import ProductsCategory


def get_case_categories(name=None):
    """ 获取案例的分类列表 """
    cate_dict = {}
    if not name:
        par_cate = CasesCategory.objects.filter(name=u"工程案例").first()
    else:
        par_cate = CasesCategory.objects.filter(name=name).first()
    categories = CasesCategory.objects.filter(parent_cate=par_cate)
    for cate in categories:
        cate_dict[cate] = CasesCategory.objects.filter(parent_cate=cate)

    return cate_dict


def get_products_categories():
    """ 获取产品的分类列表 """
    cate_dict = {}
    par_cate = ProductsCategory.objects.filter(name=u"产品中心").first()
    categories = ProductsCategory.objects.filter(parent_cate=par_cate)
    for cate in categories:
        cate_dict[cate] = ProductsCategory.objects.filter(parent_cate=cate)

    return cate_dict
