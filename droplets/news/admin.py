# coding=utf8
#


from django.contrib import admin

from droplets.news.models import News
from droplets.news.models import NewsCategory

# Register your models here.


class NewsAdmin(admin.ModelAdmin):
    """ 新闻管理 """
    list_display = ("id", "title", "category", "keywords", "created_on", "modified_on")


class NewsCategoryAdmin(admin.ModelAdmin):
    """ 新闻分类管理 """
    list_display = ("id", "name", "dir_name")


admin.site.register(News, NewsAdmin)
admin.site.register(NewsCategory, NewsCategoryAdmin)
