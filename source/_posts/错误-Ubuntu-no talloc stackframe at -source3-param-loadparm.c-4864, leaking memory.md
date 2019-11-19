---
title: 错误-Ubuntu-no talloc stackframe at ../source3/param/loadparm.c:4864, leaking memory
tags: 
  - Linux
  - 错误
  - 安装和配置软件
categories:
  - Linux
date: 2016-8-15 13:0:00
author: 张学志
---




## 错误
* 新安装的操作系统（Ubuntu 14.04），运行命令`sudo apt-get udpate`时，爆出以下错误。
```bash
sudo apt-get update

# 以下是错误信息
no talloc stackframe at ../source3/param/loadparm.c:4864, leaking memory
```

<!-- more -->


## 解决方法
* 该问题使用smb引起的。
* 运行以下命令：
```bash
sudo pam-auth-update
```
* 弹出对话框，取消“**SMB password synchronization**”的选项即可。（**Tab键**切换，**空格键**取消或选择）
* 如下图所示：
![这里写图片描述](http://img.blog.csdn.net/20160816090434537)