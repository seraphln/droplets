# coding=utf-8
#


from django.contrib import admin

from droplets.products.models import Cases
from droplets.products.models import CasesCategory

from droplets.products.models import Products
from droplets.products.models import ProductsCategory

from droplets.dphome.models import Menus

# Register your models here.


@admin.register(Cases)
class CasesAdmin(admin.ModelAdmin):
    """ 案例管理 """
    list_display = ("id", "title", "category",
                    "keywords", "created_on", "modified_on")


@admin.register(Products)
class ProductsAdmin(admin.ModelAdmin):
    """ 产品管理 """
    list_display = ("id", "title", "category", "keywords",
                    "created_on", "modified_on","spec", "model",
                    "brand", "price", "application")


@admin.register(CasesCategory)
class CasesCategoryAdmin(admin.ModelAdmin):
    """ 案例分类管理 """
    list_display = ("id", "customized_seq", "name", "dir_name")

    def get_queryset(self, request):
        cate_channel = Menus.objects.filter(name=u"工程案例").first()
        return Menus.objects.filter(parent_cate=cate_channel)


@admin.register(ProductsCategory)
class ProductsCategoryAdmin(admin.ModelAdmin):
    """ 产品分类管理 """
    list_display = ("id", "name", "dir_name")

    def get_queryset(self, request):
        cate_channel = Menus.objects.filter(name=u"产品中心").first()
        return Menus.objects.filter(parent_cate=cate_channel)

