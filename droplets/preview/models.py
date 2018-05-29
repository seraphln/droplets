# coding=utf-8
#

from __future__ import unicode_literals

from django.db import models
from django.utils import timezone
from ckeditor.fields import RichTextField
from ckeditor_uploader.fields import RichTextUploadingField


class Preview(models.Model):
    """ 预览页面 """
    title = models.CharField(max_length=255, verbose_name=u"案例标题")
    url = models.CharField(max_length=255, verbose_name=u"案例页面的URL", blank=True, null=True)
    content = RichTextField(blank=True, null=True, verbose_name="案例正文")
    ptype = models.CharField(max_length=255, verbose_name=u"类型")
    fpath = models.CharField(max_length=255, null=True, verbose_name=u"文件目录")
    created_on = models.DateTimeField(default=timezone.now, verbose_name=u"创建时间")
    modified_on = models.DateTimeField(default=timezone.now, verbose_name=u"创建时间")

    def __unicode__(self):
        return self.title

    class Meta:
        verbose_name = u"预览管理"
        verbose_name_plural = u"预览管理"

    def save(self, *args, **kwargs):
        """ 在保存时，更新本地的文件 """
        with open(self.fpath, "w") as fp:
            fp.write(self.content.encode('utf-8'))

        super(Preview, self).save(*args, **kwargs)
