# coding=utf-8
#


"""
dphome对应的数据模型定义
"""


from __future__ import unicode_literals

from django.db import models
from django.utils import timezone

from ckeditor.fields import RichTextField


class SiteConfig(models.Model):
    """ 站点基本配置数据模型 """
    name = models.CharField(max_length=128, verbose_name=u"公司名称")
    url = models.CharField(max_length=128, verbose_name=u"公司URL地址")
    logo = models.FileField(upload_to="../uploads/", verbose_name=u"网站LOGO",
                            blank=True, null=True)
    intro = RichTextField(blank=True,null=True, verbose_name="首页公司概况")
    created_on = models.DateTimeField(default=timezone.now, verbose_name=u"公司创建时间")
    cnzz = models.TextField(verbose_name=u"站长统计编号", default="", null=True, blank=True)
    tongji_js = models.TextField(verbose_name=u"统计JS", default="", null=True, blank=True)
    qrcode = models.FileField(upload_to="../uploads/", verbose_name=u"网站二维码",
                              blank=True, null=True)
    slogan = models.FileField(upload_to="../uploads/", verbose_name=u"网站slogan",
                              blank=True, null=True)
    title = models.CharField(max_length=255, verbose_name=u"网站标题",
                             default="", null=True, blank=True)
    keywords = models.CharField(max_length=255, verbose_name=u"默认关键词",
                                default="", null=True, blank=True)
    desc = models.CharField(max_length=255, verbose_name=u"默认描述",
                            default="", null=True, blank=True)
    wap_site = models.CharField(max_length=255, verbose_name=u"移动端网站",
                                default="", null=True, blank=True)

    def __unicode__(self):
        return self.name

    class Meta:
        verbose_name = u"系统设置"
        verbose_name_plural = u"系统设置"


class Menus(models.Model):
    """ 站点导航栏设置 """
    name = models.CharField(max_length=128, verbose_name=u"导航名称")
    customized_seq = models.IntegerField(default=0, verbose_name=u"序号")
    dir_name = models.CharField(max_length=255, verbose_name=u"目录名称")
    description = models.CharField(max_length=255, verbose_name=u"描述", blank=True, null=True)
    parent_cate = models.ForeignKey("self", null=True, blank=True, verbose_name=u"上级分类")
    created_on = models.DateTimeField(default=timezone.now, verbose_name=u"创建时间")
    modified_on = models.DateTimeField(default=timezone.now, verbose_name=u"创建时间")
    is_root = models.BooleanField(default=False, verbose_name=u"是否是顶级分类")
    is_foot = models.BooleanField(default=False, verbose_name=u"是否是加入底边框")

    def __unicode__(self):
        return self.name

    class Meta:
        verbose_name = u"导航设置"
        verbose_name_plural = u"导航设置"


class Banners(models.Model):
    """ banner图管理 """
    ttype = models.CharField(max_length=128, verbose_name=u"图片类型")
    tfile = models.FileField(upload_to="../uploads/", verbose_name=u"文件地址")
    created_on = models.DateTimeField(default=timezone.now, verbose_name=u"创建时间")
    modified_on = models.DateTimeField(default=timezone.now, verbose_name=u"创建时间")

    def __unicode__(self):
        return self.ttype

    class Meta:
        verbose_name = u"轮播图"
        verbose_name_plural = u"轮播图"


class Links(models.Model):
    """ 友情链接管理 """
    name = models.CharField(max_length=128, verbose_name=u"友链名")
    url = models.CharField(max_length=255, verbose_name=u"友链URL")
    created_on = models.DateTimeField(default=timezone.now, verbose_name=u"创建时间")

    def __unicode__(self):
        return self.name

    class Meta:
        verbose_name = u"友情链接"
        verbose_name_plural = u"友情链接"

