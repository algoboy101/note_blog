---
title: c++-定义类型别名
tags:
  - c++
  - 编程
categories:
  - c++
  - ''
comments: true
updated: false
author: 张学志
abbrlink: c71d
date: 2018-04-14 22:24:00
---
> 本文描述了C++中的3种定义“类型别名”的方式。
<!-- more -->


## 概述
* C++定义“类型别名”的3种方式：
	* `typedef`
	* `#define`
	* `using`

```
typedef 原来类型名 新类型名；

#define 新类型名 原类型名

using 新类型名 = 原来类型名;
```

## 异同
* 一般情况下，using与typedef所表述的意思没有区别。但是，涉及到为模板类型设置别名时，就出现差异了。C++编译器不支持使用typedef关键词为模板类设置别名，但是使用using的方式声明一个关键词却是允许的，这是C++11标准才有的。
* `#define`和`typedef`的异同：
 * `#define`是在程序预处理阶段完成的 ,也叫宏定义；
 * `#typedef`是在编译的时候完成的;后者更为灵活方便；
 * `#define`在处理指针方面处理不好,`typedef`处理更加合适。



## 参考

* [类型别名typedef与#define](https://blog.csdn.net/qq_29924041/article/details/54588487)
* [使用using与typedef来定义别名](https://www.cnblogs.com/yutongqing/p/6794652.html)






