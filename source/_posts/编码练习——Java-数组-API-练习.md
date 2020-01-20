---
title: 编码练习——Java-数组-API-练习
tags:
  - 编程
  - Java
categories:
  - 编程
  - Java
author: 张学志
abbrlink: c2a4
date: 2016-08-28 12:56:00
description: ...
---




## java.util.Arrays


### Arrays.asList()
* 数组转换成列表

```
String[] strArray = {"zhang", "xue", "zhi"};
List<String> list = Arrays.asList(strArray);
// 打印元素
for (int i=0; i<list.size(); i++) {
	System.out.print(list.get(i) + " ");
}
```

<!-- more -->

### Arrays.binarySearch()
* 二分查找
* 查找前，一定要**排序**。
* 如果查找元素不存在，返回(-(insertion point) - 1)。
* 自然数表示查到，负数表示没有查找。

```
int[] a = {3,5,9,7,2};
Arrays.sort(a); // 排序
// 打印数组
for (int item : a) 
	System.out.print(item + " ");
System.out.println();
// 二分查找
int ind1 = Arrays.binarySearch(a, 2);
int ind2 = Arrays.binarySearch(a, 4);
int ind3 = Arrays.binarySearch(a, 1, 3, 5);
System.out.println("2的查找位置：" + ind1);
System.out.println("4的查找位置：" + ind2);
System.out.println("5的查找位置：" + ind3);

// 字符串
String[] strArray = {"aa", "bc", "ab", "cd"};
Arrays.sort(strArray);
int ind4 = Arrays.binarySearch(strArray, "bc");
System.out.println("'bc'的查找位置是：" + ind4);
```


### Arrays.copyOf()
* 复制长度大于原数组长度时，后面补零。

```
int[] a = {3,5,9,7,2};
int[] newa = Arrays.copyOf(a, 2);
int[] newa2 = Arrays.copyOf(a, 7);	//复制长度大于原数组的长度

for (int item : newa) 
	System.out.print(item + " ");
System.out.println();

for (int item : newa2) 
	System.out.print(item + " ");
System.out.println();
```


### Arrays.copyOfRange()
* 复制长度大于原数组长度时，后面补零。
* Java中区间一般都是左闭右开[a,b)，即包括左边，不包括右边。

```
int[] a = {3,5,9,7,2};
int[] newa = Arrays.copyOfRange(a, 1, 3);
int[] newa2 = Arrays.copyOfRange(a, 1, 8);	//复制长度大于原数组的长度

for (int item : newa) 
	System.out.print(item + " ");
System.out.println();

for (int item : newa2) 
	System.out.print(item + " ");
System.out.println();
```


### Arrays.deepEquals()
* 比较数组元素是否深层相等。
* 一维数组无区别，高维数组有区别。

```
String[][] ticTacToe1 = { { " O ", " O ", " X " }, { " O ", " X ", " X " },{ " X ", " O ", " O " } };
String[][] ticTacToe2 = { { " O ", " O ", " X " }, { " O ", " X ", " X " },{ " X ", " O ", " O " } };
System.out.println(Arrays.equals(ticTacToe1, ticTacToe2));// false
System.out.println(Arrays.deepEquals(ticTacToe1, ticTacToe2));// true

String[] ticTacToe3 = { " O ", " O ", " X " };
String[] ticTacToe4 = { " O ", " O ", " X " };  
System.out.println(Arrays.equals(ticTacToe3, ticTacToe4));  // true
System.out.println(Arrays.deepEquals(ticTacToe3, ticTacToe4));  // true
```


### Arrays.deepHashCode()
* 深层相等的两个数组的深层哈希编码也相等。

```
String[][] ticTacToe1 = { { " O ", " O ", " X " }, { " O ", " X ", " X " },{ " X ", " O ", " O " } };
String[][] ticTacToe2 = { { " O ", " O ", " X " }, { " O ", " X ", " X " },{ " X ", " O ", " O " } };
System.out.println(Arrays.equals(ticTacToe1, ticTacToe2));// false
System.out.println(Arrays.deepEquals(ticTacToe1, ticTacToe2));// true
// ticTacToe1和ticTacToe1深层相等，深层哈希编码也相等。
System.out.println(Arrays.deepHashCode(ticTacToe1));
System.out.println(Arrays.deepHashCode(ticTacToe2));
```


### Arrays.deepToString()

