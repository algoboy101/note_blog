---
title: 编码练习——Java-6-类的高级特性
tags: 
  - Java
categories:
  - 编程语言
  - Java
date: 2016-08-12 13:5:02
author: 张学志
---




## 基础代码

* 定义抽象类

```java
abstract class Fruit {
	public String color;
	public Fruit() {
		color = "绿色";
	}
}
```

<!-- more -->

* 定义抽象方法
	* 抽象类：Fruit
	* 抽象方法：harvest()

```java
public class Test {
	public static void main(String[] args) {
		System.out.println("调用Apple类的harvest()方法的结果是：");
		Apple apple = new Apple();
		apple.harvest();
		System.out.println("嗲用Orange类的harvest()方法的结果是：");
		Orange orange = new Orange();
		orange.harvest();
	}
}

abstract class Fruit {
	public String color;
	public Fruit() {
		color = "绿色";
	}
	public abstract void harvest();	//抽象方法
}

class Apple extends Fruit {
	@Override
	public void harvest() {
		System.out.println("苹果已经收获！");
	}
}
```


* 成员内部类

```java
public class OuterClass {
	innerClass in = new innerClass();
	public void ouf() {
		in.inf();
	}
	class innerClass {
		innerClass() {
		}
		public void inf() {
		}
		int y =  0;
	}
	public innerClass doit() {
		in.y = 4;
		return new innerClass();
	}
	
	public static void main(String[] args) {
		OuterClass out = new OuterClass();
		//内部类的对象实例化操作必须在外部类或外部类中的非静态方法中实现
		OuterClass.innerClass in = out.doit();
		OuterClass.innerClass in2 = out.new innerClass(); //实例化内部类对象
	}
}
```


* 获取内部类和外部类的引用

```java
public class OuterClass {
	private int x;
	private class Inner {
		private int x=9;
		public void doit(int x) {
			x++;	//调用形参x
			this.x++;	//调用内部类的变量
			OuterClass.this.x++;	//调用外部类的变量x
		}
	}
}
```

* 局部内部类

```java
public class SellOutClass {
	private String name;
	public SellOutClass() {
		name = "苹果";
	}
	public void sell(int price) {
		class Apple{
			int innerPrice=0;
			public Apple(int price) {
				innerPrice = price;
			}
			public void price() {
				System.out.println("现在开始销售" + name);
				System.out.println("单价为：" + innerPrice + "元");
			}
		}
		Apple apple = new Apple(price);
		apple.price();
	}
	public static void main(String[] args) {
		SellOutClass sample = new SellOutClass();
		sample.sell(100);
	}
}
```

* 匿名内部类

```java
public class OutString {
	public static void main(String[] args) {
		final String sourceStr = "吉林省 明日 科技有限公司 —— 编程 词典！";
		IStringDeal s = new IStringDeal() {	//匿名内部类
			@Override
			public String filterBlankChar() {
				String convertStr = sourceStr;
				convertStr = convertStr.replaceAll(" ", "");
				return convertStr;
			}
		};
		System.out.println("源字符串：" + sourceStr);
		System.out.println("转换后的字符串：" + s.filterBlankChar());
	}
}

interface IStringDeal { 
	public String filterBlankChar();
}
```

* 静态内部类

```java
public class StaticInnerClass {
	static int x = 100;
	static class Inner {
		static void doitInner() {
			System.out.println("外部类的成员变量"+x);
		}
		public static void main(String[] args){
			doitInner();
		}
	}
}
```


* 内部类的继承

```java
public class OutputInnerClass extends ClassA.ClassB {
	public OutputInnerClass(ClassA a) {
		a.super();
	}
}

class ClassA {
	class ClassB {
		
	}
}
```


* 实例 - 静态内部类求极值

```java
public class Test {
	public static void main(String[] args) {
		double[] array = new double[5];
		for (int i=0; i<array.length; i++) {
			array[i] = 100*Math.random();
		}
		System.out.println("源数组：");
		for(int i=0; i<array.length; i++) {
			System.out.print(array[i] + "  ");
		}
		System.out.println();
		System.out.println("最大值：" + MaxMin.getResult(array).getMax());
		System.out.println("最小值：" + MaxMin.getResult(array).getMin());
	}
}

class MaxMin {
	public static class Result {
		private double max;
		private double min;
		public Result(double max, double min) {
			this.max = max;
			this.min = min;
		}
		public double getMax() {
			return max;
		}
		public double getMin() {
			return min;
		}
	}
	public static Result getResult(double[] array) {
		double max = Double.MIN_VALUE;
		double min = Double.MAX_VALUE;
		for (double i : array) {
			if (i>max)
				max = i;
			if (i<min)
				min = i;
		}
		return new Result(max, min);
	}
}
```

