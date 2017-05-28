# coding=utf8
#


from django.contrib import admin

# Register your models here.

from droplets.seo.models import HotKeywords


class HotKeywordsAdmin(admin.ModelAdmin):
    """ 热门关键词 """
    list_display = ("id", "name", "url")


admin.site.register(HotKeywords, HotKeywordsAdmin)
