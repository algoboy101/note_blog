---
title: python-让jupyter notebook支持python3
tags:
  - python
  - ''
categories:
  - python
  - ''
comments: true
updated: false
author: 张学志
abbrlink: '81e2'
date: 2018-04-24 22:02:00
---
> 本文描述了如何让jupyter notebook支持python3
<!-- more -->

* 安装完jupyter notebook之后，默认只支持python2。
* 其实jupyter还支持非常多的编程语言。点击[jupyter kernels list](https://github.com/jupyter/jupyter/wiki/Jupyter-kernels)查看jupyter支持哪些语言。

## 支持Python 3

* 命令行执行下面的命令

```
pip3 install ipykernel
python3 -m ipykernel install
```

* 重启jupyter

```
jupyter notebook 
```

* 此时，发现可以新建python3的notebook了。

## 参考

* [如何让Jupyter Notebook支持多种编程语言？](https://www.jianshu.com/p/8b90c2f12856)