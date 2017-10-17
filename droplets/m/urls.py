# coding=utf-8
#

from django.conf.urls import url

from droplets.m.views import url_dispatcher


urlpatterns = [
    ## 案例相关接口
    #url(r'^cases/(?P<cid>\d+).html', get_case_by_id),
    #url(r'^cases/(?P<dir_name>\w+)/(?P<cate_name>\w+)_(?P<page>\d+).html', get_case_by_page),
    #url(r'^cases/(?P<dir_name>\w+)/$', cases),
    #url(r'^cases/(?P<cate_name>\w+)_(?P<page>\d+).html', get_case_by_page),
    #url(r'^cases/$', cases),

    url(r'^mobile/cases/(?P<cid>\d+).html', url_dispatcher, {"cate": "cases"}),
    url(r'^mobile/cases/(?P<dir_name>\w+)/(?P<cate_name>\w+)_(?P<page>\d+).html', url_dispatcher, {"cate": "cases"}),
    url(r'^mobile/cases/(?P<dir_name>\w+)/$', url_dispatcher, {"cate": "cases"}),
    url(r'^mobile/cases/(?P<cate_name>\w+)_(?P<page>\d+).html', url_dispatcher, {"cate": "cases"}),
    url(r'^mobile/cases/$', url_dispatcher, {"cate": "cases"}),

    # 新闻相关接口
    url(r'^mobile/news/(?P<cid>\d+).html', url_dispatcher, {"cate": "news"}),
    url(r'^mobile/news/(?P<dir_name>\w+)/(?P<cate_name>\w+)_(?P<page>\d+).html', url_dispatcher, {"cate": "news"}),
    url(r'^mobile/news/(?P<dir_name>\w+)/$', url_dispatcher, {"cate": "news"}),
    url(r'^mobile/news/(?P<cate_name>\w+)_(?P<page>\d+).html', url_dispatcher, {"cate": "news"}),
    url(r'^mobile/news/$', url_dispatcher, {"cate": "news"}),

    # 产品相关接口
    #url(r'^supply/(?P<cid>\d+).html', get_products_by_id),
    url(r'^mobile/supply_(?P<cur_city>\w+)/(?P<cid>\d+).html', url_dispatcher, {"cate": "supply"}),
    url(r'^mobile/supply_(?P<cur_city>\w+)/(?P<cate_name>\w+)_(?P<dir_name>\w+)/$', url_dispatcher, {"cate": "supply"}),
    url(r'^mobile/supply_(?P<cur_city>\w+)/(?P<cate_name>\w+)_(?P<page>\d+).html$', url_dispatcher, {"cate": "supply"}),
    url(r'^mobile/supply_(?P<cur_city>\w+)/(?P<dir_name>\w+)/(?P<cate_name>\w+)_(?P<page>\d+).html$', url_dispatcher, {"cate": "supply"}),

    # 处理产品相关请求
    url(r'^mobile/supply_(?P<cur_city>\w+)/$', url_dispatcher, {"cate": "supply"}),
    url(r'^mobile/supply_(?P<cur_city>\w+)/(?P<dir_name>\w+)/$', url_dispatcher, {"cate": "supply"}),
    url(r'^mobile/supply/$', url_dispatcher, {"cate": "supply"}),

    # 关于我们
    url(r'^mobile/about/(?P<dir_name>\w+.html)', url_dispatcher, {"cate": "about"}),
    url(r'^mobile/about/$', url_dispatcher, {"cate": "about"}),

    ## 首页以及多站点配置
    #url(r'^index_(?P<city>\w+).html', index),
    #url(r'^$', index),
]