```
// 二维数组有区别
String[][] ticTacToe1 = { { " O ", " O ", " X " }, { " O ", " X ", " X " },{ " X ", " O ", " O " } };
System.out.println(Arrays.deepToString(ticTacToe1));	// 深层变换成字符串
System.out.println(Arrays.toString(ticTacToe1));		// 一般

// 一维数组无区别
String[] ticTacToe3 = { " O ", " O ", " X " };
System.out.println(Arrays.deepToString(ticTacToe3));	// 深层变换成字符串
System.out.println(Arrays.toString(ticTacToe3));		// 一般
```


### Arrays.equals()
* 参考Arrays.deepArrays()


### Arrays.fill()
* 填充数组元素

```
int[] a = {1,2,3,4,5,6};

Arrays.fill(a, 8);//全部填充
for (int item : a) 
	System.out.print(item + " ");
System.out.println();

Arrays.fill(a, 1, 3, 0);//指定范围，替换
for (int item : a) 
	System.out.print(item + " ");
```


### Arrays.hashCode()
* 如果两个数组相等，哈希编码也相等。
    
```
int[] a = {1,2,3,4,5,6};
int[] b = {1,2,3,4,5,6};
String[] c = {"a", "b", "c"};
String[] d = {"a", "b", "c"};

System.out.println("a==b:" + Arrays.equals(a, b));
System.out.println("a和b的哈希码分别为：" + Arrays.hashCode(a) + "\t" + Arrays.hashCode(b));
// 字符串
System.out.println("c==d:" + Arrays.equals(c, d));
System.out.println("c和d的哈希码分别为：" + Arrays.hashCode(c) + "\t" + Arrays.hashCode(d));

System.out.println("c==d:" + c.equals(d));
System.out.println("c和d的哈希码分别为：" + c.hashCode() + "\t" + d.hashCode());
```


### Arrays.sort()

```
int[] a = {6,5,4,3,2,1};
// 指定范围排序
Arrays.sort(a, 1, 4);
for (int item : a) 
	System.out.print(item + " ");
System.out.println();
// 全部元素排序
Arrays.sort(a);
for (int item : a) 
	System.out.print(item + " ");
System.out.println();
```


### Arrays.toString()
* 参考 Arrays.deepToString()



## 遍历数组
### 遍历一维数组

```
int[] a = {6,5,4,3,2,1};
// 遍历数组 for
for (int i=0; i<a.length; i++)
	if (i == a.length-1)
		System.out.print(a[i]);
	else
		System.out.print(a[i] + ", ");
System.out.println();

// 遍历数组  - foreach
for (int item : a)
	if (item == a[a.length-1])
		System.out.print(item);
	else 
		System.out.print(item + ", ");
```


### 遍历二维数组

```
int[][] a = {{1,2,3}, {4,5,6}, {7,8,9}};
// 遍历二维数组 for
for (int i=0; i<a.length; i++) {
	for (int j=0; j<a[i].length; j++)
		if (j == a[i].length-1)
			System.out.print(a[i][j]);
		else
			System.out.print(a[i][j] + ", ");
	System.out.println();
}
```


## 数组对象的方法
* 数组从java.lang.Object继承的方法：clone, equals, finalize, getClass, hashCode, notify, toString, wait

### arr.clone()
* 通过克隆生成另一个数组

```
int[] a = {1,2,3,4,5,6};
int[] b = a.clone();
Arrays.fill(a, 1, 4, 0); // 改变a，看是否对b有影响
//打印b
for (int item : b) 
	System.out.print(item + " ");
```

### arr.equals()
* arr.equals()和Arrays.equals()不同

```
int[] a = {1,2,3,4,5,6};
int[] b = a.clone();
int[] c = a;
// 判等
System.out.println(Arrays.equals(a, b)); // 比较内容
System.out.println(a.equals(b));	//比较地址
System.out.println(a.equals(c));
```

### arr.getClass()

```
int[] a = {1,2,3,4,5,6};

System.out.println(a.getClass());
```

### arr.hashCode()

```
int[] a = {1,2,3,4,5,6};

// 两种方法的结果不同。
System.out.println(a.hashCode()); 
System.out.println(Arrays.hashCode(a)); // Arrays.hashCode()
```

### arr.toString()

```
int[] a = {1,2,3,4,5,6};

System.out.println(a.toString());	// 地址
System.out.println(Arrays.toString(a));	//字符串
```

## 数组对象的属性

### arr.length

```
int[] a = {1,2,3,4,5,6};

int len = a.length;
System.out.println(len);
```
