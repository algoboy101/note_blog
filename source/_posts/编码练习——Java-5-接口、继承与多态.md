---
title: 编码练习——Java-5-接口、继承与多态
tags: 
  - Java
categories:
  - 编程语言
  - Java
date: 2016-08-12 13:5:00
author: 张学志
---




## 基础
* 定义接口

```java
public interface ICalculate {
	final float PI=3.14159f;
	float getArea(float r);
	float getCircumference(float r);
}
```

* 实现接口
	* 注意：要实现接口的所有方法（抽象）

```java
public class Cire implements ICalculate {
	// 计算圆面积
	public float getArea(float r) {
		float area = PI*r*r;
		return area;
	}
	// 计算圆周长
	public float getCircumference(float r) {
		float circumference = 2*PI*r;
		return circumference;
	}
}
```

<!-- more -->

* 实例 - 图片的不同格式保存
定义接口

```java
public interface ImageSaver {
	void save();
}
```
实现接口
```java
public class GIFSaver implements ImageSaver {
	//重写 - 多态
	@Override
	public void save() {
		System.out.println("将图片保存成GIF格式");
	}
}
```

* 实例 - 为汽车增加GPS定位功能
父类

```java
public class Car {
	private String name;
	private double speed;
	//省略getXX()和setXX()
	public double getSpeed() {
		return speed;
	}
	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append("车名：" + name + "，");
		sb.append("速度：" + speed + "千米/小时");
		return sb.toString();
	}
}
```

定义接口

```java
import java.awt.Point;
public interface GPS {
	public Point getLocation();
}
```

实现接口

```java
import java.awt.Point;
public class GPSCar extends Car implements GPS {
	@Override
	public Point getLocation() {
		Point point = new Point();
		point.setLocation(super.getSpeed(), super.getSpeed());
		return point;
	}
	
	@Override 
	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append(super.toString());
		sb.append("，坐标：（" + getLocation().x + "," + getLocation().y + "）");
		return sb.toString();
	}
}
```

测试类

```java
import java.awt.Point;
public class Test {
	public static void main(String[] args) {
		GPSCar gcar = new GPSCar();
		Point point = gcar.getLocation();
		System.out.println("坐标：（" + point.x + "," + point.y + "）");
		String info = gcar.toString();
		System.out.println(info);
	}
}
```

* 继承

```java
public class Test {
	public static void main(String[] args) {
		Pigeon pigeon = new Pigeon();
		System.out.println(pigeon.color);
	}
}

// 父类
class Bird {
	String color = "白色";
	String skin = "羽毛";
}
// 子类 - 继承（属性和方法）
class Pigeon extends Bird {
}
```

* 继承-重写

```java
public class Test {
	public static void main(String[] args) {
		Dog dog = new Dog();
		System.out.println("执行dog.cry();语句时的输出结果：");
		dog.cry();
		Cat cat = new Cat();
		System.out.println("执行cat.cry();语句时的输出结果：");
		cat.cry();
		Sheep sheep = new Sheep();
		System.out.println("执行cat.cry();语句时的输出结果：");
		sheep.cry();
	}
}

// 父类
class Animal {
	public Animal() {
		
	}
	
	public void cry() {
		System.out.println("动物发出叫声！");
	}
}
// 子类
class Dog extends Animal {
	public Dog() {
		
	}
	
	public void cry() {
		System.out.println("狗发出“汪汪...”声！");
	}
}
// 子类
class Cat extends Animal {
	public Cat(){
		
	}
	
	public void cry() {
		System.out.println("猫发出“喵喵...”声！");
	}
}
// 子类
class Sheep extends Animal {
	
}
```

* 调用父类的构造函数、成员变量和成员方法

```java
public class Test {
	public static void main(String[] args) {
		Tiger tiger = new Tiger();
		System.out.println("Tiger的皮肤：" + tiger.skin);
		tiger.test();
	}
}

// 父类
class Beast {
	String skin = "";
	public Beast() {	//无参构造函数
		
	}
	public Beast(String strSkin) {
		skin = strSkin;
	}
	public void move() {
		System.out.println("跑");
	}
}
// 子类 - 继承（属性和方法）
class Tiger extends Beast {
	public Tiger() {
		super("条纹");	//使用父类带参数的构造方法
	}
	public void test() {
		System.out.println("父类的肤色：" + super.skin);
		System.out.println("父类的动作跑：");
		super.move();
	}
}
```

* 实例 - 经理（子类）和员工（父类）的差异

```java
import java.util.Date;
public class Test {
	public static void main(String[] args) {
		Employee employee = new Employee();
		employee.setName("Java");
		employee.setSalary(100);
		employee.setBirthday(new Date());
		Manager manager = new Manager();
		manager.setName("明日科技");
		manager.setSalary(3000);
		manager.setBirthday(new Date());
		manager.setBonus(2000);
		//输出经理和员工的属性值
		System.out.println("员工的姓名：" + employee.getName());
		System.out.println("员工的工资：" + employee.getSalary());
		System.out.println("员工的生日：" + employee.getBirthday());
		System.out.println("经理的姓名：" + manager.getName());
		System.out.println("经理的工资：" + manager.getSalary());
		System.out.println("经理的生日：" + manager.getBirthday());
		System.out.println("经理的奖金：" + manager.getBonus());
	}
}

// 父类
class Employee {
	private String name;
	private double salary;
	private Date birthday;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getSalary() {
		return salary;
	}
	public void setSalary(double salary) {
		this.salary = salary;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
}
// 子类 - 继承（属性和方法）
class Manager extends Employee {
	private double bonus;
	public double getBonus() {
		return bonus;
	}
	public void setBonus(double bonus) {
		this.bonus = bonus;
	}
}
```


