# coding=utf-8
#


"""
SEO相关的功能函数集合
"""

from xpinyin import Pinyin

from droplets.seo.models import LongTailKeywords


def do_generate_product_name(products, city):
    """
        处理多站时的产品中心名称

        @param products: 需要处理的产品列表
        @type products: List

        @param city: 对应的城市
        @type city: String

        :return:
    """
    lt = LongTailKeywords.objects.filter().first()
    # 没有设置长尾词，直接返回
    if not lt or not lt.cities:
        return site

    pinyin_mapper = generate_pinyin_mapper(lt.cities)

    # 取不到就是北京
    suffix_keyword = pinyin_mapper.get(city, u"北京")
    for product in products:
        product.title = u"%s%s" % (suffix_keyword, product.title)

    return products


def do_generate_meta(keyword, site):
    """
        生成meta信息

        @param keyword: 前缀关键词
        @type keyword: String

        @param site: 给定的site对象
        @type site: dphome.models.SiteConfig

        :return: site

        >>> keyword = u"北京"
        site.title = keyword + site.title + site.name
    """

    # 生成标题meta
    site_keyword_lst = site.keywords.split(",")

    ## 生成公司标题列表
    title_lst = map(lambda x: keyword + x, site_keyword_lst)

    ## 最后加上公司名称
    #title_lst.append(site.name)
    site.title = "|".join(title_lst)
    site.title += "|" + site.name

    # 生成关键词meta
    site.keywords = ",".join(title_lst)

    # 生成描述meta
    site.desc = (u"（%s）" + site.desc) % keyword

    return site


def generate_meta(request, site, city):
    """
        根据数据库表存的关键词，生成:
        1. 标题：title
        2. 关键词：keywords
        3. 描述： desc

        @param request: 当前的http请求
        @type request: django.HttpRequest

        @param site: 给定的site对象
        @type site: dphome.models.SiteConfig

        @param city: 当前请求中带的城市
        @type city: String

        :return: site
        >>> cities = u"北京,天津"
        >>> city = u"北京"
        >>> generate_meta(request, site, city)
        北京钢板房

        >>> city = u"天津"
        >>> generate_meta(request, site, city)
        天津钢板房
    """
    path = request.path

    lt = LongTailKeywords.objects.filter().first()
    # 没有设置长尾词，直接返回
    if not lt or not lt.cities:
        return site

    pinyin_mapper = generate_pinyin_mapper(lt.cities)

    # 取不到就是北京
    suffix_keyword = pinyin_mapper.get(city, u"北京")
    return do_generate_meta(suffix_keyword, site)


def generate_pinyin_mapper(cities):
    """
    将给定的城市词转换成拼音

    @param cities: 给定的城市词列表
    @type cities: String

    :return: {}

    >>> cities = u"北京,上海"
    {"BeiJing": u"北京",
     "ShangHai": u"上海"}
    """
    pinyin_mapper = {}
    city_lst = filter(lambda x: x, cities.split(","))

    # 生成拼音库的实例
    pinyin = Pinyin()

    for city in city_lst:
        cur_pinyin = pinyin.get_pinyin(city)
        cur_pinyin = "".join(map(lambda x: x.capitalize(), cur_pinyin.split("-")))

        pinyin_mapper[cur_pinyin] = city

    return pinyin_mapper
