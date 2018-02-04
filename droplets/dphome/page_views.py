# coding=utf8
#


"""
page相关的页面
"""

from django.shortcuts import render_to_response

from droplets.utils.decorators import check_cate

from droplets.dphome.views import get_cur_city
from droplets.utils.models import get_categories

from droplets.dphome.utils import get_basic_params
from droplets.dphome.utils import get_and_format_site
from droplets.dphome.utils import get_prev_and_next_page

from droplets.dphome.utils import get_data_by_page
from droplets.seo.utils import do_generate_product_name

from droplets.utils.decorators import check_static_files


@check_cate
#@check_static_files
def page_by_id(request, cate, pid, cur_city=None):
    """
        根据id获取page的具体信息

        @param request:
        @type request:

        @param pid:
        @type pid:

        @param cur_city:
        @type cur_city:
    """
    basic_params = get_basic_params()
    basic_params["site"] = get_and_format_site(request, cur_city)

    query_data = request.data
    model_cls, template = query_data["model_cls"], query_data["template_detail"]

    res = model_cls.objects.filter(id=int(pid)).first()
    cur_city_name, cur_city = get_cur_city(cur_city)

    prev_res, next_res = get_prev_and_next_page(model_cls, pid)

    # generate title by multi site supports
    if cur_city:
        res_lst = [prev_res, res, next_res]
        presv_res, res, next_res = do_generate_product_name(res_lst, cur_city)

    basic_params.update({"categories": get_categories(cate),
                         "res": res,
                         "res_cate": res.category,
                         "prev_res": prev_res,
                         "next_res": next_res})

    return render_to_response(template, basic_params)


def process_query_dict(cate_cls, dir_name):
    """ """
    if dir_name:
        dir_name = format_dir_name(dir_name)
        cate = cate_cls.objects.filter(dir_name=dir_name).first()
        basic_params["cur_cate"] = cate

        sub_cates = cate_cls.objects.filter(category=cate)
        if sub_cates:
            query_ids = [cate.id, ] + [x.id for x in sub_cates]
        else:
            query_ids = [cate,id, ]
        query_dict = {"category__in": query_ids}
    else:
        query_dict = {}

    return query_dict


@check_cate
def page_by_category(request, cate, cur_city=None, dir_name=None, *args, **kwargs):
    """
    根据分类获取列表信息
    """
    basic_params = get_basic_params()
    query_data = request.data
    model_cls, cate_cls, template = query_data["model_cls"], query_data["cate_cls"], query_data["template_list"]

    query_dict = process_query_dict(cate_cls, dir_name)
    page_info, ress = get_data_by_page(model_cls, query_dict)
    if cur_city:
        ress = do_generate_product_name(ress, cur_city)

    cur_city_name, cur_city_instance = get_cur_city(cur_city)

    basic_params.update({"site": get_and_format_site(request, cur_city),
                         "categories": get_categories(cate),
                         "page_info": page_info,
                         "cur_city_name": cur_city_name,
                         "cur_city": cur_city_instance,
                         "ress": ress})

    return render_to_response(template, basic_params)
