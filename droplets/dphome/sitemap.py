# coding=utf-8
#


from django.contrib.sitemaps import Sitemap

from droplets.products.models import Products


class DPSitemap(Sitemap):
    changefreq='weekly'
    priority = 0.9

    def items(self):
        return Products.objects.all()

    def lastmod(self, obj):
        return obj.created_on