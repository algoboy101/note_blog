---
title: 解决Ubuntu中文显示为乱码
tags: 
  - Linux
  - 乱码
categories:
  - Linux
  - 经验
date: 2016-9-19 12:35:00
author: 张学志
---




## 1.    安装所需软件
```
sudo apt-get install zh-autoconvert
sudo apt-get install zhcon
```

## 2.    配置系统
```
$ vi /var/lib/locales/supported.d/local  加入
zh_CN.GBK GBK
zh_CN.GB2312 GB2312
$ sudo locale-gen
```

<!-- more -->

## 3. 修改ubuntu的字符集

### 方法一： 修改用户目录下的.profile或.bashrc文件，增加以下内容：
```
LANGUAGE=”zh_CN:zh:en_US:en”
LANG=zh_CN.GBK 
```
重新登录即可。
这个方法只对该用户有效。

### 方法二：修改/etc/environment，增加以下内容：
```
LANGUAGE=”zh_CN:zh:en_US:en”
LANG=zh_CN.GBK
```
然后重启X即可
这个方法对没有设置LANG及LANGUAGE环境变量的用户有效 

## 参考：
* http://blog.csdn.net/zjc156m/article/details/9095297
* http://blog.csdn.net/xieyan0811/article/details/7530962
* http://www.linuxidc.com/Linux/2014-02/96939.htm

