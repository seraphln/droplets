# coding=utf-8
#

from django.shortcuts import render_to_response

from droplets.products.models import Products
from droplets.dphome.utils import get_data_by_page
from droplets.dphome.views import get_cur_city


def ads(request, cur_city=None, dir_name=None):
    """
    获取广告位相关数据
    """
    cur_city_name, cur_city = get_cur_city(cur_city)
    _, products = get_data_by_page(Products, {"is_recommend": True})
    return render_to_response("ads.html", {"ads": products, "cur_city": cur_city, "cur_city_name": cur_city_name})