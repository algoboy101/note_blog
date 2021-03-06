---
title: Linux命令——w
tags:
  - Linux
categories:
  - Linux
date: '2015-11-4 14:0:00'
author: 张学志
abbrlink: a95
description: ...
---




## w
* **功能**：显示已经陆的用户列表，和他们正在执行的指令。
<!-- more -->
* **提示**：
	* 单独执行w命令会显示所有的用户和他们执行的命令；
	* 您也可指定用户名称，仅显示某位用户和他正在执行的命令；
* **选项**： 
	* -h：不打印头信息； 
	* -u：显示进程和cpu时间时，忽略用户名【su切换到其它用户时，有区别】；
	* -s：使用短输出格式； 
	* -f：显示用户从哪登录； 
	* -V：显示版本信息。
* **示例**：
```bash
# 显示所有用户的信息
w
# 显示用户test的信息
w test
# 显示所有用户的信息，但是不显示头信息【标题栏】
w -h
# 显示短输出格式【精简格式】
w -s
# 显示/不显示用户从哪里登录
w -f
# 显示版本
w -V
```
* 参数 `u` 举例说明：
![这里写图片描述](http://img.blog.csdn.net/20151104201659742)

* 参数 `s` 举例说明：

![这里写图片描述](http://img.blog.csdn.net/20151104201811864)


## 参考网址
* [Linux命令查询网站](http://www.lx138.com/)
* [Linux命令大全](http://man.linuxde.net/)
* [baidu](http://baidu.com/)
* [Google](http://google.com.hk)

