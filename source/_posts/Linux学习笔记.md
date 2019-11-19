---
title: Linux学习笔记
tags: 
  - Linux
  - 学习笔记
categories:
  - Linux
  - 学习笔记
date: 2015-6-28 14:49:00
author: 张学志
---





## 终端

### 终端和控制台
* 终端：一台只有显示器和键盘，能够通过串口连接到计算机的设备就叫终端。一台计算机可以有N个终端。
* 控制台：直接连接在电脑上的那套键盘和显示器就叫做控制台。一台计算机只有一个控制台。
* 区别：终端是通过串口连接上的，不是计算机本身就有的设备；控制台是计算机本身就有的设备。

### 终端的本质
* 终端本质上对应着Linux上的/dev/tty设备。

### 终端模拟器
gnome-terminal、kconsole、xterm、xfce等等

<!-- more -->

### 终端的6个Virtual consoles
* Linux默认提供了6个virtual consoles，可以通过[Ctrl]+[Alt]+[F1]~[F6]进行切换。
* 切换回图形界面：[Ctrl]+[Alt]+[F7]

## Shell

### 重要快捷键
按键|功能
 ------|-----
 [Tab]|命令补全
 [Ctrl]+C|强行终止当前程序
  Ctrl+d	|键盘输入结束或退出终端
Ctrl+s|	暂定当前程序，暂停后按下任意键恢复运行
Ctrl+z|	将当前程序放到后台运行，恢复到前台为命令fg
Ctrl+a|	将光标移至输入行头，相当于Home键
Ctrl+e|	将光标移至输入行末，相当于End键
Ctrl+k|	删除从光标所在位置到行末
Alt+Backspace|	向前删除一个单词
Shift+PgUp|	将终端显示向上滚动
Shift+PgDn|	将终端显示向下滚动

### 历史命令
向上键

### 通配符
字符|	含义
-------|-----
*|	匹配 0 或多个字符
?|	匹配任意一个字符
[list]|	匹配 list 中的任意单一字符
[!list]|	匹配 除list 中的任意单一字符以外的字符
[c1-c2]|	匹配 c1-c2 中的任意单一字符 如：[0-9] [a-z]
{string1,string2,...}|	匹配 sring1 或 string2 (或更多)其一字符串
{c2..c2}|	匹配 c1-c2 中全部字符 如{1..10}

### 获取帮助
> man command_name


## 一些命令
* banner 绘制图形
	* sudo apt-get update; sudo apt-get install sysvbanner
	* banner shiyanlou

## Linux用户管理

### 查看用户
* who

> who am i
或
> who mom likes
> whoami  #只返回用户名

* pts/0中的pts表示伪终端，“伪”是相对于/dev/tty设备而言。
* [Ctrl]+[Alt]+[F1]~[F7]进行切换的/dev/tty是真终端
* 0是伪终端的序号。

### 文件类型
* Linux里面一切皆文件

标识符 |类型
-----|---
d|目录
l|软链接
b|块设备
c|字符设备
s|socket
p|管道
-|普通文件

### 文件权限
* rwx(421)

权限|二进制数|十进制数
---|---|----
r|100|4
w|010|2
x|001|1




