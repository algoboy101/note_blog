---
title: 服务器维护系列——VNC没有反应了怎么办？
tags:
  - Linux
  - VNC
categories:
  - Linux
  - 经验
author: 张学志
abbrlink: 4e0f
date: 2016-03-29 13:33:00
---




## 服务器维护系列
* [服务器维护系列——VNC没有反应了怎么办？](http://blog.csdn.net/xuezhisdc/article/details/51009445)

## 问题描述
* 服务器上存在多个用户，大家通过VNC Viewer以图形窗口的形式访问服务器，但是在使用的过程中，VNC界面有时会没有反应，这时应该如何操作呢？
*  因为这个问题出现的比较多，在这里整理下，方便大家使用。

<!-- more -->

## 解决方法
**总的来说，就是通过SSH登录系统，然后通过命令重启自己的VNC Server即可。**

* 下载软件**PieTTY**。[点此下载](http://download.csdn.net/detail/xuezhisdc/9475974)
* PieTTY的有关设置请参考[《Putty使用设置》](http://blog.csdn.net/xuezhisdc/article/details/48622069)
* 双击软件，打开登录界面。

![这里写图片描述](http://img.blog.csdn.net/20160329211420717)

* 输入IP，（其它选项一般不要动）。点击下面的**open**打开登录框。

![这里写图片描述](http://img.blog.csdn.net/20160329211541240)

* 输入用户名和密码，登录系统。（如果不知道用户名和密码，联系管理员）

![这里写图片描述](http://img.blog.csdn.net/20160329211607068)

* 输入以下命令，查看自己的端口号。如下图所示，端口是5。
```
cd .vnc
ls
```
* 输入以下命令，重启VNC。
```
vncserver -kill :5 #5是端口号
vncserver :5 -geometry 1440x900 #分辨率
```

![这里写图片描述](http://img.blog.csdn.net/20160329211809940)

* 此时通过VNC Viewer登录试试，应该可以了。