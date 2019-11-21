---
title: >-
  错误-VS2010 error:LINK:fatal error LNK1123:failure during conversion to
  COFF:file invalid or c
tags:
  - 错误
  - VS
categories:
  - 编程工具
  - VS
author: 张学志
abbrlink: 7c40
date: 2016-03-18 13:35:00
---




# visual studio link error

## 问题

> VS2010 error: LINK : fatal error LNK1123: failure during conversion to COFF: file invalid or corrupt

## 解决方法

### 方法1
**安装 VS2010 SP1**。
注：Visual Studio 2010 SP1 是微软在2011发布的VS2010的补丁包。

<!-- more -->

### 方法2
另外，网上还有人说可以通过调整`Enable Incremental Linking`参数，解决这个问题，但是在我的系统环境下没有成功，大家可以先尝试使用这种方法，如果不行，再安装VS 2010 SP1。

调整参数过程如下所示。

```
Project Properties 
   -> Configuration Properties 
       -> Linker (General) 
          -> Enable Incremental Linking -> "No (/INCREMENTAL:NO)"
```

![这里写图片描述](http://img.blog.csdn.net/20160318082120603)
