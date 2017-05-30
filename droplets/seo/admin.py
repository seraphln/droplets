# coding=utf8
#


from django.contrib import admin

# Register your models here.

from droplets.seo.models import HotKeywords
from droplets.seo.models import LongTailKeywords


class HotKeywordsAdmin(admin.ModelAdmin):
    """ 热门关键词 """
    list_display = ("id", "name", "url")


class LongTailKeywordsAdmin(admin.ModelAdmin):
    """ 长尾词管理 """
    list_display = ("id", "cities", "suffix")


admin.site.register(HotKeywords, HotKeywordsAdmin)
admin.site.register(LongTailKeywords, LongTailKeywordsAdmin)
