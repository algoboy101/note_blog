---
title: Python学习笔记(未完)
tags: 
  - Python
  - 学习笔记
categories:
  - 编程语言
  - Python
date: 2015-6-28 14:50:00
author: 张学志
---





# 学习资源

## 链接
* [Python快速教程](http://www.cnblogs.com/vamei/archive/2012/09/13/2682778.html)

* [Python2.7教程廖雪峰](http://www.liaoxuefeng.com/wiki/001374738125095c955c1e6d8bb493182103fac9270762a000/)

* [Python基础教程W3School](http://www.w3cschool.cc/python/python-tutorial.html)

<!-- more -->

## 工具
* Ubuntu下好用的终端xfce
* [实验楼：在线学习](http://www.shiyanlou.com/courses/214 )

## 笔记

* 字符串是特殊的`元组`
* 序列是一组有序的对象的集合
* 序列有两种：(元组)和[列表]
* markdown中代码块要以空行开始

## Python知识结构

- 基本的数据类型
- 数据结构
	- 列表
		- 创建：[]、list()
		- 索引：下标和切片
	- 元组
	- 字典
		- 创建：{}、dict()
		- 索引：键值
	- 集合
- 运算
	- 数学运算
		- 加(+)、减(-)、乘(*)、除(/)、乘方(`**`)、求余(%)
	- 比较运算
		- ==、!=
		- <、<=
		- >、>=
		- is、is not
	- 逻辑运算
		- True、False
- 基本语法
	- 使用`缩进`表示`代码块`，而不是`{}`
	- 条件中的`()`一般省略
	- 一行表示一个语句，一般不适用`;`结束语句
	- 使用#注释(程序开头文档使用3个引号)

- 结构
	- 选择
		- if、elif、else

			``` python
			if 5>3:
				print("Yes")
			```
	- 循环
		- for 遍历可迭代对象(序列)
		
			``` python
			for value in range(10):
				print(value)
			```
		- while 一般的循环
	
			``` python
			i = 0
			while i<10:
				print(i)
				i+=1
			```
	- 中断循环
		- break 跳出`本(一)层`循环
		- continue 跳出`本(一)次`循环
- 函数
	- 函数可以实现：重复使用一段程序
	- def、函数名、形参、冒号、函数体
	- 不可变对象(值传递)，可变对象（列表：址传递）
	- 当没有return时，返回None

		```
		def sumInt(a,b):
			s = a+b 
			return s
		```
- 面向对象
	- 复用、封装、继承
	- 对象.属性
	- self (相当于C++、Java中的`this`)
	- __init__ (构造函数)
- everything is object in python
	- 翻译：python中的一切都是对象
- 学习Python
	- dir()
		- 查询类（或对象）的属性（包括属性值和方法属性）
	- help()
		- 查询帮助文档
	- [官方文档](https://www.python.org/doc/)



## 概念
* 容器：可以存储多个元素的对象。如列表和字典
* del：关键字，用于删除对象
* 可变数据对象：可以通过引用其元素，改变对象自身（in-place change）,例如列表和字典。
* 不可变数据对象：不同改变对象本身，只能改变引用的指向，例如数字和字符串。
* Python 一切皆对象
* 任何一个有__call__()特殊方法的对象都被当作是函数。
* Python是多范式语言（Multi-paradigm）：面向对象，面向过程编程。还有函数式和声明式。
* 特殊方法的前后各有两个下划线。如__init__()
* Python的运算符（+-等）、内置函数和列表的引用是通过调用对象的特殊方法实现的
* 上下文管理器（context manager）：用于规定某个对象的使用范围。`with... as... `。
	* 相当于使用`缩进`规定了f的使用范围。
	* 使用上下文管理器时，进入程序块时，调用对象的__enter__()；离开程序块时，调用__exit__()。
``` python
with open('new.txt','w') as f:
	print(f.closed)
	f.write('Hello, world!')
print(f.closed)
```