# coding=utf-8
#


"""
数据采集集成模块
"""

from __future__ import unicode_literals

from django.db import models
from django.contrib.auth.models import User

from droplets.crawler.onedrop import crawl_news


class Crawler(models.Model):
    """
    数据采集任务
    """
    user = models.ForeignKey(User, verbose_name=u"任务创建者")
    tag = models.CharField(max_length=255, verbose_name=u"任务版本，随便写")
    status = models.CharField(max_length=32, default="pending", verbose_name=u"任务状态")
    created_on = models.DateTimeField(default=timezone.now, verbose_name=u"创建时间")

    def __unicode__(self):
        return self.tag

    class Meta:
        verbose_name = u"数据采集任务"
        verbose_name_plural = u"数据采集任务"


    def save(self, *args, **kwargs):
        """ 重写save方法，创建任务记录时，调用爬虫，执行操作 """

        try:
            self.status = "running"
            # 调用爬虫
            crawl_news()
            self.status = "finished"
        except:
            self.status = "failed"
        super(Crawler, self).save(*args, **kwargs)