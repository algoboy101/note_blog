---
title: 软件-Clion关联(高亮)cuda代码
tags:
  - 软件
  - Clion
  - ''
categories:
  - 软件
  - ''
comments: true
updated: false
author: 张学志
abbrlink: 17be
date: 2018-04-16 11:41:00
---
> 本文描述了如何在Clion中高亮cuda代码。
<!-- more -->

## 操作步骤

* 依次点击：File -> Setting -> Editor -> File Types，打开File Types对话框。

* 在上栏`Recognized File Types`单击`C/C++`。在下栏中点击`+`，将`*.cu`添加到规则中。

* 点击`Apply`和`OK`，使得配置生效。

* 现在cuda代码已经高亮了。
 
## 参考
* [Enable code indexing of Cuda in Clion
](https://stackoverflow.com/questions/39980645/enable-code-indexing-of-cuda-in-clion)
* [Register New File Type Association Dialog](http://www.jetbrains.com/help/clion/register-new-file-type-association-dialog.html)
* [Creating a file type](http://www.jetbrains.com/help/clion/creating-and-registering-file-types.html)

