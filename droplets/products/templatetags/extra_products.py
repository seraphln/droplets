# coding=utf8
#


"""
产品相关的templatetags
"""


from django import template

from droplets.products.models import Products
from droplets.products.models import ProductsCategory
from droplets.utils.models import get_categories

from droplets.dphome.views import get_cur_city
from droplets.dphome.utils import get_data_by_page
from droplets.seo.utils import do_generate_product_name


register = template.Library()


@register.inclusion_tag('products/cate.html', takes_context=True)
def get_root_cate(context):
    """ 获取产品页面左侧的分类信息 """

    products_categories = get_categories("supply")
    return {"products_categories": products_categories}


@register.inclusion_tag('products/extra_products.html', takes_context=True)
def get_products_by_tag(context, dir_name=None, city=None, length=10):
    """
    根据分类来获取对应的产品信息
    """
    if dir_name:
        cate = ProductsCategory.objects.filter(dir_name=dir_name).first()
        query_dict = {"category": cate.id}
    else:
        cate = None
        query_dict = {}

    cur_city_name, cur_city = get_cur_city(city)
    products_page_info, products = get_data_by_page(Products, query_dict, per_page=int(length))
    products = do_generate_product_name(products, cur_city)

    return {"products_page_info": products_page_info,
            "cur_city_name": cur_city_name,
            "cur_city": cur_city,
            "cur_cate": cate,
            "products": products}
