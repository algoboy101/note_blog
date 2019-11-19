---
title: 错误-python-Not uninstalling six at /usr/lib/python2.7/dist-packages, owned by OS
tags: 
  - Linux
  - 错误
  - 安装和配置软件
categories:
  - Linux
  - 经验
date: 2015-11-11 13:43:00
author: 张学志
---




## 错误

```
sudo pip install --upgrade six
Downloading/unpacking six from https://pypi.python.org/packages/3.3/s/six/six-1.9.0-py2.py3-none-any.whl#md5=9ac7e129a80f72d6fc1f0216f6e9627b
Downloading six-1.9.0-py2.py3-none-any.whl
Installing collected packages: six
Found existing installation: six 1.5.2
Not uninstalling six at /usr/lib/python2.7/dist-packages, owned by OS
Successfully installed six
Cleaning up...

```

<!-- more -->


## 说明

### 1. `/usr/lib`和`/usr/local/lib`的区别
* 在ubuntu下，直接通过apt-get安装的软件一般会在`/usr`下面，自己编译安装的软件（或者通过一些其他的非官方途径）会在`/usr/local`下面
* 两个文件夹都是有效的，主要是看路径配的是哪一个以PYTHONPATH。
* 查看Python的搜索路径，发现`/usr/lib`在`/usr/local`之前。查看方法如下所示：

```
    python
    # 进入Python环境
    import sys
    sys.path
```
	
### 2. 安装python第三方包有3种方法
* 1 使用系统自带的包管理系统(deb, rpm, 等)
* 2 通过社区开发的各种工具，例如 pip ， easy_install 等
* 3 从源文件安装。

> 第一种方法安装在`/usr/lib`下，第二种和第三种方式安装在`/usr/local/lib`下面。

### 问题分析
* 上述问题中，应该先使用【默认Ubuntu】apt-get安装了python-six，版本是低版本的；然后使用pip希望使用高版本的six，就出错了。

## 解决问题
* 在`/usr/local/lib/python2.7/dist-packages/`下，新建mypack.pth文件，输入以下内容
 	* 新建这个文件的作用是，Python的搜索路径先搜搜/usr/local/lib/，后搜搜/usr/lib。
 
```
    # 文件内容
    /usr/local/lib/python2.7/dist-packages/
```

* 下载six源码
https://pypi.python.org/pypi/six or http://pypi.douban.com/simple/six
* 解压`tar -zxvf six**`
* 切换six**路径，并执行`sudo python setup.py install`

## 参考
* https://github.com/pypa/pip/issues/2964
* [Python开发生态环境简介](https://github.com/dccrazyboy/pyeco/blob/master/pyeco.rst)
* [virtualenv](https://virtualenv-chinese-docs.readthedocs.org/en/latest/)
* [PyCUDA error: cannot import name intern](http://codeyarns.com/2015/02/24/pycuda-error-cannot-import-name-intern/)