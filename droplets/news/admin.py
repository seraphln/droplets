# coding=utf-8
#


from django.contrib import admin

from droplets.news.models import News
from droplets.news.models import NewsCategory

from droplets.dphome.models import Menus
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

    def get_queryset(self, request):
        cate_channel = Menus.objects.filter(name=u"公司新闻").first()
        return Menus.objects.filter(parent_cate=cate_channel)
