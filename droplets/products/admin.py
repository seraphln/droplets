# coding=utf-8
#


from django.contrib import admin

from droplets.products.models import Cases
from droplets.products.models import CasesCategory

from droplets.products.models import Products
from droplets.products.models import ProductsCategory

from droplets.dphome.models import Menus

# Register your models here.


class CasesAdmin(admin.ModelAdmin):
    """ 案例管理 """
    list_display = ("id", "title", "category", "keywords", "created_on", "modified_on")


class ProductsAdmin(admin.ModelAdmin):
    """ 产品管理 """
    list_display = ("id", "title", "category", "keywords", "created_on", "modified_on",\
                    "spec", "model", "brand", "price", "application")


class CasesCategoryAdmin(admin.ModelAdmin):
    """ 案例分类管理 """
    list_display = ("id", "name", "dir_name")

    def queryset(self, request):
        qs = super(
        qs = super(ShopAdmin, self).queryset(request)
        if request.user.is_superuser:
            return qs

        return qs.filter(username=request.user.username,boss_verified=True)


class ProductsCategoryAdmin(admin.ModelAdmin):
    """ 产品分类管理 """
    list_display = ("id", "name", "dir_name")


admin.site.register(Cases, CasesAdmin)
admin.site.register(CasesCategory, CasesCategoryAdmin)
admin.site.register(Products, ProductsAdmin)
admin.site.register(ProductsCategory, ProductsCategoryAdmin)
