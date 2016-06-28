# -*- coding: utf-8 -*-
"""Myblog URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.9/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url
from django.contrib import admin
from django.conf import settings
from views import index,category,article,archive,do_login,do_logout,comment_post,do_reg
from blog.upload import upload_image

urlpatterns = [
    url(r'^index/$',index,name='index'),
    url(r'category/$',category,name='category'),
    url(r'article/$',article,name='article'),
    url(r'archive/$',archive,name='archive'),
    url(r'do_login/$',do_login,name='do_login'),
    url(r'do_logout/$',do_logout,name='do_logout'),
    url(r'comment_post/$',comment_post,name='comment_post'),
    url(r'do_reg/$',do_reg,name='do_reg')
]



