# coding=utf-8
#

from django.shortcuts import render_to_response

from droplets.products.models import Products
from droplets.dphome.utils import get_data_by_page


def ads(request):
    """
    获取广告位相关数据
    """
    _, products = get_data_by_page(Products, {"is_recommend": True})
    return render_to_response("ads.html", {"ads": products})