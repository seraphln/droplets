# coding=utf-8
#


"""
dphome首页用到的公共函数集合
"""

import json
import urllib2
from django.http import HttpResponse

from droplets.seo.utils import generate_meta

from droplets.dphome.models import SiteConfig

from droplets.news.models import News
from droplets.seo.models import HotKeywords

from droplets.dphome.models import Menus
from droplets.dphome.models import Banners
from droplets.dphome.models import CompanyInfo

from droplets.news.models import NewsCategory
from droplets.products.models import ProductsCategory
from droplets.products.models import CasesCategory


def get_and_format_site(request, city):
    """
        获取并预处理site信息
        预处理包括: site.title, site.keywords, site.desc

        @param request: 当前请求的对象
        @type request: django.HttpRequest

        @param city: 当前请求中带的城市
        @type city: String

        :return: site
    """
    site = SiteConfig.objects.filter().first()
    site = generate_meta(request, site, city)

    return site


def get_footer(footer):

    case_foot = CasesCategory.objects.filter(parent_cate=footer)
    if case_foot:
        return case_foot
    menus_foot = Menus.objects.filter(parent_cate=footer)
    if menus_foot:
        return menus_foot
    product_foot = ProductsCategory.objects.filter(parent_cate=footer)
    if product_foot:
        return product_foot
    new_foot = NewsCategory.objects.filter(parent_cate=footer)
    if new_foot:
        return new_foot
    return []


def format_footer_url(footer, foot_cates):
    """
        格式化footer的url

        @param footer: 当前的主分类
        @type footer: Menus

        @param foot_cates: 对应的自分类列表
        @type foot_cates: List

        :return: foot_cates
    """

    for foot_cate in foot_cates:
        if "about" not in footer.dir_name:
            url = urllib2.urlparse.urljoin(footer.dir_name, foot_cate.dir_name)
        else:
            url = footer.dir_name

        setattr(foot_cate, "url", url)

    return foot_cates


def get_basic_params(city=None):
    """ 获取渲染页面需要的基础数据 """
    site = SiteConfig.objects.filter().first()
    banners = Banners.objects.filter()
    news = News.objects.filter()
    menus = Menus.objects.filter(is_root=True).order_by("-customized_seq")
    menus_foot = Menus.objects.filter(is_foot=True)
    ci = CompanyInfo.objects.filter().first()
    hot_keywords = HotKeywords.objects.filter()
    news_categories = NewsCategory.objects.filter()
    products_categories = ProductsCategory.objects.filter()

    root_dict = []
    for menu in menus:
        root_dict.append((menu,
                          format_footer_url(menu,
                                            Menus.objects.filter(parent_cate=menu))))

    footers_dict = {}
    for footer in menus_foot:
        footers_dict[footer] = format_footer_url(footer, get_footer(footer))

    return {"site": site,
            "banners": banners,
            "news": news,
            "hot_keywords": hot_keywords,
            "menus": menus,
            "menus_foot": menus_foot,
            "root_dict": root_dict,
            "ci": ci,
            "news_categories":news_categories,
            "footers_dict": footers_dict,
            "products_categories":products_categories}


def get_data_by_page(model_cls, query_dict={}, page=1,
                     per_page=10, order_by="created_on", reverse=True):
    """
        分页获取传入的对象的数据

        @param model_cls: 需要获取数据的model对象
        @type model_cls: Django.Models

        @param query_dict: 查询用的记录
        @type query_dict: Dict

        @param page: 当前需要获取的页数
        @type page: Int

        @param per_page: 当前每页最大获取数据量
        @type per_page: Int

        @param order_by: 按照指定关键词排序
        @type order_by: String

        @param reverse: 正序/逆序
        @type reverse: Boolean

        :return: page_info, data
    """
    page_info = {}

    # 更新每页信息
    per_page = [per_page, 10][per_page < 1]

    data = model_cls.objects.filter(**query_dict)
    total_count = data.count()

    page_sum, rem = divmod(total_count, per_page)
    page_sum += [1, 0][rem == 0]

    page = [page, 1][page < 1 or page > page_sum]

    order_by = order_by if reverse else "-%s" % order_by
    data = data.order_by(order_by)
    data = data[(page-1)*per_page: page*per_page]

    page_info = {"per_page": per_page,
                 "page": page,
                 "total_page": page_sum,
                 "total_count": total_count,
                 "order_by": order_by,
                 "pre_page": page - 1 if page > 1 else page,
                 "next_page": page + 1 if page < page_sum else page_sum}

    return page_info, data


def make_api_response(result=None, page_info=None, message=""):
    """
        构造api结构的返回
        结构大致如下:
            {success: True/False,
            message: error message,
            data: result,
            result_info: result_info}
    """
    ret = {"success": len(message) == 0,
           "errors": [],
           "message": message,
           "data": result}

    if page_info:
        ret.update({"page_info": page_info})

    resp = HttpResponse(json.dumps(ret), content_type="application/json")
    return resp


def get_prev_and_next_page(model_cls, cid):
    """
        获取当前页面的上一页面和下一页面

        @param model_cls: 当前页面所属对象
        @type model_cls: django.models

        @param cid: 当前的id
        @type cid: Int

        :return: (model_cls_instance, model_cls_instance)
    """

    cid = int(cid)
    prev_data = model_cls.objects.filter(id__lt=cid).order_by("-id").first()
    next_data = model_cls.objects.filter(id__gt=cid).first()

    return prev_data, next_data


def format_dir_name(dir_name):
    """
        格式化dir_name
    """
    if not dir_name.startswith("/"):
        dir_name = "/" + dir_name
    if not dir_name.endswith("/"):
        dir_name = dir_name + "/"

    return dir_name

