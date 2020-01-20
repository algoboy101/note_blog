---
title: 编码练习——Java-String-API-练习
tags:
  - 编程
  - Java
categories:
  - 编程
  - Java
author: 张学志
abbrlink: dd33
date: 2016-08-28 12:58:00
description: ...
---






## 初始化（构造函数）
* 各种初始化方法
```
String str1 = new String();
System.out.println(str1);

char[] arr = {'a', 'b', 'c'};
String str2 = new String(arr);
System.out.println(str2);

String str3 = "zhang";
System.out.println(str3);

String str4 = new String("xuezhi");
System.out.println(str4);
```

<!-- more -->

## String方法
### str.charAt()
* 返回指定位置的字符
```
String str1 = new String("hello, world!");
		
System.out.println(str1.charAt(4));
```


### str.codePointAt()
* 返回指定位置字符的Unicode编码
```
public static void main (String[] args) {
String str1 = new String("hello, world!");

System.out.println(str1.codePointAt(4)); //o
System.out.println(str1.codePointAt(8)); //o
```


### str.codePointBefore()
* 返回指定位置前一位置的字符的Unicode编码
```
String str1 = new String("hello, world!");

System.out.println(str1.codePointBefore(3)); //l
System.out.println(str1.codePointBefore(4)); //l
```


### str.codePointCount()
* 返回指定范围内的Unicode的编码数量
```
String str1 = new String("hello, world!");

System.out.println(str1.codePointCount(0, 2)); //he
```


### str.compareTo()
* 比较两个字符串的字典序，相等时返回0
```
String str1 = "ba";
String str2 = "ba";
String str3 = "be";

System.out.println(str1.compareTo(str2));
System.out.println(str1.compareTo(str3));
```


### str.compareToIgnoreCase()
* 不区分大小形式，比较两个字符串的字典序，相等时返回0
```
String str1 = "ba";
String str2 = "bE";

System.out.println(str1.compareTo(str2));
// 不区分大小写
System.out.println(str1.compareToIgnoreCase(str2));
```


### str.concat()
* 字符串拼接
```
String str1 = "hello ";
String str2 = "world!";

String str3 = str1.concat(str2); // 通过concat()连接
String str4 = str1 + str2;	//通过+连接
System.out.println(str3);
System.out.println(str4);
```


### str.contains()
* 判断 字符串是否包含另一个字符串
```
String str1 = "hello ";
String str2 = "ll";
String str3 = "ab";

System.out.println(str1.contains(str2));
System.out.println(str1.contains(str3));
```


### str.contentEquals()
* 判断 两个字符串是否相等
```
String str1 = "hello ";
String str2 = "ll";
StringBuffer str3 = new StringBuffer("hello ");

System.out.println(str1.contentEquals(str2));	// String
System.out.println(str1.contentEquals(str3));	// StringBuffer
```


### str.copyValueOf()
* 将字符数组转换成字符串
```
char[] arr = {'h', 'e', 'l', 'l', 'o'};
String str1 = String.copyValueOf(arr);
String str2 = String.copyValueOf(arr, 2, 2);

System.out.println(str1);
System.out.println(str2);
```


### str.endsWith()
* 判断是否以子字符串结尾
```
String str1 = "hello, world";

System.out.println(str1.endsWith("world"));
```


### str.equals() & str.equalsIgnoreCase()
* 判等
```
String str1 = "hello, world";
String str2 = "Hello, world";

System.out.println(str1.equals(str2));
System.out.println(str1.equalsIgnoreCase(str2));
```


### str.format()
* 字符串格式化
```
String str1 = String.format("Hi, %s!", "Xuezhi");
String str2 = String.format("价格：%d元", 4);
String str3 = String.format("价格：%.2f元", 4.5);

System.out.println(str1);
System.out.println(str2);
System.out.println(str3);
```


### str.getBytes()
* 将字符串编码成byte数组
```
String str1 = "abcdef";
byte[] bArr = str1.getBytes();
// 打印
for (byte item : bArr) 
	System.out.print(item + " ");
```


