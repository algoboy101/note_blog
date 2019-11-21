---
title: 编码练习——Java-5-类和对象
tags:
  - Java
categories:
  - 编程语言
  - Java
date: '2016-08-12 13:5:01'
author: 张学志
abbrlink: f0b0
---

## 基本

* 构造方法

```java
public class AnyThing {
	public AnyThing() {
		this("this调用有参构造方法");
		System.out.println("无参构造函数");
	}
	
	public AnyThing(String name) {
		System.out.println("有参构造方法");
	}
}
```

* 主方法

```java
public class Test {
	public static void main(String[] args) {
		for (int i=0; i<args.length; i++) {
			System.out.println(args[i]);
		}
	}
}
```

* 成员变量

```java
public class Book {
	private int id;
	private String name;
	private String category;
	
	public String getName() {
		int id = 0;
		setName("Java");
		return id + this.name;
	}
	
	private void setName(String name) {
		this.name = name;
	}
	
	public Book getBook() {
		return this;
	}
	
	public static void main(String argvs[]) {
		Book book = new Book();
		String name = book.getName();
		System.out.println(name);
	}
}
```


* 静态变量、常量和方法

```java
public class Test {
	static double PI=3.1415;
	static int id;
	public static void method1() {
		System.out.println("静态方法");
	}
	
	public void method2() {
		System.out.println(Test.PI);
		System.out.println(Test.id);
		Test.method1();
	}
	public static void main(String[] args) {
		Test test = new Test();
		test.method2();
		Test.method1();
	}
}
```

* 权限修饰符
	* public
	* protected
	* private


* 实例 - 自定义图书类

```java
public class Book {
	private String title;
	private String author;
	private double price;
	
	public Book(String title, String author, double price) {
		this.title = title;
		this.author = author;
		this.price = price;
	}
	
	public String getTitle() {
		return title;
	}
	
	public String getAuthor() {
		return author;
	}
	
	public double getPrice() {
		return price;
	}
}
```

```java
public class Test {
	public static void main(String[] args) {
		Book book = new Book("《Java从入门到精通》", "明日科技", 59.8);
		System.out.println("书名：" + book.getTitle());
		System.out.println("作者：" + book.getAuthor());
		System.out.println("价格：" + book.getPrice() + "元");
	}
}
```

* 实例 - 温度单位换算工具

```java
import java.util.Scanner;
public class CelsiusConverter {
	
	public double getFahrenheit(double celsius) {
		double fahrenheit = 1.8 * celsius + 32;
		return fahrenheit;
	}
	
	public static void main(String[] args) {
		System.out.println("请输入要转换的温度（单位：摄氏度）");
		Scanner in = new Scanner(System.in);
		double celsius = in.nextDouble();
		CelsiusConverter converter = new CelsiusConverter();
		double fahrenheit = converter.getFahrenheit(celsius);
		System.out.println("转换完成的温度（单位：华氏度）：" + fahrenheit);
	}
}
```

* 创建对象

```java
public class Test {
	public Test() {	//构造方法
		System.out.println("创建对象...");
	}
	
	public static void main(String[] args) {
		new Test();
	}
}
```

* 调用类成员（变量和函数）

```java
public class TransferProperty {
	int i=47;	// 成员变量
	public void call() {	//成员方法
		System.out.println("调用call()方法");
		for(int i=0; i<3; i++) {
			System.out.print(i + "  ");
			if (i==2)
				System.out.println("\n");
		}
	}
	
	public static void main(String[] args) {	//构造方法
		TransferProperty t1 = new TransferProperty();
		TransferProperty t2 = new TransferProperty();
		t2.i=60;
		//使用第一个对象调用类成员变量
		System.out.println("第一个实例对象调用变量i的结果：" + t1.i++);
		t1.call();
		//使用第二个对象调用类成员变量
		System.out.println("第二个实例对象调用变量i的结果：" + t2.i);
		t2.call();
	}
}
```

* 对象的比较

