# coding=utf-8
#

"""
关于我们相关的管理配置
"""


from __future__ import unicode_literals

from django.db import models
from django.utils import timezone
from ckeditor.fields import RichTextField
from ckeditor_uploader.fields import RichTextUploadingField

from droplets.dphome.models import Menus


class AboutCategory(Menus):
    """ 关于我们类别 """
    def __unicode__(self):
        return self.name

    class Meta:
        proxy = True
        verbose_name = u"关于我们分类"
        verbose_name_plural = u"关于我们分类"


class Abouts(models.Model):
    """ 关于我们管理 """

    title = models.CharField(max_length=255, verbose_name=u"标题")
    category = models.ForeignKey(AboutCategory, verbose_name=u"类别")
    pic = models.FileField(upload_to="../uploads/", verbose_name=u"图片", blank=True, null=True)
    keywords = models.CharField(max_length=255, verbose_name=u"相关搜索", blank=True, null=True)
    if_recommend = models.BooleanField(default=False, verbose_name=u"是否推荐")
    url = models.CharField(max_length=255, verbose_name=u"页面的URL", blank=True, null=True)
    desc = models.TextField(null=True, blank=True, verbose_name=u"描述")
    content = RichTextField(blank=True, null=True, verbose_name="正文")
    created_on = models.DateTimeField(default=timezone.now, verbose_name=u"创建时间")
    modified_on = models.DateTimeField(default=timezone.now, verbose_name=u"创建时间")

    def __unicode__(self):
        return self.title

    class Meta:
        verbose_name = u"关于我们介绍"
        verbose_name_plural = u"关于我们介绍"

    def get_absolute_url(self):
        """ 生成绝对路径 """

        return "/about/%d.html" % self.id
