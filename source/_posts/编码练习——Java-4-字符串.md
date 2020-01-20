---
title: 编码练习——Java-4-字符串
tags:
  - 编程
  - Java
categories:
  - 编程
  - Java
author: 张学志
abbrlink: '8359'
date: 2016-08-11 13:15:00
description: ...
---





## 创建字符串

* 创建字符串对象-1

```java
public class Test {
	public static void main(String[] args) {
		String s = new String(); //创建字符串
		System.out.println(s);
	}
}

```

* 创建字符串对象-2

```java
public class Test {
	public static void main(String[] args) {
		char a[] = {'g', 'o', 'o', 'd'};
		String s = new String(a); // 创建字符串
		System.out.println(a);
	}
}

```

<!-- more -->

* 创建字符串对象-3

```java
public class Test {
	public static void main(String[] args) {
		char[] a = {'s','t','u','d','e','n','t'};
		String s = new String(a, 2, 4);
		System.out.println(s);
	}
}
```

## 字符串操作

* 字符串操作-拼接（+）

```java
public class Test {
	public static void main(String[] args) {
		String s1 = new String("Hello");
		String s2 = new String("world");
		String s = s1 + " " + s2;
		System.out.println(s);
	}
}
```

* 字符串操作-拼接（+）

```java
public class Test {
	public static void main(String[] args) {
		int booktime = 4;
		float practice = 2.5f;
		System.out.println("我每天花费" + booktime + "小时看书；" + practice + "小时上机练习");
	}
}
```

* 字符串操作-获取字符串长度

```java
public class Test {
	public static void main(String[] args) {
		String s = "We are students";
		System.out.println("字符串的长度是：" + s.length());
	}
}
```


* 字符串操作 - 获取指定字符的索引位置

```java
public class Test {
	public static void main(String[] args) {
		String s = "We are students";
		System.out.println("字符s在字符串s中的位置是：" + s.indexOf("s"));
		System.out.println("字符st在字符串s中的位置是：" + s.indexOf("st"));
	}
}
```

```java
public class Test {
	public static void main(String[] args) {
		String s = "We are students";
		System.out.print("字符s在字符串s中的最后位置是：");
		System.out.println(s.lastIndexOf("s"));
	}
}
```

* 字符串操作-获取指定索引位置的字符

```java
public class Test {
	public static void main(String[] args) {
		String s = "hello world";
		char mychar2 = s.charAt(6);
		System.out.println("字符串s中索引位置是6的字符位：" + mychar2);
	}
}
```


* 字符串操作-去除前导和尾部空格

```java
public class Test {
	public static void main(String[] args) {
		String s1 = "   Java class    ";
		String s2 = s1.trim();
		System.out.println("字符串原来的长度：" + s1.length());
		System.out.println("去除空格后的长度：" + s2.length());
		System.out.println("去除空格后的字符串是：" + s2);
	}
}
```


* 字符串操作-去除字符串中的所有空格

```java
import java.util.StringTokenizer;
public class Test {
	public static void main(String[] args) {
		String text = "  We are student  ";
		System.out.println("原来字符串是：");
		System.out.println(text);
		StringTokenizer st = new StringTokenizer(text, " ");
		StringBuffer sb = new StringBuffer();
		int i = 1;
		while (st.hasMoreElements()) {
			i++;
			sb.append(st.nextToken());
		}
		System.out.println("去掉字符串中所有空格之后的字符串是：");
		System.out.println(sb.toString());
		
	}
}
```

```java
public class Test {
	public static void main(String[] args) {
		String s = "J a v a 编 程 词  典  ";
		s = s.replaceAll(" ", "");
		System.out.println("去掉空格后的字符串为：" + s);
	}
}
```


* 字符串操作-字符串替换

```java
public class Test {
	public static void main(String[] args) {
		String s = "bad bad study";
		String news = s.replace("bad", "good");
		
		System.out.println("替换后的字符串是：" + news);
	}
}
```

```java
public class Test {
	public static void main(String[] args) {
		String s = "bad bad study";
		s = s.replaceFirst("bad", "good");
		
		System.out.println("替换后的字符串是：" + s);
	}
}
```