```java
public class Test {
	
	public static void main(String[] args) {
		String c1 = new String("abc");
		String c2 = new String("abc");
		String c3 = c1;
		System.out.println("c2==c3的运算结果：" + (c2==c3));
		System.out.println("c2.equals(c3)的运算结果：" + (c2.equals(c3)));
	}
}
```

* 实例 - 统计图书销量（静态变量）
Book类

```java
public class Book {
	private static int counter=0;
	
	public Book(String title) {
		System.out.println("售出图书：" + title);
		counter++;
	}
	
	public static int getCounter() {
		return counter;
	}
}
```

测试类（Test）

```java
import java.util.Random;
public class Test {
	
	public static void main(String[] args) {
		String[] titles = {"《Java从入门到精通》", "《Java编程词典》", "<视频学Java>"};
		for (int i=0; i<5; i++) {
			new Book(titles[new Random().nextInt(3)]);
		}
		System.out.println("总计销售了" + Book.getCounter() + "本图书！");
	}
}
```


* 实例 - 重新计算对象的哈希码
Cat类

```java
import java.awt.Color;
public class Cat {
	private String name;
	private int age;
	private double weight;
	private Color color;
	public Cat(String name, int age, double weight, Color color) {
		this.name = name;
		this.age = age;
		this.weight = weight;
		this.color=  color;
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (obj == null) {
			return false;
		}
		if (getClass() != obj.getClass()) {
			return false;
		}
		Cat cat = (Cat) obj;
		return name.equals(cat.name) && (age == cat.age) 
				&& (weight == cat.weight) && (color.equals(cat.color));
	}
	
	@Override
	public int hashCode() {
		return 7*name.hashCode() + 11* new Integer(age).hashCode() + 13* new Double(weight).hashCode() + 17* color.hashCode();
	}
	
}
```

测试类（Test）

```java
public class Test {
	public static void main(String[] args) {
		Cat cat1 = new Cat("Java", 12, 21, Color.BLACK);
		Cat cat2 = new Cat("C++", 12, 21, Color.WHITE);
		Cat cat3 = new Cat("Java", 12,21,Color.BLACK);
		
		System.out.println("猫咪1号的哈希码：" + cat1.hashCode());
		System.out.println("猫咪2号的哈希码：" + cat2.hashCode());
		System.out.println("猫咪3号的哈希码：" + cat3.hashCode());
		System.out.println("猫咪1号是否与猫咪2号相同：" + cat1.equals(cat2));
		System.out.println("猫咪1号是否与猫咪3号相同：" + cat1.equals(cat3));
	}
}
```

* 实例 - 汉诺塔问题求解

```java
public class Test {
	public static void moveDish(int level, char from, char inter, char to) {
		if (level == 1) {
			System.out.println("从 " + from + " 移动盘子 1 号到 " + to);
		} else {
			moveDish(level-1, from, to, inter);
			System.out.println("从 " + from + " 移动盘子 " + level + " 号到 " + to);
			moveDish(level-1, inter, from, to);
		}
	}
	
	public static void main(String[] args) {
		int nDisks = 3;
		moveDish(nDisks, 'A', 'B', 'C');
	}
}
```

* 实例 - 单例模式的应用
Emperor类

```java
public class Emperor {
	private static Emperor emperor=null;
	private Emperor() {
		
	}
	public static Emperor getInstance() {
		if(emperor==null) {
			emperor = new Emperor();
		}
		return emperor;
	}
	public void getName() {
		System.out.println("我是皇帝：明日科技");
	}
}
```

测试类（Test）

```java
public class Test {
	public static void main(String[] args) {
		System.out.println("创建皇帝1对象：");
		Emperor emperor1 = Emperor.getInstance();
		emperor1.getName();
		System.out.println("创建皇帝2对象：");
		Emperor emperor2 = Emperor.getInstance();
		emperor2.getName();
		System.out.println("创建皇帝3对象：");
		Emperor emperor3 = Emperor.getInstance();
		emperor3.getName();
	}
}
```

