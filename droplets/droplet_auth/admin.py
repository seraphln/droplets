# coding=utf-8
#


from django.contrib import admin

from droplet.droplet_auth.models import DropletUsers


class DropletUsersAdmin(admin.ModelAdmin):
    """ droplet user的admin模块配置 """
    list_display = ("name", "uuid", "mobile")
    search_fields = ("name", "mobile")


admin.site.register(DropletUsers, DropletUsersAdmin)