# coding=utf-8
#


"""
文章管理模块
"""

from __future__ import unicode_literals

from uuid import uuid4

from django.db import models
from django.utils import timezone

from ckeditor.fields import RichTextField
from droplets.dphome.models import Menus

from droplets.article.utils import generate_plural


class Articles(models.Model):
    """ 文章管理 """
    # 文章标题
    title = models.CharField(max_length=255, verbose_name=u"文章标题")
    # 文章的url
    plural = models.CharField(max_length=255, null=True, blank=True, verbose_name=u"文章的url")
    # 文章分类
    #category = models.ForeignKey(Menus, verbose_name=u"类别")
    categories = models.ManyToManyField(Menus, verbose_name=u"类别")
    # 文章封面图
    pic = models.FileField(upload_to="../uploads/", verbose_name=u"文章图片", blank=True, null=True)
    # 关键词
    keywords = models.CharField(max_length=255, verbose_name=u"相关搜索", blank=True, null=True)
    # 是否推荐
    is_recommend = models.BooleanField(default=False, verbose_name=u"是否推荐")
    # 是否在线
    is_online = models.BooleanField(default=False, verbose_name=u"是否上线")
    # 是否轮播图
    is_banner = models.BooleanField(default=False, verbose_name=u"是否轮播图")
    # 文章摘要
    brief = RichTextField(blank=True, null=True, verbose_name="文章摘要")
    # 文章正文
    content = RichTextField(blank=True, null=True, verbose_name="文章正文")
    # 文章的创建时间和修改时间
    created_on = models.DateTimeField(default=timezone.now, verbose_name=u"创建时间")
    modified_on = models.DateTimeField(default=timezone.now, verbose_name=u"创建时间")

    def __unicode__(self):
        return self.title

    class Meta:
        verbose_name = u"文章"
        verbose_name_plural = u"文章"

    def save(self, *args, **kwargs):
        """ 重写save方法，需要自动生成对应的文章url """
        #self.plural = generate_plural(self.title)
        if not self.plural:
            self.plural = "%s.html" % (uuid4().hex)
        super(Articles, self).save(*args, **kwargs)


class HotArticles(models.Model):
    """ 首页显示需要的热门新闻列表 """

    article = models.ForeignKey(Articles, verbose_name=u"热门新闻列表")
    # 是否在线
    is_online = models.BooleanField(default=True, verbose_name=u"是否上线")
    created_on = models.DateTimeField(default=timezone.now, verbose_name=u"创建时间")
    modified_on = models.DateTimeField(default=timezone.now, verbose_name=u"创建时间")

    def __unicode__(self):
        return self.article.title

    class Meta:
        verbose_name = u"热门新闻"
        verbose_name_plural = u"热门新闻"


class ArticlesCategory(models.Model):
    """ 文章类别 """
    # 分类名称
    name = models.CharField(max_length=255, verbose_name=u"栏目类别")
    # 是否在右侧显示
    is_inside = models.BooleanField(default=False, verbose_name=u"是否在右侧显示")
    # 是否显示图片
    is_pic = models.BooleanField(default=False, verbose_name=u"是否显示图片")
    # 文章列表
    articles = models.ManyToManyField(Articles, verbose_name=u"文章列表")

    def __unicode__(self):
        return self.name

    class Meta:
        verbose_name = u"文章分类"
        verbose_name_plural = u"文章分类"


