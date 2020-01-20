---
title: 使用Putty无法远程登录，显示服务器拒绝连接
tags:
  - Linux
categories:
  - Linux
author: 张学志
abbrlink: d927
date: 2015-09-21 14:23:00
description: ...
---




> putty连接不到linux的原因总结为以下几种情况。

## **局域网内的两台电脑IP冲突**
* 当使用DHCP自动分配IP时，两台电脑的IP可能会冲突。这时，使用Putty无法登连接Linux。
* 方法：可以设置/etc/network/interfaces文件，将网卡设置为静态IP，并设置IP，子网掩码等。
    
## **没有安装openssh-server**
<!-- more -->
* 这个问题一般出现在刚刚装完操作系统，此时还没有安装openssh-server。
* Putty一般使用SSH连接方式，因为主机没有openssh-server，所以无法连接。
* 参考[《Ubuntu 安装配置SSH》](http://www.linuxidc.com/Linux/2015-01/112045.htm)
*	使用下面命令安装openssh-server之后，问题解决了。

```
    sudo apt-get install openssh-server
```