# coding=utf8
#


from __future__ import unicode_literals

from django.db import models

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
