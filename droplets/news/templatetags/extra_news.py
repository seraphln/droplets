# coding=utf8
#


"""
使用template tag来定制化前端的新闻展示
"""

from django import template

from droplets.news.models import News
from droplets.news.models import NewsCategory

from django.template.loader import get_template

from droplets.dphome.utils import get_data_by_page

from django.shortcuts import render_to_response


register = template.Library()


@register.inclusion_tag('news/extra_news.html', takes_context=True)
def get_news_by_tag(context, cate, length=10):
    """
    根据分类来获取对应的新闻页面
    """
    news_cate = NewsCategory.objects.filter(dir_name=cate).first()
    _, news = get_data_by_page(News, {"category": getattr(news_cate, "id", 0)}, per_page=int(length))
    return {"news": news}