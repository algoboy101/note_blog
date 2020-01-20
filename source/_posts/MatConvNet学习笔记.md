---
title: MatConvNet学习笔记
tags:
  - 深度学习
categories:
  - 深度学习
author: 张学志
abbrlink: f780
date: 2015-08-24 14:30:00
description: ...
---




## 概述

MatConvNet是VLFeat的一部分，是卷积神经网络（CNN）的一个实现。既可以使用matlab编程，又能使用GPU加速，是一个不错的CNN库。
[MatConvNet 主页](http://www.vlfeat.org/matconvnet/)

<!-- more -->

## 安装

### 下载MatConvNet工具箱

* 点此[下载工具箱](http://www.vlfeat.org/matconvnet/download/matconvnet-1.0-beta13.tar.gz)
* 我下载的版本是 `matconvnet-1.0-beta13.tar`
###解压文件
* 将压缩文件解压到 `matconvnet-1.0-beta13.tar`中
###编译安装
* 编译前，Matlab应该已经绑定C++编译器了。否则，会出错。Windows下安装Visual Studio即可，Linux下有自带的GCC
* 在Matlab中输入`mex -setup`，绑定C++编译器
* 打开Matlab，将工作路径切换到***.../matconvnet-1.0-beta13.tar***
* 在Matlab中执行命令： `addpath matlab`。添加搜索路径。
* 在Matlab中执行命令：`vl_compilenn`。编译工具箱。
* 在Matlab中执行命令：`vl_setupnn`。设置工具箱。

至此，工具箱已经安装完毕。

### 测试
*在Matlab中执行命令：`vl_test_nnlayers`。测试
