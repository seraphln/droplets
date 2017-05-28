# coding=utf8
#


"""
dphome对应的数据模型定义
"""


from __future__ import unicode_literals

from django.db import models
from django.utils import timezone


class SiteConfig(models.Model):
    """ 站点基本配置数据模型 """
    name = models.CharField(max_length=128, verbose_name=u"公司名称")
    url = models.CharField(max_length=128, verbose_name=u"公司URL地址")
    logo = models.CharField(max_length=128, verbose_name=u"网站LOGO")
    intro = models.TextField(verbose_name=u"首页公司概况")
    created_on = models.DateTimeField(default=timezone.now, verbose_name=u"公司创建时间")
    cnzz = models.TextField(verbose_name=u"站长统计编号", default="", null="")
    tongji_js = models.TextField(verbose_name=u"统计JS", default="", null="")

    def __unicode__(self):
        return self.name

    class Meta:
        verbose_name = u"系统设置"
        verbose_name_plural = u"系统设置"


class CompanyInfo(models.Model):
    """ 公司详细信息 """
    GENDER_CHOICES = ((u"M", u"男"),
                      (u"U", u"未知"),
                      (u"F", u"女"))

    username = models.CharField(max_length=128, verbose_name=u"联系人姓名")
    gender = models.CharField(max_length=2,
                              choices=GENDER_CHOICES,
                              verbose_name=u"性别", default="M")

    position = models.CharField(max_length=128, verbose_name=u"职位", null=True, blank=True)
    telephone = models.CharField(max_length=16, verbose_name=u"电话", null=True, blank=True)
    mobile = models.CharField(max_length=16, verbose_name=u"手机", null=True, blank=True)
    fax = models.CharField(max_length=16, verbose_name=u"传真", null=True, blank=True)
    address = models.CharField(max_length=255, verbose_name=u"地址", null=True, blank=True)
    postcode = models.CharField(max_length=16, verbose_name=u"邮政编码", null=True, blank=True)
    url = models.CharField(max_length=255, verbose_name=u"公司主页", null=True, blank=True)
    email = models.CharField(max_length=255, verbose_name=u"公司邮箱", null=True, blank=True)
    qq = models.CharField(max_length=16, verbose_name=u"公司QQ", null=True, blank=True)
    description = models.TextField(verbose_name=u"公司描述", null=True, blank=True)

    def __unicode__(self):
        return self.username

    class Meta:
        verbose_name = u"联系方式设置"
        verbose_name_plural = u"联系方式设置"


class Menus(models.Model):
    """ 站点导航栏设置 """
    name = models.CharField(max_length=128, verbose_name=u"导航名称")
    customized_seq = models.IntegerField(default=0, verbose_name=u"序号")
    dir_name = models.CharField(max_length=255, verbose_name=u"目录名称")
    description = models.IntegerField(max_length=255, verbose_name=u"描述", blank=True, null=True)
    created_on = models.DateTimeField(default=timezone.now, verbose_name=u"创建时间")
    modified_on = models.DateTimeField(default=timezone.now, verbose_name=u"创建时间")

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

    def __unicode__(self):
        return self.tfile

    class Meta:
        verbose_name = u"友情链接"
        verbose_name_plural = u"友情链接"
