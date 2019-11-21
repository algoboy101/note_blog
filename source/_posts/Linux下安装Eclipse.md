---
title: Linux下安装Eclipse
tags:
  - Linux
  - 安装和配置软件
categories:
  - Linux
  - 安装和配置软件
author: 张学志
abbrlink: 5eb9
date: 2015-11-14 13:42:00
---




## 前提
* 安装Eclipse之前，需要先安装Java。
* 安装Java参考 [**ubuntu下搭建JAVA开发环境**](http://jingyan.baidu.com/article/86fae346b696633c49121a30.html)


## 下载安装包
* 下载地址：[**点此下载**](http://www.eclipse.org/downloads/packages/release/luna/sr2)
* 提示：校园网可以使用Ipv6站点下载，速度快。

<!-- more -->

## 复制文件
* 将文件复制到安装路径下`/usr/local/`，并解压，最后执行。

```bash
cp eclipse-java-luna-SR2-linux-gtk-x86_64.tar.gz /usr/local/
# 解压
tar -zxvf eclipse-java-luna-SR2-linux-gtk-x86_64.tar.gz
cd eclipse
# 命令行中启动Eclipse
./eclipse
```


## 制作快捷方式
```
vi Eclipse.desktop

# 在文件中输入下面的内容
[Desktop Entry]
Name=Eclipse
Exec=/usr/local/eclipse/eclipse -desktop
Icon=/usr/local/eclipse/plugins/org.eclipse.platform_4.4.2.v20150204-1700/eclipse64.png
Type=Application
Comment=
Path=
Terminal=false
StartupNotify=false

# 复制到桌面中
mv Eclipse.desktop ~/Desktop/
```


## 错误分析
* 双击快捷方式时，如果出现以下错误，

![这里写图片描述](http://img.blog.csdn.net/20151114174718543)
	
* 如果安装了JDK，通过在eclipse/路径下新建jre/bin来解决。

```
mkdir jre
cd jre
ln -s $JAVA_HOME/bin bin
```
* 重新双击快捷方式，解决错误。


## 参考
* [ubuntu下搭建JAVA开发环境](http://jingyan.baidu.com/article/86fae346b696633c49121a30.html)
* [A Java Runtime Environment (JRE) or Java Development Kit (JDK) must be avail**重点内容**](http://www.cnblogs.com/jerome-rong/archive/2013/02/19/2916608.html)