# coding=utf8
#


from django.contrib import admin
from droplets.dphome.models import Links
from droplets.dphome.models import Menus
from droplets.dphome.models import Banners
from droplets.dphome.models import SiteConfig
from droplets.dphome.models import CompanyInfo


class SiteConfigAdmin(admin.ModelAdmin):
    """ 系统信息 """
    list_display = ("id", "name", "logo", "url", "qrcode")


class CompanyInfoAdmin(admin.ModelAdmin):
    """ 公司详细信息 """
    list_display = ("id", "username", "gender", "position")


class MenusAdmin(admin.ModelAdmin):
    """ 导航栏管理 """
    list_display = ("name", "customized_seq", "dir_name", "description")


class BannersAdmin(admin.ModelAdmin):
    """ banner图管理 """
    list_display = ("ttype", "tfile")


class LinksAdmin(admin.ModelAdmin):
    """ 友情链接 """
    list_display = ("name", "url")

admin.site.register(SiteConfig, SiteConfigAdmin)
admin.site.register(Links, LinksAdmin)
admin.site.register(Menus, MenusAdmin)
admin.site.register(Banners, BannersAdmin)
admin.site.register(CompanyInfo, CompanyInfoAdmin)
