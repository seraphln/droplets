# coding=utf-8
#


from django.contrib import admin

from droplets.article.models import Articles
from droplets.article.models import HotArticles
from droplets.article.models import ArticlesCategory


class ArticlesAdmin(admin.ModelAdmin):
    """ 新闻管理 """
    list_display = ("id", "title", "category", "keywords", "created_on", "modified_on")


class HotArticlesAdmin(admin.ModelAdmin):
    """ 新闻分类管理 """
    list_display = ("id", "article", "created_on", "modified_on")

class ArticlesCategoryAdmin(admin.ModelAdmin):
    """ 新闻分类管理 """
    list_display = ("id", "name", "dir_name")


admin.site.register(Articles, ArticlesAdmin)
admin.site.register(HotArticles, HotArticlesAdmin)
admin.site.register(ArticlesCategory, ArticlesCategoryAdmin)
