title: python-为Python添加默认模块搜索路径
tags:
  - python
  - 编程
categories:
  - python
comments: true
updated: false
author: 张学志
date: 2018-04-21 23:01:36
---
> 本文描述了3种**为Python添加模块搜索路径**的方法。
<!-- more -->



## 概述

* 总共有三种方法：①函数添加；②修改环境变量；③增加.pth文件。

## 一、函数添加

* 在`Python`中或Python文件中执行以下语句，将`/home/xuezhi.zhang/libs`添加到Python搜索目录中。

```
import sys
print sys.path
sys.path.append("/home/xuezhi.zhang/libs")
```

## 二、修改环境变量

* 用户可以通过修改环境变量PYTHONPATH来添加Python搜索目录。
* 将以下内容放到`~/.bashrc`中，并执行`source ~/.bashrc`使设置生效。
* 作用：将`${HOME}/workspace/mxnet/python`添加到Python搜索目录。

```
export PYTHONPATH=${PYTHONPATH}:${HOME}/workspace/mxnet/python
```

## 三、增加.pth文件

* 在site-packages目录中添加一个路径文件（如mypkpath.pth）。**注意：必须以.pth为后缀**。将你要加入的模块文件所在的目录名称写入该文件即可。

## 参考
* [为Python添加默认模块搜索路径](https://www.cnblogs.com/shanql/articles/5477483.html)
   

