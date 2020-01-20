---
title: 'tar:Exiting with failure status due to previous errors'
tags:
  - Linux
categories:
  - Linux
author: 张学志
abbrlink: b1d9
date: 2015-07-17 14:43:00
description: ...
---





## 问题描述
* 使用tar命令解压一个*.tar.gz文件，文件在/usr/local/目录下，使用普通用户解压。解压失败，显示错误：tar: Exiting with failure status due to previous errors

## 解决方法
- 需要root权限。
	- 切换到root用户执行命令即可。
- 没有在当前目录
	- 切换到当前目录再执行命令。



## 参考博文
* http://www.360doc.com/content/13/0119/09/1317564_261143499.shtml
