title: python-pip更改国内镜像
tags:
  - python
  - 编程
categories:
  - python
  - ''
comments: true
updated: false
author: 张学志
date: 2018-04-18 18:20:00
---
> 本文描述了如何在linux上为python配置国内镜像源。
<!-- more -->


## 概述
* 更改国内镜像源的原因：
	* 访问国外镜像速度太慢
	
* 常见的国内镜像源有两个：
	* [豆瓣](http://pypi.douban.com/simple/)
	* [清华](https://pypi.tuna.tsinghua.edu.cn/simple)

* 推荐清华镜像源，因为我之前遇到有的包在豆瓣镜像上没装成功，换成清华镜像源之后，成功地安装了。


## 配置

* linux下，修改 `~/.pip/pip.con`f (没有就创建一个)， 修改 index-url至tuna，内容如下：
```
[global]
index-url = https://pypi.tuna.tsinghua.edu.cn/simple
```

## 参考：
* [更改pip源至国内镜像，显著提升下载速度](https://blog.csdn.net/lambert310/article/details/52412059)
