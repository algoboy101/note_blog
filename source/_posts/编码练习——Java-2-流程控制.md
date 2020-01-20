---
title: 编码练习——Java-2-流程控制
tags:
  - 编程
  - Java
categories:
  - 编程
  - Java
date: '2016-08-11 13:5:00'
author: 张学志
abbrlink: 51eb
description: ...
---





## 条件

* 条件语句 - if

```
public class Test {
	public static void main(String[] args) {
		int a = 100;
		if(a==100) {
			System.out.println("a的值是 100");
		}
	}
}
```

```
public class Test {
	public static void main(String[] args) {
		int x = 45;
		int y = 12;
		if (x>y) {
			System.out.println("变量x 大于 变量y");
		}
		if (x<y) {
			System.out.println("变量x 小于 变量y");
		}
	}
}
```

<!-- more -->

```
public class Test {
	public static void main(String[] args) {
		int math = 95;
		if (math>60) {
			System.out.println("数学及格了");
		} else {
			System.out.println("数学没有及格");
		}
	}
}
```

```java
public class Test {
	public static void main(String[] args) {
		int x = 20;
		if(x>30) {
			System.out.println("a的值大于30");
		} else if (x>10) {
			System.out.println("a的值大于10，但小于30");
		} else if (x>0) {
			System.out.println("a的值大于0，但小于10");
		} else {
			System.out.println("a的值小于0");
		}
	}
}
```


* 条件语句 - switch

```
public class Test {
	public static void main(String[] args) {
		System.out.println("今天是星期几：");
		int week = 2;
		switch(week) {
		case 1:
			System.out.println("Monday");
			break;
		case 2:
			System.out.println("Tuesday");
			break;
		case 3:
			System.out.println("Wednesday");
			break;
		default:
			System.out.println("Sorry, I don't know");
				
		}
	}
}

```



* 实例 - 验证登录信息的合法性

```
import java.util.Scanner;
public class Test {
	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		System.out.println("请输入登录用户名：");
		String username = scan.nextLine();
		System.out.println("请输入登录密码：");
		String password = scan.nextLine();
		
		if (!username.equals("mr")) {
			System.out.println("用户名非法");
		} else if (!password.equals("mrsoft")) {
			System.out.println("登录密码错误");
		} else {
			System.out.println("恭喜您， 登录信息通过验证");
		}
	}
}
```


* 实例 - 为新员工分配部门

```
import java.util.Scanner;
public class Test {
	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		System.out.println("请输入新员工的姓名：");
		String name = scan.nextLine();
		System.out.println("请输入新员工应聘的编程语言：");
		String language = scan.nextLine();
		
		switch(language.hashCode()) {
		case 3254818:
		case 2301506:
		case 2269730:
			System.out.println("员工" + name + "被分配到Java程序开发部门。");
			break;
		case 3104:
		case 2112:
			System.out.println("员工" + name + "被分配到C#项目维护组。");
			break;
		case -709190099:
		case 955463181:
		case 9745901:
			System.out.println("员工"+name+"被分配到Asp.net程序测试部门。");
			break;
		default:
			System.out.println("本公司不需要" + language + "语言的程序开发人员。");
		}
		
	}
}
```

## 循环


* 循环语句 - while

```
public class Test {
	public static void main(String[] args) {
		int x = 1;
		int sum = 0;
		while (x<=10) {
			sum = sum+x;
			x++;
		}
		System.out.println("从1到10的和是：" + sum);
		
	}
}
```


* 循环语句 - do...while
	* 循环体，至少执行一次。

```java
public class Test {
	public static void main(String[] args) {
		int a = 100;
		while (a==60) {	//一遍不执行
			System.out.println("Ok! a==60");
			a--;
		}
		
		int b = 100;
		do {	//至少执行一次
			System.out.println("Ok! b==60");
			b--;
		}
		while (b==60);
		
	}
}
```


* 循环语句 - for

```java
public class Test {
	public static void main(String[] args) {
		int sum = 0;
		for(int i=1; i<=100; i+=1) {
			sum = sum+i;
		}
		System.out.println("1到100之间数的和为：" + sum);
	}
}
```


* 循环语句 -foreach

```java
public class Test {
	public static void main(String[] args) {
		int arr[] = {7, 10, 1};
		System.out.println("一维数组中的元素分别为：");
		for (int x : arr) {
			System.out.print(x+"\t");
		}
	}
}
```


* 实例 - 使用while循环遍历数组

```java
public class Test {
	public static void main(String[] args) {
		String[] aves = new String[] {"白露", "丹顶鹤", "黄鹂", "乌鸦", "喜鹊", "布谷鸟", "灰文鸟", "百灵鸟"};
		int index = 0;
		System.out.println("我的花园里有很多鸟，种类有：");
		while (index < aves.length) {
			System.out.print(aves[index++] + "   ");
		}
	}
}
```


