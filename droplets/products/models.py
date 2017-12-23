# coding=utf-8
#

"""
产品管理
"""


from __future__ import unicode_literals

from django.db import models
from django.utils import timezone
from ckeditor.fields import RichTextField
from ckeditor_uploader.fields import RichTextUploadingField

from droplets.dphome.models import Menus


class CasesCategory(Menus):
    """ 案例类别 """
    def __unicode__(self):
        return self.name

    class Meta:
        proxy = True
        verbose_name = u"案例分类"
        verbose_name_plural = u"案例分类"


class Cases(models.Model):
    """ 案例管理 """

    title = models.CharField(max_length=255, verbose_name=u"案例标题")
    category = models.ForeignKey(CasesCategory, verbose_name=u"案例类别")
    pic = models.FileField(upload_to="../uploads/", verbose_name=u"案例图片", blank=True, null=True)
    keywords = models.CharField(max_length=255, verbose_name=u"相关搜索", blank=True, null=True)
    if_recommend = models.BooleanField(default=False, verbose_name=u"是否推荐")
    url = models.CharField(max_length=255, verbose_name=u"案例页面的URL", blank=True, null=True)
    desc = models.TextField(null=True, blank=True, verbose_name=u"案例描述")
    content = RichTextField(blank=True, null=True, verbose_name="案例正文")
    created_on = models.DateTimeField(default=timezone.now, verbose_name=u"创建时间")
    modified_on = models.DateTimeField(default=timezone.now, verbose_name=u"创建时间")

    def __unicode__(self):
        return self.title

    class Meta:
        verbose_name = u"案例介绍"
        verbose_name_plural = u"案例介绍"


class ProductsCategory(Menus):
    """ 产品类别 """
    def __unicode__(self):
        return self.name

    class Meta:
        proxy = True
        verbose_name = u"产品分类"
        verbose_name_plural = u"产品分类"


class Products(models.Model):
    """ 产品管理 """

    title = models.CharField(max_length=255, verbose_name=u"产品标题")
    category = models.ForeignKey(ProductsCategory, verbose_name=u"产品类别")
    pic = models.FileField(upload_to="../uploads/", verbose_name=u"产品图片", blank=True, null=True)
    spec = models.CharField(max_length=128, verbose_name=u"产品规格", blank=True, null=True)
    model = models.CharField(max_length=128, verbose_name=u"产品型号", blank=True, null=True)
    brand = models.CharField(max_length=128, verbose_name=u"产品品牌", blank=True, null=True)
    price = models.CharField(max_length=128, verbose_name=u"区间价格(元/人民币)", blank=True, null=True)
    application = models.CharField(max_length=128, verbose_name=u"应用范围", blank=True, null=True)
    keywords = models.CharField(max_length=255, verbose_name=u"相关搜索", blank=True, null=True)
    url = models.CharField(max_length=255, verbose_name=u"产品页面的URL", blank=True, null=True)
    desc = models.TextField(null=True, blank=True, verbose_name=u"产品描述")
    content = RichTextField(blank=True, null=True, verbose_name="产品正文")
    created_on = models.DateTimeField(default=timezone.now, verbose_name=u"创建时间")
    modified_on = models.DateTimeField(default=timezone.now, verbose_name=u"创建时间")
    is_recommend = models.BooleanField(default=False, verbose_name=u"是否强力推荐")
    is_index = models.BooleanField(default=False, verbose_name=u"首页曝光")

    def __unicode__(self):
        return self.title

    class Meta:
        verbose_name = u"产品介绍"
        verbose_name_plural = u"产品介绍"

    def get_absolute_url(self):
        """ 生成绝对路径 """
        #from droplets.dphome.models import SiteConfig
        #sc = SiteConfig.objects.filter().first()

        return "/supply/%d.html" % self.id