* 字符串操作-判断字符串是否相等

```java
public class Test {
	public static void main(String[] args) {
		String s1 = new String("I am a student");
		String s2 = new String("I am a student");
		String s3 = new String("I AM A STUDENT");
		String s4 = s1;
		
		boolean b1 = (s1 == s2);
		boolean b2 = (s1 == s4);
		boolean b3 = s1.equals(s2);
		boolean b4 = s1.equals(s3);
		boolean b5 = s1.equalsIgnoreCase(s2);
		boolean b6 = s1.equalsIgnoreCase(s3);
		
		System.out.println("s1 == s2：" + b1);
		System.out.println("s1 == s4:" + b2);
		System.out.println("s1 equals s2：" + b3);
		System.out.println("s1 equals s3：" + b4);
		System.out.println("s1 equalsIgnoreCase s2：" + b5);
		System.out.println("s1 equalsIgnoreCase s3：" + b6);
	}
}
```


* 字符串操作-判断字符串的开始与结尾

```java
public class Test {
	public static void main(String[] args) {
		String num1 = "22045612";
		String num2 = "21304578";
		
		boolean b1 = num1.startsWith("22");
		boolean b2 = num1.endsWith("78");
		boolean b3 = num2.startsWith("22");
		boolean b4 = num2.endsWith("78");
		
		System.out.println("字符串num1是以'22'开始的吗？" + b1);
		System.out.println("字符串num1是以'78'结束的吗？" + b2);
		System.out.println("字符串num2是以'22'开始的吗？" + b3);
		System.out.println("字符串num2是以'78'结束的吗？" + b4);
	}
}
```


* 字符串操作-字母大小写转换

```java
public class Test {
	public static void main(String[] args) {
		String s = new String("abc DEF");
		String news1 = s.toLowerCase();
		String news2 = s.toUpperCase();
		
		System.out.println("原字符串：" + s);
		System.out.println("全部转换成小写字母后的字符串：" + news1);
		System.out.println("全部转换成大写字母后的字符串：" + news2);
	}
}
```


* 字符串操作-字符串分割

```java
public class Test {
	public static void main(String[] args) {
		String s = new String("abc,def,ghi,gkl");
		String[] news = s.split(",");
		
		System.out.println("原字符串：" + s);
		System.out.println("按分割字符分割后的字符串是：");
		for (int i=0; i<news.length; i++) {
			System.out.println(news[i]);
		}
	}
}
```

```java
public class Test {
	public static void main(String[] args) {
		String s = new String("abc,def,ghi,gkl");
		String[] news2 = s.split(",", 2);
		
		for (int j=0; j<news2.length; j++) {
			System.out.println("按分割字符分割一次后的字符串是：");
			System.out.println(news2[j]);
		}
	}
}
```

* 实例 - 根据指定分隔符把字符串分行

```java
public class Test {
	public static void main(String[] args) {
		String s = "无言独上西楼，月如钩，寂寞梧桐深院锁清秋。" + 
					"剪不断、理还乱、是离愁，别是一般滋味在心头。";
		System.out.println("源字符串：" + s);
		System.out.println("源字符串的长度是：" + s.length());
		String[] news = s.split("，|。");
		for (int i=0; i<news.length; i++) {
			System.out.println(news[i]);
		}
		System.out.println("分行后字符串数组的长度是：" + news.length);
	}
}
```


* 实例 - 判断字符串是否是数字格式

```java
public class Test {
	public static void main(String[] args) {
		String s = "12312312";
		if (IsNumber(s)) {
			System.out.println(s + "是数字格式");
		} else {
			System.out.println(s + "不是数字格式");
		}
	}
	
	public static boolean IsNumber(String str) {
		char[] c = str.toCharArray();
		for (int i=0; i<c.length; i++) {
			if (Character.isDigit(c[i]))
				;
			else
				return false;
		}
		return true;
	}
}
```



## 随笔
* Eclipse
	* Babel可以汉化Eclipse
	* Ctrl+Alt+/：自动补全Java关键字
	* Alt+/：启动Eclipse代码辅助菜单
