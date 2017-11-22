# coding=utf-8
#


from django.contrib import admin
from droplets.dphome.models import Links
from droplets.dphome.models import Menus
from droplets.dphome.models import Banners
from droplets.dphome.models import Channels
from droplets.dphome.models import SiteConfig
from droplets.dphome.models import CompanyInfo
from droplets.dphome.models import Details
from droplets.dphome.models import UserMessage


class SiteConfigAdmin(admin.ModelAdmin):
    """ 系统信息 """
    list_display = ("id", "name", "logo", "url", "qrcode")


class CompanyInfoAdmin(admin.ModelAdmin):
    """ 网站详细信息管理 """
    list_display = ("id", "username", "gender", "position")


class MenusAdmin(admin.ModelAdmin):
    """ 导航栏管理 """
    list_display = ("name", "customized_seq", "dir_name", "description")


class ChannelsAdmin(admin.ModelAdmin):
    """ 频道管理 """

    # 设置列表显示的内容
    list_display = ("id", "seq", "name", "dir_name",
                    "description", "is_root", "is_footer",
                    "created_on", "modified_on")


class BannersAdmin(admin.ModelAdmin):
    """ banner图管理 """
    list_display = ("ttype", "tfile")


class LinksAdmin(admin.ModelAdmin):
    """ 友情链接 """
    list_display = ("name", "url")

class DetailsAdmin(admin.ModelAdmin):
    """ 详细信息 """
    list_display = ("name", "industry", "enterprise", "operating", "registered",\
                    "registered_add", "address", "employees", "people", "workshop",\
                    "account", "account_number", "authentication", "customer",\
                    "market", "kepp",)


class UserMessageAdmin(admin.ModelAdmin):
    """ 用户留言信息 """
    list_display = ("username", "telephone", "email", "content", "created_on")


# 注册到admin后台管理系统
admin.site.register(SiteConfig, SiteConfigAdmin)
admin.site.register(Links, LinksAdmin)
admin.site.register(Menus, MenusAdmin)
admin.site.register(Banners, BannersAdmin)
admin.site.register(CompanyInfo, CompanyInfoAdmin)
admin.site.register(Details, DetailsAdmin)
admin.site.register(UserMessage, UserMessageAdmin)
admin.site.register(Channels, ChannelsAdmin)
