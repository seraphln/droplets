# coding=utf8
#


"""
dphome首页用到的公共函数集合
"""

from droplets.seo.utils import generate_meta

from droplets.dphome.models import SiteConfig


def get_and_format_site(request):
    """
        获取并预处理site信息
        预处理包括: site.title, site.keywords, site.desc

        @param request: 当前请求的对象
        @type request: django.HttpRequest

        :return: site
    """
    site = SiteConfig.objects.filter().first()
    site = generate_meta(request, site)

    return site