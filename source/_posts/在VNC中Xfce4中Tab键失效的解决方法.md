---
title: 在VNC中Xfce4中Tab键失效的解决方法
tags:
  - Linux
categories:
  - Linux
author: 张学志
abbrlink: f8c1
date: 2015-09-22 14:19:00
description: ...
---





## 说明
* 在Ubuntu Server 14.04上安装了xfce4桌面环境，但是却发现***在终端中Tab键不能自动补齐***(但是***Ctrl + I 仍然可以用***)。
* 出现这种情况的原因是，由于Tab键的功能被窗口快捷键占用，从而Tab键不起作用。即，快捷键冲突了。
* 解决方法有两种，其实本质相同。不过就是，一种方法是**在图形界面中更改**，另一种方法是**直接修改配置文件**。

<!-- more -->

## 1. 在命令行中修改配置文件的方法
```
#切换路径
cd ~/.config/xfce4/xfconf/xfce-perchannel-xml/
#修改文件（快捷键配置文件）
vi xfce4-keyboard-shortcuts.xml
```
* 找到下面这一行

```
<property name="&lt;Super&gt;Tab" type="string" value="switch_window_key"/>
```

* 改为

```
<property name="&lt;Super&gt;Tab" type="empty"/>
```

* 如下图所示
![这里写图片描述](http://img.blog.csdn.net/20150922213350275)

* 修改完配置文件，**`重启电脑`**，使配置文件生效。

## 2. 在图形窗口中修改的方法
* 菜单栏 → 设置 → 窗口设置 。打开**窗口设置**对话框。

<img src="http://img.blog.csdn.net/20150922223218078" width = "350" height = "600" alt="图片名称" align=center />
 
* 在窗口管理器中选择快捷键选项卡（Key） →  Switch window for same
application 
* 将其快捷键清空，关闭窗口管理器。
* 这种方法的好处：不需要重启，即可以解决问题。


## 参考
* [《在VNC远程桌面环境Xfce4中Tab键失效的解决方法 》](http://blog.163.com/thinki_cao/blog/static/83944875201303081111436/)
* http://ubuntuforums.org/archive/index.php/t-1771058.html
* https://answers.launchpad.net/ubuntu/+source/xfce4/+question/206191