---
title: c++-工厂模式
tags:
  - c++
  - 编程
categories:
  - c++
comments: true
updated: false
author: 张学志
abbrlink: d739
date: 2018-04-14 06:43:00
---
> 本文描述了c++工厂模式基本概念和一个例子。
<!-- more -->

## 基本概念
* 定义一个用于创建对象的接口，让子类决定实例化哪一个类。Factory Method使一个类的实例化延迟到其子类。又叫虚拟构造子（Virtual Constructor）模式或者多态性工厂（Polymorphic Factory）模式。 
*  工厂模式的好处：工厂模式就相当于创建实例对象的new。工厂模式也是用来创建实例对象的，可能多做一些工作，但会给你系统带来更大的可扩展性和尽量少的修改量。
* 通常我们都要在创建sample实例时做点初始化的工作。
* 需要将创建实例的工作与使用实例的工作分开, 也就是说，让创建实例所需要的大量初始化工作从Sample的构造函数中分离出去。
* 工厂模式是一个创建性的模式，他要求工厂类和产品类分开，由一个工厂类可以根据传入的参量决定创建出哪一种产品类的实例。但这些不同的实例有共同的父类



## 例子

* 文件：`main.cpp`

```
#include <iostream>
using namespace std;

class IHuman
{
public:
  IHuman(void)
  {

  }
  ~IHuman()
  {

  }
  virtual void Laugh() = 0;
  virtual void Cry() = 0;
  virtual void Talk() = 0;

};

class WhiteHuman : public IHuman
{
public:
  WhiteHuman(void)
  {

  }
  ~WhiteHuman(void)
  {

  }
  void Laugh()
  {
    std::cout << "白种人笑！" << std::endl;
  }
  void Cry()
  {
    std::cout << "白种人哭！" <<std::endl;
  }
  void Talk()
  {
    std::cout << "白种人说话！" <<std::endl;
  }
};

class YellowHuman : public IHuman
{
public:
  YellowHuman(void)
  {

  }
  ~YellowHuman(void)
  {

  }
  void Laugh()
  {
    std::cout << "黄种人笑！" << std::endl;
  }
  void Cry()
  {
    std::cout << "黄种人哭！" <<std::endl;
  }
  void Talk()
  {
    std::cout << "黄种人说话！" <<std::endl;
  }
};

class BlackHuman : public IHuman
{
public:
  BlackHuman(void)
  {

  }
  ~BlackHuman(void)
  {

  }
  void Laugh()
  {
    std::cout << "黑种人笑！" << std::endl;
  }
  void Cry()
  {
    std::cout << "黑种人哭！" <<std::endl;
  }
  void Talk()
  {
    std::cout << "黑种人说话！" <<std::endl;
  }
};


class IHumanFactory
{
public:
  IHumanFactory(void)
  {

  }
  ~IHumanFactory(void)
  {

  }
  virtual IHuman* CreateHuman() = 0;

};


class WhiteHumanFactory: public IHumanFactory
{
public:
  WhiteHumanFactory(void)
  {

  }
  ~WhiteHumanFactory(void)
  {

  }
  IHuman *CreateHuman()
  {
    return new WhiteHuman();
  }

};

class YellowHumanFactory: public IHumanFactory
{
public:
  YellowHumanFactory(void)
  {

  }
  ~YellowHumanFactory(void)
  {

  }
  IHuman *CreateHuman()
  {
    return new YellowHuman();
  }

};

class BlackHumanFactory: public IHumanFactory
{
public:
  BlackHumanFactory(void)
  {

  }
  ~BlackHumanFactory(void)
  {

  }
  IHuman *CreateHuman()
  {
    return new BlackHuman();
  }

};


int main()
{
  std::cout << "#1.制造黄种人"<<std::endl;
  IHumanFactory *pHumanFactory = new YellowHumanFactory();
  IHuman * pHuman = pHumanFactory->CreateHuman();
  pHuman->Cry();
  pHuman->Laugh();
  pHuman->Talk();
  delete pHuman;
  delete pHumanFactory;

  std::cout << "#1.制造白种人"<<std::endl;
  IHumanFactory *pHumanFactory2 = new WhiteHumanFactory();
  IHuman * pHuman2 = pHumanFactory->CreateHuman();
  pHuman->Cry();
  pHuman->Laugh();
  pHuman->Talk();
  delete pHuman2;
  delete pHumanFactory2;

  std::cout << "#1.制造黑种人"<<std::endl;
  IHumanFactory *pHumanFactory3 = new BlackHumanFactory();
  IHuman * pHuman3 = pHumanFactory->CreateHuman();
  pHuman->Cry();
  pHuman->Laugh();
  pHuman->Talk();
  delete pHuman3;
  delete pHumanFactory3;

  getchar();
  return 0;

}
```


## 参考

* [c++工厂模式 (Factory method)](https://www.cnblogs.com/onlycxue/p/3428075.html)
* [C++设计模式之工厂方法模式（Factory Method）](https://blog.csdn.net/hahaha777527/article/details/50965621)