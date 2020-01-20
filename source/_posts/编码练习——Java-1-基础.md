---
title: 编码练习——Java-1-基础
tags:
  - 编程
  - Java
categories:
  - 编程
  - Java
date: '2016-08-10 13:5:00'
author: 张学志
abbrlink: '572'
description: ...
---




## 基础练习
* 输出

```
public class MyApp {
	public static void main(String[] args) {
		System.out.println("我能学好Java语言！");
	}
}

```

<!-- more -->

* 整数类型

```
public class Test {
	
	public static void main(String[] args) {
		byte mybyte = 124;
		short myshort = 32564;
		int myint = 45784612;
		long mylong = 46789451L;
		long result = mybyte+myshort+myint+mylong;
		System.out.println("四种类型相加的结果为："+result);
	}
}
```

* 浮点型

```java
public class Test {
	
	public static void main(String[] args) {
		float f1 = 12.23f;
		double d1 = 4562.12d;
		double d2 = 45678.1564;
		double result = f1+d1+d2;
		System.out.println("浮点数相加达到结果为："+result);
		
	}
}
```

* 字符型

```
public class Test {
	
	public static void main(String[] args) {
		int i = 'd';
		char c = 97;
		System.out.println("字符d的Unicode码是："+i);
		System.out.println("Unicode码97代表的字符是："+c);
	}
}
```


* 转义字符

```
public class Test {
	
	public static void main(String[] args) {
		char char1 = '\\';
		char char2 = '\u2605';
		System.out.println("输出反斜杠：" + char1);
		System.out.println("输出五角星：" + char2);
	}
}
```

* 变量（声明与定义）

```
public class Test {
	
	public static void main(String[] args) {
		int i= 10;
		System.out.println("i的初值是："+i);
		i= 100;
		System.out.println("i现在的值是："+i);
		
	}
}
```


* 声明常量
	* final
	* 一般大写

```
public class Test {
	public static void main(String[] args) {
		final double PI = 3.1415926F; // final 大写
		final boolean BOOL = true;
	}
}
```

* 变量和常量（静态变量）

```
public class Test {
	static final double PI = 3.14;
	static int age = 23;
	public static void main(String[] args) {
		final int number;
		number = 1235;
		age = 22;
		System.out.println("常量PI的值为："+PI);
		System.out.println("赋值后number的值为："+number);
		System.out.println("int型变量age的值为：" + age);
	}
}
```


* 成员变量（静态变量）和局部变量

```
public class Test {
	static int times = 3;
	public static void main(String[] args) {
		int times = 4;
		System.out.println("times的值为：" + times);
		System.out.println("times的值为：" + Test.times);
	}
}
```

* 赋值运算符

```
public class Test {
	public static void main(String[] args) {
		int a,b,c;
		a = 15;
		c = b = a+4;
		System.out.println("c的值为：" + c);
		System.out.println("b的值为：" + b);
	}
}

```

* 算术运算符

```
	public static void main(String[] args) {
		float number1 = 45.56f;
		int number2 = 152;
		System.out.println("45.56f和152的和为：" + (number1+number2));
		System.out.println("45.56f和152的差为：" + (number1-number2));
		System.out.println("45.56f和152的积为：" + (number1*number2));
		System.out.println("45.56f和152的商为：" + (number1/number2));
	}
}
```


* 关系运算符

```
public class Test {
	public static void main(String[] args) {
		int number1 = 4;
		int number2 = 5;
		System.out.println("4>5是否成立：" + (number1>number2));
		System.out.println("4<5是否成立：" + (number1<number2));
		System.out.println("4==5是否成立：" + (number1==number2));
		System.out.println("4!=5是否成立：" + (number1!=number2));
		System.out.println("4>=5是否成立：" + (number1>=number2));
		System.out.println("4<=5是否成立：" + (number1<=number2));
	}
}
```



* 逻辑运算符

```
public class Test {
	public static void main(String[] args) {
		int a = 2;
		int b = 5;
		boolean result1 = ((a>b) && (a!=b));
		boolean result2 = ((a>b) ||(a!=b));
		System.out.println("(a>b) && (a!=b)的值是：" + result1);
		System.out.println("(a>b) ||(a!=b)的值是：" + result2);
	}
}
```


* 按位运算符

