# coding=utf-8
#

from django.shortcuts import render_to_response

from droplets.products.models import Products
from droplets.dphome.utils import get_data_by_page
from droplets.dphome.views import get_cur_city

from droplets.news.models import News


def ads(request, cur_city=None, dir_name=None):
    """
        获取广告位相关数据

        @param request: 当前请求的request对象实例
        @type request: Django.Request

        @param cur_city: 当前城市
        @type cur_city: String

        @param dir_name: 当前请求的目录
        @type dir_name: String
    """
    ad_type = request.GET.get("ad_type", "prod")
    cur_city_name, cur_city = get_cur_city(cur_city)
    res_dict = {"cur_city": cur_city, "cur_city_name": cur_city_name,
                "products": None, "news": None}

    if ad_type == "prod":
        _, products = get_data_by_page(Products, {"is_recommend": True})
        res_dict["products"] = products
    else:
        _, news = get_data_by_page(News, {"is_recommend": True})
        res_dict["news"] = news

    return render_to_response("ads.html", res_dict)