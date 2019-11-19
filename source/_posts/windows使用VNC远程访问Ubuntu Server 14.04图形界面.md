---
title: windows使用VNC远程访问Ubuntu Server 14.04图形界面
tags: 
  - Windows
  - VNC
  - Linux
categories:
  - Windows
  - 经验
date: 2015-9-14 14:29:00
author: 张学志
---





## 说明
> 昨天刚刚在服务器上面安装完Ubuntu Server 14.04，并且装上了桌面环境Gnome。今天希望通过VNC可以远程访问Ubuntu图形界面，这样使用时就方便多了，既不用跑机房，也不必非得使用终端（Terminal）。

## 问题
按照网上的教程安装vnc4server之后，并设置xstartup文件。在windows端通过VNCViewer登录，只能看到命令行，其他的看不到。

<!-- more -->

## 安装以下软件
* 在终端中运行以下命令，安装相应软件

``` shell
sudo apt-get install xrdp vnc4server xbase-clients dconf-editor #安装xrdp，vnc4server

sudo apt-get install gnome-panel gnome-settings-daemon metacity nautilus gnome-terminal 
```

## 设置
* 设置ubuntu系统允许远程控制
* 取消加密
参考文章《[window下使用vnc远程登录ubuntu/linux图形界面](http://blog.sina.com.cn/s/blog_677265f601012mqg.html)》

## 修改xstartup
将~/.vnc/xstartup的内容修改成如下（复制，粘贴）
```
#!/bin/sh

# Uncomment the following two lines for normal desktop:
export XKL_XMODMAP_DISABLE=1
 unset SESSION_MANAGER
# exec /etc/X11/xinit/xinitrc
unset DBUS_SESSION_BUS_ADDRESS

gnome-panel &
gnome-settings-daemon &
metacity &
nautilus &
gnome-terminal &
```

## 验证
运行vncserver，在Windows中访问该主机，即可以看到图形窗口。


## 参考
* [window下使用vnc远程登录ubuntu/linux图形界面](http://blog.sina.com.cn/s/blog_677265f601012mqg.html) —— 最初参阅文章
* [Windows使用VNC viewer访问Ubuntu 14.04远程桌面的简单方法](http://blog.csdn.net/sunnylgz/article/details/40779973) —— 远程共享设置主要参考了该文章
* [Windows远程桌面连接ubuntu 14.04图解设置教程](http://www.zhixing123.cn/ubuntu/41953.html)
* [windows远程（xrdp+vnc）连接ubuntu linux](http://wangkerui.com/archives/391)
* [Ubuntu14.04使用VNC无法显示图形界面问题的解决](http://blog.csdn.net/wwq_1111/article/details/46502873) —— xstartup文件配置参考该文章
