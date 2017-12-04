# coding=utf-8
#


from django.contrib import admin

from droplets.news.models import News
from droplets.news.models import NewsCategory

# Register your models here.


@admin.register(News)
class NewsAdmin(admin.ModelAdmin):
    """ 新闻管理 """
    list_display = ("id", "title", "category",
                    "keywords", "created_on", "modified_on")


@admin.register(NewsCategory)
class NewsCategoryAdmin(admin.ModelAdmin):
    """ 新闻分类管理 """
    list_display = ("id", "name", "dir_name")

