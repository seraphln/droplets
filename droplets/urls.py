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

from django.conf.urls import url
from django.conf import settings
from django.contrib import admin

from django.conf.urls.static import static

from droplets.dphome.views import index

from droplets.dphome.views import sitemap
from droplets.dphome.views import page_router
from droplets.dphome.views import sceneImgUpload


urlpatterns = [
    # 新闻相关接口

    # 站点地图
    url(r'^sitemap/$', sitemap),

    # 首页
    url(r'^$', index),

    # 后台管理
    url(r'^admin/', admin.site.urls),

    # uploads
    url(r'^upload_image', sceneImgUpload),

]

if settings.DEBUG:
    urlpatterns += static(settings.STATIC_URL,
                          document_root=settings.MEDIA_ROOT)

    urlpatterns += static(settings.MEDIA_PATH,
                          document_root=settings.MEDIA_ROOT)


urlpatterns += [url(r'^(?P<dir_name>.*)/(?P<plural>.*)', page_router)]
