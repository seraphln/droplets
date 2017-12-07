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
    pic = models.FileField(upload_to="../uploads/", verbose_name=u"首页图片",
                           blank=True, null=True)
    intro = RichTextField(blank=True,null=True, verbose_name="首页公司概况")
    created_on = models.DateTimeField(default=timezone.now, verbose_name=u"公司创建时间")
    cnzz = models.TextField(verbose_name=u"站长统计编号", default="", null=True, blank=True)
    tongji_js = models.TextField(verbose_name=u"统计JS", default="", null=True, blank=True)
    qrcode = models.FileField(upload_to="../uploads/", verbose_name=u"网站二维码",
                              blank=True, null=True)
    title = models.CharField(max_length=255, verbose_name=u"网站标题",
                             default="", null=True, blank=True)
    keywords = models.CharField(max_length=255, verbose_name=u"默认关键词",
                                default="", null=True, blank=True)
    desc = models.CharField(max_length=255, verbose_name=u"默认描述",
                            default="", null=True, blank=True)

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
    ename = models.CharField(max_length=128, verbose_name=u"英文名称",
                             default="", null=True, blank=True)
    pic = models.FileField(upload_to="../uploads/", verbose_name=u"导航图片",
                           blank=True, null=True)
    customized_seq = models.IntegerField(default=0, verbose_name=u"序号")
    dir_name = models.CharField(max_length=255, verbose_name=u"目录名称")
    description = models.CharField(max_length=255, verbose_name=u"描述", blank=True, null=True)
    content = RichTextField(blank=True,null=True, verbose_name="分类详情信息")
    parent_cate = models.ForeignKey("self", null=True, blank=True, verbose_name=u"上级分类")
    created_on = models.DateTimeField(default=timezone.now, verbose_name=u"创建时间")
    modified_on = models.DateTimeField(default=timezone.now, verbose_name=u"创建时间")
    is_online = models.BooleanField(default=True, verbose_name=u"是否在导航显示")
    is_root = models.BooleanField(default=False, verbose_name=u"是否是顶级分类")
    is_foot = models.BooleanField(default=False, verbose_name=u"是否是加入底边框")

    def __unicode__(self):
        return self.name

    class Meta:
        verbose_name = u"导航设置"
        verbose_name_plural = u"导航设置"

    def save(self, *args, **kwargs):
        """ 重写save方法，如果没有设置seq的话，就跟id一致 """
        if not self.customized_seq:
            self.customized_seq = 0

        # 更新修改时间
        self.modified_on = timezone.now()

        if self.dir_name:
            if not self.dir_name.startswith("/"):
                self.dir_name = "/" + self.dir_name

            if not self.dir_name.endswith(".html") and not self.dir_name.endswith("/"):
                self.dir_name = self.dir_name + "/"

        if not self.customized_seq:
            self.customized_seq = 0

        super(Menus, self).save(*args, **kwargs)


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


class Details(models.Model):
    """详细信息"""
    name = models.CharField(max_length=128, verbose_name=u"法定代表人/负责人")
    industry = models.CharField(max_length=128, verbose_name=u"主营行业")
    enterprise = models.CharField(max_length=128, verbose_name=u"企业类型")
    operating = models.CharField(max_length=128, verbose_name=u"经营模式")
    registered = models.CharField(max_length=128, verbose_name=u"注册资本(人民币/万元)")
    registered_add = models.CharField(max_length=128, verbose_name=u"公司注册地(省份/城市)")
    address = models.CharField(max_length=128, verbose_name=u"详细地址")
    employees = models.CharField(max_length=128, verbose_name=u"员工人数")
    people = models.CharField(max_length=128, verbose_name=u"研发部门人数")
    workshop = models.CharField(max_length=128, verbose_name=u"厂房面积(平方米)")
    account = models.CharField(max_length=128, verbose_name=u"开户银行")
    account_number = models.CharField(max_length=128, verbose_name=u"银行账号")
    authentication = models.CharField(max_length=128, verbose_name=u"管理体系认证")
    customer = models.CharField(max_length=128, verbose_name=u"主要客户(如：超市、服装厂、印刷厂)")
    market = models.CharField(max_length=128, verbose_name=u"主要市场")
    kepp = models.CharField(max_length=128, verbose_name=u"备案号")

    def __unicode__(self):
        return self.name

    class Meta:
        verbose_name = u"详细信息"
        verbose_name_plural = u"详细信息"


class UserMessage(models.Model):
    """ 用户浏览模块 """
    username = models.CharField(max_length=128, verbose_name=u"用户名")
    telephone = models.CharField(max_length=128, verbose_name=u"用户电话")
    email = models.CharField(max_length=128, verbose_name=u"用户邮箱")
    content = models.CharField(max_length=128, verbose_name=u"用户留言信息")
    created_on = models.DateTimeField(default=timezone.now, verbose_name=u"创建时间")

    def __unicode__(self):
        return self.username

    class Meta:
        verbose_name = u"用户留言"
        verbose_name_plural = u"用户留言"
