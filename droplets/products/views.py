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

from droplets.dphome.utils import get_basic_params
from droplets.dphome.utils import get_data_by_page


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
    else:
        cate = CasesCategory.objects.filter(name=u"施工案例").first()

    query_dict = {"category": cate.id}
    basic_params["cur_cate"] = cate

    case_page_info, cases = get_data_by_page(Cases, query_dict)
    basic_params.update({"case_page_info": case_page_info,
                         "cases": cases})

    return render_to_response("cases/cases.html", basic_params)


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
    basic_params.update({"case_categories": CasesCategory.objects.filter(),
                         "case": case,
                         "cur_cate": case.category,
                         "ci": CompanyInfo.objects.filter().first()})

    return render_to_response("cases/case_detail.html", basic_params)


def get_case_by_page(request, dir_name, cate_name, page, per_page=10):
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
        else:
            cate = CasesCategory.objects.filter(name=u"施工案例").first()

        basic_params = get_basic_params()
        query_dict = {"category": cate.id}
        basic_params["cur_cate"] = cate

        page_info, cases = get_data_by_page(cate_mapper.get(cate_name),
                                            query_dict,
                                            page=int(page),
                                            per_page=int(per_page))

        basic_params.update({"case_categories": CasesCategory.objects.filter(),
                             "case_page_info": page_info,
                             "cases": cases,
                             "ci": CompanyInfo.objects.filter().first()})

        return render_to_response("cases/cases.html", basic_params)
