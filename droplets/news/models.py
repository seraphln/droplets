# coding=utf-8
#


"""
新闻模块
"""

from __future__ import unicode_literals

from django.db import models
from django.utils import timezone

from ckeditor.fields import RichTextField
from droplets.dphome.models import Menus


class NewsCategory(Menus):
    """ 新闻类别 """
    def __unicode__(self):
        return self.name

    class Meta:
        proxy = True
        verbose_name = u"新闻分类"
        verbose_name_plural = u"新闻分类"


class News(models.Model):
    """ 新闻管理 """
    SPIDER_CHOICES = ((-1, u"失败"),
                      (0, u"未推送"),
                      (1, u"成功"))

    title = models.CharField(max_length=255, verbose_name=u"新闻标题")
    category = models.ForeignKey(NewsCategory, verbose_name=u"类别")
    pic = models.FileField(upload_to="../uploads/", verbose_name=u"新闻图片", blank=True, null=True)
    keywords = models.CharField(max_length=255, verbose_name=u"相关搜索", blank=True, null=True)
    if_recommend = models.BooleanField(default=False, verbose_name=u"是否推荐")
    spdier_push = models.IntegerField(choices=SPIDER_CHOICES,
                                      verbose_name=u"百度推送",
                                      default=0)
    url = models.CharField(max_length=255, verbose_name=u"新闻页面的URL", blank=True, null=True)
    desc = models.TextField(null=True, blank=True, verbose_name=u"新闻描述")
    content = RichTextField(blank=True, null=True, verbose_name="新闻正文")
    is_recommend = models.BooleanField(default=True, verbose_name=u"是否推荐")
    created_on = models.DateTimeField(default=timezone.now, verbose_name=u"创建时间")
    modified_on = models.DateTimeField(default=timezone.now, verbose_name=u"创建时间")

    def __unicode__(self):
        return self.title

    class Meta:
        verbose_name = u"新闻动态"
        verbose_name_plural = u"新闻动态"

    def get_absolute_url(self):
        """ 生成绝对路径 """

        return "/news/%d.html" % self.id
