---
title: VMware的虚拟机无法ping到
tags:
  - 软件
categories:
  - 软件
author: 张学志
abbrlink: c2de
date: 2015-07-16 14:44:00
description: ...
---




* 问题：无法ping到VMware中的虚拟机。网络模式选择Host Only，系统是CentOS6.4，重新建立一个网络连接，使用静态IP。但是，在宿主机上面无法ping到该虚拟机，登录虚拟机之后，Terminal中运行命令ifconfig之后，可以ping到。
* 分析：应该什么没有开启，必须等到用户登录之后才开启。。。
* 解决方法：编辑上面新建的网络，勾选“Available to all users”,重启虚拟机，问题就解决了。