### str.hashCode()
* 返回它的哈希码
```
String str1 = "abcdef";

System.out.println(str1.hashCode());
```


### str.indexOf()
* 返回字符首次出现的位置
```
String str1 = "abcabc";

System.out.println("a的位置是：" + str1.indexOf("a"));
System.out.println("a的位置是：" + str1.indexOf('a'));

System.out.println("a的位置是：" + str1.indexOf("a", 2));
```


### str.lastIndexOf()
* 返回字符最后出现的位置
```
String str1 = "abcabc";

System.out.println("a的最后位置是：" + str1.lastIndexOf("a"));
System.out.println("a的最后位置是：" + str1.lastIndexOf('a'));

System.out.println("a的最后位置是：" + str1.lastIndexOf("a", 2));
```


### str.intern()
* ？
* 仅当两字符串相等时，intern()返回值相等
```
String str1 = "abcabc";

String str2 = str1.intern();

System.out.println(str2);
```


### str.isEmpty()
* 判断字符串是否为空
```
String str1 = "abc";
String str2 = "";

System.out.println(str1.isEmpty());
System.out.println(str2.isEmpty());
```


### str.length()
* 返回字符串的长度
```
String str1 = "abc";
String str2 = "";

System.out.println(str1.length());
System.out.println(str2.length());
```


### str.matches()
* 是否匹配给定正则表达式
```
String str1 = "hello, world";

System.out.println(str1.matches("(.*)world(.*)"));
```


### str.replace()
* 字符替换 或 字符串替换
```
String str1 = "hello, world";
String str2 = str1.replace('h', 'H'); // char
String str3 = str1.replace("world", "WORLD"); // String

System.out.println(str2);
System.out.println(str3);
```


### str.replaceAll()
* 替换所有的符合正则表达式
```
String str1 = "hello, world";
String str2 = str1.replaceAll("l", "L"); // char

System.out.println(str2);
```


### str.replaceFirst()
* 替换第一个字符串
```
String str1 = "hello, world";
String str2 = str1.replaceFirst("l", "L"); 

System.out.println(str2);
```


### str.split()
* 字符串切分
```
String str1 = "abcabcabcabc";

String[] strArr = str1.split("a");
System.out.println(strArr.length);
for (String item : strArr) 
	System.out.println(item);

String[] strArr2 = str1.split("a",3);
System.out.println(strArr2.length);

for (String item : strArr2) 
	System.out.println(item);
```


### str.startsWith()
* 判断字符串是否以某子字符串开始
```
String str1 = "hello, world!";

System.out.println(str1.startsWith("hello"));
System.out.println(str1.startsWith("world", 7));// 偏移
```


### str.subSequence()
* 返回指定区间的字符序列
```
String str1 = "hello, world!";

System.out.println(str1.subSequence(7, 12));
```


### str.substring()
* 返回指定区间的字符串
```
String str1 = "hello, world!";

System.out.println(str1.substring(7, 12));
System.out.println(str1.substring(7));
```


### str.toCharArray()
* 将字符串转换成字符数组
```
String str1 = "hello";

char[] charArr = str1.toCharArray();

for (char item : charArr) 
	System.out.print(item + " ");
```


### str.toLowerCase()
* 转换成小写形式
```
String str1 = "abc DEF";

System.out.println(str1.toLowerCase());
```


### str.toUpperCase()
* 转换成大写形式
```
String str1 = "abc DEF";

System.out.println(str1.toUpperCase());
```


### str.trim()
* 去除字符串开头和结尾的空白符
```
String str1 = "  abc def  ";

System.out.println(str1.trim());
```


### str.valueOf()
* 将各种类型的数据 转换成 字符串
```
char[] charArr = {'a', 'b', 'c'};

System.out.println(String.valueOf(false));
System.out.println(String.valueOf('a'));
System.out.println(String.valueOf(charArr));
System.out.println(String.valueOf(4.5));
System.out.println(String.valueOf(4));
```

