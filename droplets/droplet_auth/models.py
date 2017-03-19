# coding=utf8
#

"""
自定义的用户模型
继承自django的user模块
"""

from uuid import uuid4
from datetime import datetime

from django.db import models

from django.contrib.auth.models import BaseUserManager
from django.contrib.auth.models import AbstractBaseUser


class UserManager(BaseUserManager):

    def create_user(self, name, mobile, password=None):
        """
            使用给定的参数创建用户

            @param name: given user name
            @type name: String

            @param mobile: given user's mobile number
            @type mobile: String

            @param password: given user's password
            @type password: String

            :return: user
        """
        if not mobile:
            raise ValueError(u'用户必须有身份证和手机号')

        user = self.model(name=name, mobile=mobile)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, name, mobile, password=None):
        """
            使用给定的参数创建管理员用户

            @param name: given username
            @type name: String

            @param mobile: given user's mobile number
            @type mobile: String

            @param password: given user's password
            @type password: String

            :return: user
        """
        user = self.create_user(name, mobile, password)
        user.is_admin = True
        user.save(using=self._db)
        return user


class DropletUsers(AbstractBaseUser):
    """ customized user module """

    GENDER_CHOICES = ((u"M", u"男"),
                      (u"U", u"未知"),
                      (u"F", u"女"))

    name = models.CharField(max_length=128, verbose_name=u"昵称")

    # 混淆使用的uuid
    uuid = models.CharField(max_length=64,
                            unique=True,
                            verbose_name=u"混淆使用的用户ID",
                            default=uuid4().hex)

    # 用户基本信息
    avatar = models.URLField(verbose_name=u"头像地址", blank=True, null=True)
    age = models.IntegerField(verbose_name=u"年龄", blank=True, null=True)
    gender = models.CharField(max_length=2,
                              choices=GENDER_CHOICES,
                              verbose_name=u"性别", default="M")
    desc = models.TextField(verbose_name=u"个人描述信息", null=True)

    backend = models.CharField(max_length=128,
                               verbose_name=u"用户backend",
                               default="aegon.aegon_auth.models")

    mobile = models.CharField(max_length=32, unique=True, verbose_name=u"电话号")

    # 创建时间和最后一次修改时间
    created_on = models.DateTimeField(default=datetime.now, verbose_name=u"创建时间")
    modified_on = models.DateTimeField(default=datetime.now, verbose_name=u"最后修改时间")
    
    # 是否被删除 & 是否激活 & 是否是管理员
    is_delete = models.BooleanField(default=False, verbose_name=u"是否被删除")
    is_active = models.BooleanField(default=True, verbose_name=u"是否激活")
    is_admin = models.BooleanField(default=False, verbose_name=u"是否是管理员")

    USERNAME_FIELD = "mobile"
    REQUIRED_FIELDS = ("name", )

    class Meta:
        ordering = ("-created_on",)

    def __unicode__(self):
        return self.name

    def get_full_name(self):
        return self.name

    def get_short_name(self):
        return self.name

    def has_perm(self, perm, obj=None):
        return True

    def has_module_perms(self, app_label):
        return True

    @property
    def is_staff(self):
        return self.is_admin
