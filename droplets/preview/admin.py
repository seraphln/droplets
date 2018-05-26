# coding=utf-8
#


from django.contrib import admin

from droplets.preview.models import Preview


@admin.register(Preview)
class PreviewAdmin(admin.ModelAdmin):
    """ 预览管理 """
    list_display = ("id", "title", "url", "created_on", "modified_on")
