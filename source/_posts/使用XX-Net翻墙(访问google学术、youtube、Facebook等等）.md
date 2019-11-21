---
title: 使用XX-Net翻墙(访问google学术、youtube、Facebook等等）
tags:
  - 翻墙
  - XX-Net
categories:
  - Windows
  - 经验
author: 张学志
abbrlink: 8d1f
date: 2015-09-12 21:02:00
---



## 一、XX-Net简介
XX-net是在原来goagent基础上开发，使用非常的方便，不需要复杂的操作。
需要（类）Chrome浏览器，SwitchySharp。

### 主要特性
* 集成GoAgent、GoGoTest等自动扫描IP，省事省力
* Web界面，人性化交互，傻瓜易用
* 内置了公共 appid, 方便新手
* 方便易用的细节、细节提示
### 平台支持情况
* Windows 7/8/10 （xp 需要 tcpip.sys 补丁, 比如用 tcp-z）
* Linux （Ubuntu不显示系统托盘）
* Mac OS X(10.7; 10.8; 10.9; 10.10)
## 二、下载地址

***下载 Chrome*** 通过360软件管家下载或百度搜索并下载
[下载 SwitchySharp](http://pan.baidu.com/s/1eQCoeQ2)
[下载 XX-Net](https://github.com/XX-net/XX-Net) 如下图所示。
![这里写图片描述](http://img.blog.csdn.net/20150911170406459)

## 三、安装过程

### 1.安装Chrome
* 方法一、通过360软甲管家直接安装，如下图所示。
	* 在搜索框中输入**chrome**，并点击*Enter键*；
	* 安装第一个（即稳定版）；
![这里写图片描述](http://img.blog.csdn.net/20150911170009049)

* 方法二、百度搜索，下载chrome**.exe，双击自动安装，所有选项按照默认参数即可。

### 2.安装SwitchySharp
* 方法一、官方安装
	* 在地址栏中输入`chrome://extensions`，回车，进入到**拓展程序页面**。
	* 点击下方的***获取更多扩展程序 ***按钮，进入到Google Store中；
	* 搜索框中输入`switchysharp`，安装SwitchySharp。
![这里写图片描述](http://img.blog.csdn.net/20150911170929423)
![这里写图片描述](http://img.blog.csdn.net/20150911171234901)
* 方法二、使用前面下载的SwitchySharp.crx文件安装
	* 在地址栏中输入`chrome://extensions`，回车，进入到**拓展程序页面**；
	* 将SwitchySharp.crx拖拽到该页面，即可自动安装。


### 3. 安装XX-Net
* 解压XX-Net-**.zip文件到当前路径下；
* （可选）将解压文件夹放到 *D:\Program Files\ *或其他你想要的**安装路径**；
* 切换到安装路径下，双击Start快捷方式，启动XX-Net。跳出对话框，选择确认即可。如果出现警告，一定要通过，否则程序无法运行。
* 重启浏览器，应该可以上网了。

## 四、配置
* 如果安装完XX-Net，并重启浏览器后仍无法翻墙，请按如下操作。
### 1. 配置SWitchySharp
* 点击SWitchySharp图标，点击***选项***按钮，如下图所示；
* 跳转到下面页面，点击***从文件恢复***按钮；
* 选择**SwitchyOptions.bak**文件【在XX-Net安装路径下】，如下图所示。
* 点击SWitchySharp图标，选中***GoAgent***按钮，如下图所示；
* 重启XX-Net和浏览器，查看是否可以翻墙。
![这里写图片描述](http://img.blog.csdn.net/20150911175737230)
![这里写图片描述](http://img.blog.csdn.net/20150911175751423)
![这里写图片描述](http://img.blog.csdn.net/20150911175921885)
![这里写图片描述](http://img.blog.csdn.net/20150911185603513)
### 2. 如何可以观看视频（youtube）
* 安装完成XX-Net之后，默认使用***公用appid***，不能看视频。如果想看视频的话，还需要申请去GAE申请自己的appid。
* 如何申请自己的GAE Application，请查看[博客](http://www.appifan.com/jc/201209/35517.html)
* 建立好自己的GAE appid之后，在浏览器地址栏中输入`127.0.0.1:8085`，并回车。跳转到XX-Net管理页面。如下图所示。
![这里写图片描述](http://img.blog.csdn.net/20150911183847260)
* 点击左侧的***部署服务端***。右侧第一行填刚才申请的GAE appID，多个使用`|`分隔；第二行填自己的gmail邮箱；第三项填Gmail邮箱的密码。填完之后点击***开始部署***，部署完成后如下图所示。
![这里写图片描述](http://img.blog.csdn.net/20150911184949241)
* 然后点击右侧的**配置**。如下图所示。填写刚刚部署过的GAE appID，多个使用`|`分隔。填写完成之后，点击**保存**。
![这里写图片描述](http://img.blog.csdn.net/20150911185121207)
* 重启XX-Net和Chrome，看看能不能在youtube.com上观看视频了。

### 3. 如何使用IPv6
* 校园网的同学可以直接使用IPv6进行翻墙，节省流量。如果不是校园网用户就不用设置了。。。
* 在浏览器地址栏中输入`127.0.0.1:8085`，并回车。跳转到XX-Net管理页面。如下图所示。
* 在左侧选择**配置**按钮。点击右侧的**高级选项**下拉菜单，将***使用IPv6***选项设置为ON。
![这里写图片描述](http://img.blog.csdn.net/20150911185946032)
* 打开XX-Net安装目录，使用记事本打开`.\gae_proxy\local\proxy.ini`，将`use_ipv6 = 0`修改为`use_ipv6 = 1`。
* 重启XX-Net和Chrome之后，就能使用IPv6翻墙了，当然也能浏览其他的网页。


## 五、参考
* [xxnet优化教程1](http://wallfans.eu.org/xxnet-optimize-1/)
* [GAE](https://appengine.google.com/)
* [XX-Net项目组](https://github.com/XX-net/XX-Net)
* [XX-Net超详细教程](https://github.com/XX-net/XX-Net/wiki/XXNET%E8%B6%85%E8%AF%A6%E7%BB%86%E6%95%99%E7%A8%8B)
