# coding=utf-8
#


from django.contrib import admin

# Register your models here.

from droplets.seo.models import Videos
from droplets.seo.models import Robots
from droplets.seo.models import SiteKey
from droplets.seo.models import GenStatics
from droplets.seo.models import HotKeywords
from droplets.seo.models import DownloadUrls
from droplets.seo.models import LongTailKeywords


class HotKeywordsAdmin(admin.ModelAdmin):
    """ 热门关键词 """
    list_display = ("id", "name", "url")


class LongTailKeywordsAdmin(admin.ModelAdmin):
    """ 长尾词管理 """
    list_display = ("id", "cities", "suffix")


class SiteKeyAdmin(admin.ModelAdmin):
    """ SEO站长提交密钥管理 """
    list_display = ("id", "key")


class RobotsKeyAdmin(admin.ModelAdmin):
    """ SEO站长提交密钥管理 """
    list_display = ("id", "content")


@admin.register(DownloadUrls)
class DownloadUrlsAdmin(admin.ModelAdmin):
    """ 下载 """
    list_display = ("id", "title")

@admin.register(Videos)
class VideosAdmin(admin.ModelAdmin):
    """ 视频 """
    list_display = ("id", "title")


@admin.register(GenStatics)
class GenStaticsAdmin(admin.ModelAdmin):
    """ 静态页面记录 """
    list_display = ("id", "name", "created_on")

admin.site.register(SiteKey, SiteKeyAdmin)
admin.site.register(Robots, RobotsKeyAdmin)
admin.site.register(HotKeywords, HotKeywordsAdmin)
admin.site.register(LongTailKeywords, LongTailKeywordsAdmin)
