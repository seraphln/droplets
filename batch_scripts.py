# coding=utf-8
#

import json
from droplets.article.models import *


data = open("result.txt").readlines()

for d in data:
    dd = json.loads(d)
    title = dd.get("title")
    art = Articles.objects.filter(title=title).first()
    if art:
        continue
    else:
        article = Articles()
        article.title = dd.get("title")
        article.content = dd.get("content")
        article.is_online = False
        if article.title:
             article.save()