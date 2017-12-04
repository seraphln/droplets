# coding=utf-8
#


from __future__ import unicode_literals

from django.db import models
from django.utils import timezone


# Create your models here.


class HotKeywords(models.Model):
    """ 热门关键词 """
    name = models.CharField(max_length=255, verbose_name=u"热门关键词")
    url = models.CharField(max_length=255, verbose_name=u"热门关键词URL")

    def __unicode__(self):
        return self.name

    class Meta:
        verbose_name = u"热门关键词"
        verbose_name_plural = u"热门关键词"


class LongTailKeywords(models.Model):
    """ 长尾词设置 """
    cities = models.CharField(max_length=255, verbose_name=u"推广城市")
    suffix = models.CharField(max_length=255, verbose_name=u"产品前缀后缀")

    def __unicode__(self):
        return self.cities

    class Meta:
        verbose_name = u"长尾词设置"
        verbose_name_plural = u"长尾词设置"


class SiteKey(models.Model):
    """ 站点密钥设置 """
    key = models.CharField(max_length=255, verbose_name=u"密钥")

    def __unicode__(self):
        return self.key

    class Meta:
        verbose_name = u"站长提交密钥"
        verbose_name_plural = u"站长提交密钥"


class Robots(models.Model):
    """ robots协议管理 """
    content = models.TextField(null=True, blank=True, verbose_name=u"robots.txt配置")

    def __unicode__(self):
        return str(self.id)

    class Meta:
        verbose_name = u"Robots协议配置"
        verbose_name_plural = u"Robots协议配置"

    def save(self, *args, **kwargs):
        """ 重写save方法，在保存时，更新robots.txt """
        # write_robots()
        robots_path = "robots.txt"
        with open(robots_path, "w") as fp:
            fp.write(self.content.encode("utf8"))
        super(Robots, self).save(*args, **kwargs)


class DownloadUrls(models.Model):
    """ 下载的url文件 """
    title = models.CharField(max_length=255, verbose_name=u"文件名称")
    name = models.FileField(upload_to="../uploads/", verbose_name=u"下载文件",
                            blank=True, null=True)

    def __unicode__(self):
        return self.title

    class Meta:
        verbose_name = u"下载链接"
        verbose_name_plural = u"下载链接"


class Videos(models.Model):
    """ 页面视频 """
    title = models.CharField(max_length=255, verbose_name=u"视频文件名称")
    name = models.FileField(upload_to="../uploads/", verbose_name=u"视频文件",
                            blank=True, null=True)

    def __unicode__(self):
        return self.title

    class Meta:
        verbose_name = u"视频文件"
        verbose_name_plural = u"视频文件"


class GenStatics(models.Model):
    """ 一键生成静态页面 """
    name = models.CharField(max_length=255, verbose_name=u"任务名称")
    created_on = models.DateTimeField(default=timezone.now, verbose_name=u"创建时间")

    def __unicode__(self):
        return self.name

    class Meta:
        verbose_name = u"生成静态页面记录"
        verbose_name_plural = u"生成静态页面记录"

    def save(self, *args, **kwargs):
        # 生成静态页面
        from droplets.scripts.batch_generate_static_files import backend as generate_static_files
        generate_static_files()
        # 保存记录
        super(Menus, self).save(*args, **kwargs)