```
public class Test {
	public static void main(String[] args) {
		int i = 46;
		int j = 97;
		char c = 'a';
		System.out.println("46 & 97 的值是：" + (i&j));
		System.out.println("46 & 'a' 的值是：" + (i^c));
		System.out.println("46 >>1  的值是：" + (i>>1));
	}
}
```



* 三元条件运算符

```
public class Test {
	public static void main(String[] args) {
		int i = 46;
		int j = 97;
		int z = i>j ? 100 : 200;
		System.out.println("i>j?100:200 的值是：" + z);
	}
}
```


* 实例 - 不用其它变量实现两个变量互换

```java
import java.util.Scanner;
public class Test {
	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		System.out.println("请输入变量A的值：\n");
		long A = scan.nextLong();
		System.out.println("请输入变狼B的值：\n");
		long B = scan.nextLong();
		System.out.println("A="+A+"\tB="+B);
		System.out.println("执行变量互换...");
		A = A^B;
		B = B^A;
		A = A^B;
		System.out.println("A="+A+"\tB="+B);
	}
}
```



* 实例 - 判断数字的奇偶性

```
import java.util.Scanner;
public class Test {
	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		System.out.println("请输入一个整数：");
		long number = scan.nextLong();
		String check = (number%2 == 0) ? "这个数字是：偶数" : "这个数字是：奇数";
		System.out.println(check);
	}
}
```


* 自动类型转换

```
public class Test {
	public static void main(String[] args) {
		float number1 = 45f;
		int number2 = 152;
		System.out.println(number1+number2);
	}
}
```

```
public class Test {
	public static void main(String[] args) {
		byte mybyte = 127;
		int myint = 150;
		float myfloat = 452.12f;
		char mychar = 10;
		double mydouble = 45.46546;
		//将运算结果输出
		System.out.println("127 + 452.12 = " + (mybyte+myfloat));
		System.out.println("127*150 = " + (mybyte*myint));
		System.out.println("127/10 = " + (mybyte/mychar));
		System.out.println("45.46546+10 = " + (mydouble+mychar));
	}
}
```


* 强制类型转换

```
public class Test {
	public static void main(String[] args) {
		int a = (int) 45.23;
		long y = (long)456.6F;
		int b = (int)'a';
		System.out.println("a = " + a);
		System.out.println("y = " + y);
		System.out.println("b = " + b);
	}
}
```


* 实例 - 类型转换

```
public class Test {
	public static void main(String[] args) {
		int intNum = 4;
		float floatNum = 9.5F;
		
		floatNum /= intNum; //自动类型转换
		System.out.println("9.5F/4 = " + floatNum);
		
		double numX = 4.88;
		double numY = 78.83;
		int numZ = (int)numX + (int)numY; //强制类型转换
		System.out.println("4.88 + 78.83 = " + numZ);
		
		char charVar = 'T';
		int intVar = (int) charVar;
		System.out.println("将字符T转换成int型变量是：" + intVar);
		
		int num1 = 34;
		double num2 = (double) num1/3;
		System.out.println("34的三分之一是："+num2);
	}
}
```



* 注释
	* 单行
	* 多行
	* 文档注释

```
public class Test {
	public static void main(String[] args) {
		// 单行注释
		
		/*
		 * 多行注释1
		 * 多行注释2
		 */
		
		/**
		 * 文档注释
		 */
	}
}

```


* 实例 - 判断某一年是否是闰年

```
import java.util.Scanner;
public class Test {
	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		System.out.println("请输入一个年份：");
		long year = scan.nextLong();
		if(year%4==0 && year%100!=0 || year%400==0) {
			System.out.println(year + "年是闰年！");
		}else {
			System.out.println(year + "年不是闰年！");
		}
	}
}
```


* 实例 - 求球形的体积

```
import java.util.Scanner;
public class Test {
	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		System.out.println("请输入球形的半径：");
		double r = scan.nextDouble();
		final double PI = 3.1415926;
		double volume = 4.0/3.0*PI*r*r*r;
		System.out.println("球形的半径是：" + r);
		System.out.println("圆周率是：" + PI);
		System.out.println("球形的体积是：" + volume);
	}
}
```


* 复合语句

```
public class Test {
	public static void main(String[] args) {
		int y = 40;
		System.out.println("输出y的值：" + y);
		int z = 245;
		boolean b;
		// 复合语句
		{
			b = y>z;
			System.out.println("y>z城里吗：" + b);
		}
	}
}

```