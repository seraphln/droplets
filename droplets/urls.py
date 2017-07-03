# coding=utf-8
#

"""droplets URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.10/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""

from django.conf import settings
from django.conf.urls import url
from django.contrib import admin
from django.conf.urls.static import static

from droplets.dphome.views import index
from droplets.dphome.views import about
from droplets.dphome.views import message
from droplets.dphome.views import supply
from droplets.dphome.views import get_supply_by_id
from droplets.dphome.views import news
#from droplets.dphome.views import cases

# 案例相关接口
from droplets.products.views import cases
from droplets.products.views import get_case_by_id
from droplets.products.views import get_case_by_page

from droplets.dphome.views import sitemap
from droplets.dphome.views import add_msg
from droplets.dphome.views import get_news_by_id
from droplets.dphome.views import get_supply_by_page


urlpatterns = [
    url(r'^cases/(?P<cid>\d+).html', get_case_by_id),
    #url(r'^cases/(?P<cate_name>\w+)_(?P<page>\d+).html', get_case_by_page),
    url(r'^cases/(?P<dir_name>\w+)/(?P<cate_name>\w+)_(?P<page>\d+).html', get_case_by_page),
    url(r'^cases/(?P<dir_name>\w+)/$', cases),
    url(r'^cases/$',cases),
    url(r'^news/(?P<id>\d+).html', get_news_by_id),
    url(r'^news/(?P<dir_name>)', news),
    url(r'^news/$', news),
    url(r'^supply/$', supply),
    url(r'^supply/(?P<id>\d+).html', get_supply_by_id),
    url(r'^about/(?P<dir_name>\w+.html)', about),
    url(r'^about/$', about),
    url(r'^sitemap/$', sitemap),
    url(r'^index_(?P<city>\w+).html', index),
    url(r'^supply/Products_(?P<page>\d+).html$', get_supply_by_page),
    url(r'^$', index),
    url(r'^admin/', admin.site.urls),
    url(r'^MessageLeftMain.htm', message),
    url(r'^admin/add_msg/', add_msg),
    #url(r'^ckeditor/', include('ckeditor.urls')),
]

if settings.DEBUG:
    urlpatterns += static(settings.STATIC_URL,
                          document_root=settings.MEDIA_ROOT)

    urlpatterns += static(settings.MEDIA_PATH,
                          document_root=settings.MEDIA_ROOT)
