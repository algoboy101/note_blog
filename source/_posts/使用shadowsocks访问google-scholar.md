---
title: 使用shadowsocksR访问google scholar
tags:
  - shadowsocks
  - 翻墙
  - 运维
categories:
  - 运维
  - ''
comments: true
updated: false
author: 张学志
abbrlink: b56e
date: 2018-04-13 20:32:00
---
> 本文描述了如何在windows下，使用shadowsocks，SwitchyOmega和chrome实现访问google scholar等网站。
<!-- more -->
## 获取shadowsocksR账号
* 获取的方法有以下几种：
	* 网上搜索免费账号
	* 网上购买shadowsocksR账号
	* 网上购买vps，自行搭建shadowsocksR服务器

* 推荐第三种：购买vps，自己搭建。

* VPS推荐，10$左右/年  [alpharacks](https://www.alpharacks.com)
* [一键安装脚本](https://github.com/iMeiji/shadowsocks_install/wiki/shadowsocksR-%E4%B8%80%E9%94%AE%E5%AE%89%E8%A3%85)
* [BBR加速](https://www.dz9.net/blog/4246.html)


## 安装shadowsocksR
* 下载。[下载地址](https://github.com/xuezhisd/ShadowsocksR-4.1.5-win/)
* 安装。
* 配置。将上一步得到的账号IP，密码，端口号等配置好。


## 安装chrome浏览器
* 这一步比较简单，直接忽略。


## 安装SwitchyOmega
* SwitchyOmega是chrome的一个插件，用作代理。
* 直接访问[Chrome 网上应用店](https://chrome.google.com/webstore/category/extensions?hl=zh-CN)安装即可。

## 设置SwitchyOmega
* 新建情景模式，如下图进行设置

```
代理协议：SOCKS5
代理服务器：127.0.0.1
代理端口：1080
```

![upload successful](/images/pasted-0.png)

* 现在就可以成功地访问google scholar等网站了。
