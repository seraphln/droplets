# coding=utf-8
#

from django import http
from django.shortcuts import render
from django.shortcuts import render_to_response

from droplets.dphome.models import CompanyInfo

from droplets.dphome.models import SiteConfig

from droplets.products.models import Cases
from droplets.products.models import Products
from droplets.products.models import CasesCategory
from droplets.products.models import ProductsCategory

from droplets.dphome.utils import get_basic_params
from droplets.dphome.utils import get_data_by_page
from droplets.dphome.utils import get_prev_and_next_page

from droplets.seo.models import LongTailKeywords
from droplets.seo.utils import generate_pinyin_mapper
from droplets.seo.utils import do_generate_product_name


def products(request, cur_city=None, dir_name=None):
    """
        获取产品展示页面

        @param request: 当前请求的request对象
        @type request: django.request

        @param dir_name: 当前目录的dir_name
        @type dir_name: String

        :return: rener_to_response("cases/cases.html")
    """

    basic_params = get_basic_params()
    basic_params.update({"products_categories": ProductsCategory.objects.filter()})

    if dir_name:
        cate = ProductsCategory.objects.filter(dir_name=dir_name).first()
        basic_params["cur_cate"] = cate
        query_dict = {"category": cate.id}
    else:
        query_dict = {}

    products_page_info, products = get_data_by_page(Products, query_dict)

    lt = LongTailKeywords.objects.filter().first()
    pinyin_mapper = generate_pinyin_mapper(lt.cities)
    products = do_generate_product_name(products, cur_city)

    basic_params.update({"products_page_info": products_page_info,
                         "cur_city_name": pinyin_mapper.get(cur_city, u"北京"),
                         "cur_city": cur_city or "BeiJing",
                         "products": products})

    return render_to_response("products/products.html", basic_params)


def cases(request, dir_name=None):
    """
        获取案例相关信息

        @param request: 当前请求的request对象
        @type request: django.request

        @param dir_name: 当前目录的dir_name
        @type dir_name: String

        :return: rener_to_response("cases/cases.html")
    """
    basic_params = get_basic_params()

    basic_params.update({"case_categories": CasesCategory.objects.filter(),
                         "ci": CompanyInfo.objects.filter().first()})

    # 有dir_name的时候，用dir_name来获取分类信息
    if dir_name:
        cate = CasesCategory.objects.filter(dir_name=dir_name).first()
        query_dict = {"category": cate.id}
        basic_params["cur_cate"] = cate
    else:
        query_dict = {}

    case_page_info, cases = get_data_by_page(Cases, query_dict)
    basic_params.update({"case_page_info": case_page_info,
                         "cases": cases})

    return render_to_response("cases/cases.html", basic_params)


def get_products_by_id(request, cid, cur_city=None):
    """
        根据传入的产品id来获取对应的详细信息

        @param request: 当前请求的request对象
        @type request: django.request

        @param cid: 当前产品的id
        @type cid: Int

        @param cur_city: 当前城市
        @type cur_city: String

        :return: rener_to_response("case_detail.html")
    """

    basic_params = get_basic_params()

    products = Products.objects.filter(id=int(cid)).first()
    prev_prod, next_prod = get_prev_and_next_page(Products, cid)
    prev_prod = do_generate_product_name([prev_prod, ], cur_city)[0]
    next_prod = do_generate_product_name([next_prod, ], cur_city)[0]
    products = do_generate_product_name([products,], cur_city)[0]

    lt = LongTailKeywords.objects.filter().first()
    pinyin_mapper = generate_pinyin_mapper(lt.cities)
    basic_params.update({"products_categories": ProductsCategory.objects.filter(),
                         "products": products,
                         "cur_cate": products.category,
                         "prev_prod": prev_prod,
                         "next_prod": next_prod,
                         "cur_city_name": pinyin_mapper.get(cur_city, u"北京"),
                         "cur_city": cur_city or "BeiJing",
                         "ci": CompanyInfo.objects.filter().first()})

    return render_to_response("products/products_detail.html", basic_params)


def get_case_by_id(request, cid):
    """
        根据传入的case id来获取对应的详细信息

        @param request: 当前请求的request对象
        @type request: django.request

        @param cid: 当前案例的id
        @type cid: Int

        :return: rener_to_response("case_detail.html")
    """
    basic_params = get_basic_params()

    case = Cases.objects.filter(id=int(cid)).first()
    prev_case, next_case = get_prev_and_next_page(Cases, cid)

    basic_params.update({"case_categories": CasesCategory.objects.filter(),
                         "case": case,
                         "cur_cate": case.category,
                         "prev_case": prev_case,
                         "next_case": next_case,
                         "ci": CompanyInfo.objects.filter().first()})

    return render_to_response("cases/case_detail.html", basic_params)


def get_case_by_page(request, cate_name, page, per_page=10, dir_name=None):
    """
        根据当前传入的参数来获取对应分页的结果

        @param request: 当前请求的request对象
        @type request: django.request

        @param dir_name: 当前的分类信息
        @type dir_name: String

        @param cate_name: 当前分页的分类
        @type cate_name: String

        @param page: 当前页数
        @type page: Int

        @param per_page: 每页数量
        @type per_page: Int

        :return:
    """
    cate_mapper = {"Products": Products,
                   "Cases": Cases}

    site = SiteConfig.objects.filter().first()
    # 传入的参数错误，则直接返回首页
    if not cate_name or not page:
        return http.HttpResponseRedirect(site.url)
    else:
        # 有dir_name的时候，用dir_name来获取分类信息
        if dir_name:
            cate = CasesCategory.objects.filter(dir_name=dir_name).first()
            query_dict = {"category": cate.id}
            basic_params["cur_cate"] = cate
        else:
            query_dict = {}

        basic_params = get_basic_params()

        page_info, cases = get_data_by_page(cate_mapper.get(cate_name),
                                            query_dict,
                                            page=int(page),
                                            per_page=int(per_page))

        #cases = do_generate_product_name(cases, cur_city)

        basic_params.update({"case_categories": CasesCategory.objects.filter(),
                             "case_page_info": page_info,
                             "cases": cases,
                             "ci": CompanyInfo.objects.filter().first()})

        return render_to_response("cases/cases.html", basic_params)


def get_products_by_page(request, dir_name, cate_name=None, page=1, per_page=10, cur_city=None):
    """
        分页获取产品信息
    """
    cate_mapper = {"Products": Products,
                    "Cases": Cases}

    site = SiteConfig.objects.filter().first()

    if dir_name:
        cate = ProductsCategory.objects.filter(dir_name=dir_name).first()
    else:
        cate = ProductsCategory.objects.filter().first()

    basic_params = get_basic_params()
    query_dict = {"category": cate.id}
    basic_params["cur_cate"] = cate

    page_info, products = get_data_by_page(cate_mapper.get(cate_name),
                                           query_dict,
                                           page=int(page),
                                           per_page=int(per_page))

    lt = LongTailKeywords.objects.filter().first()
    pinyin_mapper = generate_pinyin_mapper(lt.cities)
    products = do_generate_product_name(products, cur_city)

    basic_params.update({"products_categories": ProductsCategory.objects.filter(),
                         "products_page_info": page_info,
                         "products": products,
                         "cur_city_name": pinyin_mapper.get(cur_city, u"北京"),
                         "cur_city": cur_city or "BeiJing",
                         "ci": CompanyInfo.objects.filter().first()})

    return render_to_response("products/products.html", basic_params)
