---
title: c++-单例模式
tags:
  - c++
  - 编程
categories:
  - c++
  - ''
comments: true
updated: false
author: 张学志
abbrlink: '7470'
date: 2018-04-14 18:20:00
---
> 本文描述了单例模式的基本概念和一个例子。
<!-- more -->

## 基本概念
* Singleton 是对全局变量的取代策略。
* 作用：保证一个类只能有一个实例，并提供一个全局唯一的访问点。
	* 仅有一个实例：通过类的静态成员变量来体现。
	* 提供访问它的全局访问点：访问静态成员变量的静态成员函数来体现。
* 定义一个单例类，使用类的私有静态指针变量指向类的唯一实例，并用一个公有的静态方法获取该实例。
* 唯一实例类Singleton在静态成员函数中隐藏创建实例的操作。
* 特征：
	* 它有一个指向唯一实例的静态指针，并且是私有的；
	* 它有一个公有的函数，可以获取这个唯一的实例，并且在需要的时候创建该实例；
	* 它的构造函数是私有的，这样就不能从别处创建该类的实例。


## 例子

* 单例类的头文件：`Singleton.h`

```
//
// Created by xuezhi.zhang on 4/15/18.
//

#ifndef _SINGLETON_H_
#define _SINGLETON_H_

class Singleton{
private:
  static Singleton* pInstance; //静态成员，保存对象的唯一实例
  Singleton(); //私有化构造函数，使其无法在类外实例化
public:
  static Singleton* Instance();
  static void Destroy();
};

#endif //UNTITLED_SINGLETON_H

```

* 单例类的实现文件：`Singleton.pp`

```
//
// Created by xuezhi.zhang on 4/15/18.
//
#include <iostream>
#include "Singleton.h"

using namespace std;

Singleton* Singleton::pInstance = NULL;


Singleton::Singleton() {
  cout << "Singleton..." << endl;
}


Singleton* Singleton::Instance() {
  if (NULL == pInstance)
    pInstance = new Singleton();
  return pInstance;
}


void Singleton::Destroy() {
  delete pInstance;
  pInstance = NULL;
  cout << "Destroy..." << endl;
}


```

* 调用文件：`main.h`


```
#include <iostream>
#include "Singleton.h"

using namespace std;

int main()
{
  Singleton* ps = Singleton::Instance();
  Singleton::Destroy();

  return 0;
}
```


## 参考
* [C++设计模式-Singleton](https://www.cnblogs.com/jiese/p/3158517.html)