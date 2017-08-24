# coding=utf8
#


"""
新闻文章相关的功能函数集合
"""

from xpinyin import Pinyin
from datetime import datetime


def generate_plural(title):
    """
    根据给定的文章标题来生成plural

    >>> generate_plural(u"北京")
    bei-jing.html
    """

    pinyin = Pinyin()
    cur_pinyin = pinyin.get_pinyin(title)
    now = datetime.now()

    return "%s-%s.html" % (now.strftime("%Y%m%d"), cur_pinyin)