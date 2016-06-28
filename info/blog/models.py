# -*- coding: utf-8 -*-
# Create your models here.
from __future__ import unicode_literals

from django.db import models
from django.contrib.auth.models import AbstractUser
#奇异代码-->解决date = date['date_publish'].strftime('%Y/%m文章')问题
#'ascii' codec can't encode characters in position 5-6: ordinal not in range(128)
import sys
reload(sys)
sys.setdefaultencoding('utf8')

#用户-->使用Django原生用户类
#注意在setting下添加AUTH_USER_MODEL = 'blog.User'
class User(AbstractUser):
    id = models.AutoField(primary_key=True,verbose_name='编号')
    avatar = models.ImageField(upload_to='avatar/%Y/%m', default='avatar/default.png', max_length=200, blank=True, null=True, verbose_name='用户头像')
    qq = models.CharField(max_length=20, blank=True, null=True, verbose_name='QQ号码')
    mobile = models.CharField(max_length=11, blank=True, null=True, unique=True, verbose_name='手机号码')
    url = models.URLField(max_length=100, blank=True, null=True, verbose_name='个人网页地址')
    vip = models.IntegerField(verbose_name='vip用户',default=0)

    class Meta:
        verbose_name_plural = '用户'
        ordering = ['-id']

    def __unicode__(self):
        return self.username

#博客广告
class Advert(models.Model):
    id = models.AutoField(primary_key=True,verbose_name='编号')
    title = models.CharField(max_length=50, verbose_name='广告标题')
    description = models.CharField(max_length=200,  verbose_name='广告描述')
    image_url = models.ImageField(upload_to='ad/%Y/%m', verbose_name='图片路径')
    callback_url = models.URLField(null=True, blank=True, verbose_name='回调url')
    date_publish = models.DateTimeField(auto_now_add=True, verbose_name='发布时间')
    index = models.IntegerField(default=999, verbose_name='排列顺序(从小到大)')

    class Meta:
        verbose_name_plural = '广告'
        ordering = ['index', 'id']

    def __unicode__(self):
        return self.title

# 博客分类
class Category(models.Model):
    id = models.AutoField(primary_key=True,verbose_name='编号')
    name = models.CharField(max_length=30, verbose_name='分类名称')
    index = models.IntegerField(default=999,verbose_name='分类的排序')

    class Meta:
        verbose_name_plural = '分类'
        ordering = ['index', 'id']

    def __unicode__(self):
        return self.name

# 博客标签
class Tag(models.Model):
    id = models.AutoField(primary_key=True,verbose_name='编号')
    name = models.CharField(max_length=30, verbose_name='标签名称')
    callback_url = models.URLField(null=True, blank=True, verbose_name='回调url')

    class Meta:
        verbose_name_plural = '标签'

    def __unicode__(self):
        return self.name

# 自定义一个文章Model的管理器
# 1、新加一个数据处理的方法
# 2、改变原有的queryset
class ArticleManager(models.Manager):
    def distinct_date(self):
        distinct_date_list = []
        date_list = self.values('date_publish')
        for date in date_list:
            date = date['date_publish'].strftime('%Y/%m文章')
            print date
            if date not in distinct_date_list:
                distinct_date_list.append(date)
        return distinct_date_list

#博客文章
class Article(models.Model):
    id = models.AutoField(primary_key=True,verbose_name='编号')
    title = models.CharField(max_length=50, verbose_name='文章标题')
    desc = models.CharField(max_length=50, verbose_name='文章描述')
    content = models.TextField(verbose_name='文章内容')
    click_count = models.IntegerField(default=0, verbose_name='点击次数')
    is_recommend = models.BooleanField(default=False, verbose_name='是否推荐')
    date_publish = models.DateTimeField(auto_now_add=True, verbose_name='发布时间')
    user = models.ForeignKey(User,verbose_name='用户')
    category = models.ForeignKey(Category,blank=True, null=True, verbose_name='分类')
    tag = models.ManyToManyField(Tag,through='ArticleTag',verbose_name='标签')
    score = models.IntegerField(blank=True, null=True,verbose_name="站长评分")

    objects = ArticleManager()

    class Meta:
        verbose_name_plural = '文章'
        ordering = ['-date_publish']

    def __unicode__(self):
        return self.title

# 博客文章标签
class ArticleTag(models.Model):
    id = models.AutoField(primary_key=True,verbose_name='编号')
    article = models.ForeignKey(Article)
    tag = models.ForeignKey(Tag)

    class Meta:
        verbose_name_plural = '博客标签'
        ordering = ['id']
        unique_together = (('article', 'tag'),)

    def __unicode__(self):
        return u'self.article'
#博客评论
class Comment(models.Model):
    id = models.AutoField(primary_key=True,verbose_name='编号')
    content = models.TextField(verbose_name='评论内容')
    username = models.CharField(max_length=30, blank=True, null=True, verbose_name='用户名')
    email = models.EmailField(max_length=50, blank=True, null=True, verbose_name='邮箱地址')
    # url = models.URLField(max_length=100, blank=True, null=True, verbose_name='个人网页地址')
    date_publish = models.DateTimeField(auto_now_add=True, verbose_name='发布时间')
    user = models.ForeignKey(User, blank=True, null=True, verbose_name='用户')
    article = models.ForeignKey(Article, blank=True, null=True, verbose_name='文章')
    pid = models.ForeignKey('self', blank=True, null=True, verbose_name='父级评论')

    class Meta:
        verbose_name_plural = '评论'

    def __unicode__(self):
        return str(self.id)

#博客链接
class Links(models.Model):
    id = models.AutoField(primary_key=True,verbose_name='编号')
    title = models.CharField(max_length=50, verbose_name='标题')
    description = models.CharField(max_length=200, verbose_name='友情链接描述')
    callback_url = models.URLField(verbose_name='url地址')
    date_publish = models.DateTimeField(auto_now_add=True, verbose_name='发布时间')
    index = models.IntegerField(default=999, verbose_name='排列顺序(从小到大)')

    class Meta:
        verbose_name_plural = '友情链接'
        ordering = ['index', 'id']

    def __unicode__(self):
        return self.title