* 实例 - 重写父类中的方法

```java
public class Test {
	public static void main(String[] args) {
		Employee employee = new Employee();
		System.out.println(employee.getInfo());
		Manager manager = new Manager();
		System.out.println(manager.getInfo());
	}
}

// 父类
class Employee {
	public String getInfo() {
		return "父类：我是明日科技的员工！";
	}
}
// 子类 - 重写
class Manager extends Employee {
	@Override
	public String getInfo() {
		return "子类：我是明日科技的经理！";
	}
}
```

* 多态

```java
public class Test {
	final float PI=3.14159f;
	// 求圆形的面积
	public float getArea(float r) {
		float area = PI*r*r;
		return area;
	}
	// 求矩形的面积
	public float getArea(float l, float w) {
		float area = l*w;
		return area;
	}
	// 画任意形状的图形
	public void draw(int num) {
		System.out.println("画" + num + "个任意形状的图形");
	}
	// 画指定形状的图形
	public void draw(String shape) {
		System.out.println("画一个" + shape);
	}
	
	public static void main(String[] args) {
		Test test = new Test();
		float l=20;
		float w=30;
		float areaRectangle = test.getArea(l, w);
		System.out.println("求长为"+l+" 宽为"+w+"的矩形的面积是：" + areaRectangle);
		float r = 7;
		float areaCirc = test.getArea(r);
		System.out.println("求半径为"+r+"的圆的面积是："+areaCirc);
		int num=7;
		test.draw(num);
		test.draw("三角形");
	}
}
```


* 实例 - 计算几何图形的面积

```java
public class Test {
	public static void main(String[] args) {
		Circle circle = new Circle(1);
		System.out.println("图形的名称是：" + circle.getName());
		System.out.println("图形的面积是：" + circle.getArea());
		
		Rectangle rectangle = new Rectangle(1, 1);
		System.out.println("图形的名称是：" + rectangle.getName());
		System.out.println("图形的面积是：" + rectangle.getArea());
	}
}

// 父类
abstract class Shape {
	public String getName() {
		return this.getClass().getSimpleName();	//获得图形的名称
	}
	public abstract double getArea();	//获得图形的面积
}
// 子类
class Circle extends Shape {
	private double radius;
	public Circle(double radius) {
		this.radius = radius;
	}
	@Override
	public double getArea(){
		return Math.PI*Math.pow(radius, 2);
	}
}
// 子类
class Rectangle extends Shape {
	private double length;
	private double width;
	public Rectangle(double length, double width) {
		this.length = length;
		this.width = width;
	}
	@Override
	public double getArea() {
		return length * width;
	}
}
```

* 实例 - 简单的汽车销售商场

```java
public class Test {
	public static void main(String[] args) {
		System.out.println("顾客要购买BMW：");
		Car bmw = CarFactory.getCar("BMW");
		System.out.println("提取汽车：" + bmw.getInfo());
		
		System.out.println("顾客要购买Benz：");
		Car benz = CarFactory.getCar("Benz");
		System.out.println("提取汽车：" + benz.getInfo());
	}
}

// 父类
abstract class Car {
	public abstract String getInfo();
}
// 子类
class BMW extends Car {
	@Override
	public String getInfo() {
		return "BMW";
	}
}
// 子类
class Benz extends Car {
	@Override
	public String getInfo() {
		return "Benz";
	}
}
// 工厂
class CarFactory {
	public static Car getCar(String name) {
		if (name.equalsIgnoreCase("BMW")) {
			return new BMW();
		} else if (name.equalsIgnoreCase("Benz")) {
			return new Benz();
		} else {
			return null;
		}
	}
}
```


* 实例 - 使用Comparable接口自定义排序

```java
public class Employee implements Comparable<Employee> {
	private int id;
	private String name;
	private int age;
	public Employee(int id, String name, int age) {	// 构造函数
		this.id = id;
		this.name = name;
		this.age = age;
	}
	@Override
	public int compareTo(Employee o) {
		if (id > o.id) {
			return 1;
		} else if (id < o.id) {
			return -1;
		}
		return 0;
	}
	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append("员工的编号：" + id + "，");
		sb.append("员工的姓名：" + name + "，");
		sb.append("员工的年龄：" + age);
		return sb.toString();
	}
	
	public static void main(String[] args) {
		Employee employee1 = new Employee(1000,"学志", 27);
		Employee employee2 = new Employee(1001,"珊妮", 27);
		System.out.println("比较结果：" + employee1.compareTo(employee2));
		System.out.println("员工信息：" + employee1.toString());
	}
}
```