* 实例 - 使用for循环输出九九乘法表

```java
public class Test {
	public static void main(String[] args) {
		for (int i=1; i<=9; i++) {
			for (int j=1; j<=i; j++) {
				System.out.print(j + "*" + i + "=" + (i*j) + "\t");
			}
			System.out.println();
		}
		
	}
}
```


* 跳转语句 - break

```java
public class Test {
	public static void main(String[] args) {
		int sum = 0;
		String flag = "从1到100之间连续整数的和是：";
		for (int i=1; i<=100; i++) {
			sum +=i;
			if(sum>1000) {
				flag = "从1到" + i + "之间连续整数的和是：";
				//跳出该层循环
				break;
			}
		}
		System.out.println(flag + sum);
		
	}
}

```


* 跳转语句 - continue

```java
public class Test {
	public static void main(String[] args) {
		int i = 0;
		System.out.println("10以内的奇数有：");
		while (i<10) {
			i++;
			if (i%2 == 0) {
				continue;
			}
			System.out.print(i + "  ");
		}
	}
}
```


* 跳转语句 - return

```java

```

* 实例 - 终止循环体（break）

```java
public class Test {
	public static void main(String[] args) {
		System.out.println("\n----中断单层循环的例子----");
		String[] array = new String[] {"白露","丹顶鹤","黄鹂","鹦鹉","乌鸦","喜鹊","老鹰","布谷鸟","老鹰","灰文鸟","老鹰","百灵鸟"};
		for (String string : array) {
			if (string.equalsIgnoreCase("老鹰"))
				break;
			System.out.print("有：" + string + "   ");
		}
		
		System.out.println("\n\n----中单2层循环的例子----");
		int[][] myScores = new int[][] {{67,78,63,22,66}, {55,68,78,95,44},{95,97,92,93,81}};
		System.out.println("宝宝这次考试成绩：\n数学\t语文\t英语\t美术\t历史");
		No1: for (int[] is : myScores) {
			for (int i : is) {
				System.out.print(i + "\t");
				if(i<60) {
					System.out.println("\n等等，" + i + "分的是什么？这个为什么不及格？");
					break No1;
				}
			}
			System.out.println();
		}
		
	}
}
```

* 实例 - 循环体的过滤器（continue）

```java
public class Test {
	public static void main(String[] args) {
		String[] array = new String[] {"白露","丹顶鹤","黄鹂","鹦鹉","乌鸦","喜鹊","老鹰","布谷鸟","老鹰","灰文鸟","老鹰","百灵鸟"};
		System.out.println("在我的花园里有很多鸟类，但是最近来了几只老鹰，请帮我把他们抓走。");
		int eagleCount = 0;
		for(String string : array) {
			if(string.equals("老鹰")) {
				System.out.println("发现一只老鹰，已经抓到笼子里。");
				eagleCount++;
				continue;
			}
			System.out.println("搜索鸟类，发现了：" + string);
		}
		System.out.println("一共捉到了：" + eagleCount + "只老鹰。");
	}
}
```

* 实例 - 使用for循环输出空心的菱形

```java
public class Test {
	public static void main(String[] args) {
		printHollowRhombus(10);
	}
	
	public static void printHollowRhombus(int size) {
		if (size%2==0) 
			size++;
		for (int i=0; i<size/2+1; i++) {
			for(int j=size/2; j>i+1; j--) {
				System.out.print(" ");
			}
			for (int j=0; j<2*i+1; j++) {
				if(j==0 || j==2*i) 
					System.out.print("*");
				else
					System.out.print(" ");
			}
			System.out.println("");
		}
		for(int i=size/2+1; i<size; i++) {
			for(int j=0; j<i-size/2; j++) {
				System.out.print(" ");
			}
			for(int j=0; j<2*size-1-2*i; j++) {
				if(j==0 || j==2*(size-i-1))
					System.out.print("*");
				else
					System.out.print(" ");
			}
			System.out.println("");
		}
	}
}
```

* 实例 - 使用for循环输出杨辉三角

```java
public class Test {
	public static void main(String[] args) {
		int triangle[][] = new int[8][];
		for (int i=0; i<triangle.length; i++) {
			triangle[i] = new int[i+1];
			for(int j=0; j<=triangle[i].length-1; j++) {
				if(i==0||j==0||j==triangle[i].length-1)
					triangle[i][j] = 1;
				else
					triangle[i][j] = triangle[i-1][j] + triangle[i-1][j-1];
				System.out.print(triangle[i][j] + "\t");
			}
			System.out.println();
		}
	}
}
```