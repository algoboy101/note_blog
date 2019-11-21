---
title: 编码练习——Java-3-数组
tags:
  - Java
categories:
  - 编程语言
  - Java
date: '2016-08-11 13:5:01'
author: 张学志
abbrlink: '9562'
---




## 创建与输出数组

* 数组 - 实例 - 求一位数组各元素的和

```java
public class Test {
	public static void main(String[] args) {
		int[] num = {1,2,3,4,5,6,7,8,9,10};
		int sum = 0;
		System.out.println("一维数组中各元素的和是：");
		for (int i=0; i<num.length; i++) {
			if(i==9)
				System.out.print(num[i] + "=");
			else
				System.out.print(num[i] + "+");
			sum = sum + num[i];
		}
		System.out.println(sum);
	}
}
```

<!-- more -->

* 数组 - 实例 - 获取一维数组的最小值

```java
public class Test {
	public static void main(String[] args) {
		int[] num = {8,3,4,1,6,10};
		System.out.println("输出一维数组：");
		for (int i=0; i<num.length; i++) {
			System.out.print(num[i] + "  ");
		}
		
		int min = num[0];
		for(int j=0; j<num.length-1; j++) {
			if (min > num[j+1]) {
				min = num[j+1];
			}
		}
		System.out.println("\n一维数组的最小值是：" + min);
	}
}

```


* 二维数组 - 输出
	* Java创建数组后，将元素初始化为0.

```java
public class Test {
	public static void main(String[] args) {
		int a[][] = new int[3][4];
		System.out.println("输出3行4列的数组：");
		for (int i=0; i<a.length; i++){
			for (int j=0; j<a[i].length; j++) {
				System.out.print(a[i][j] + "  ");
			}
			System.out.println();
		}
	}
}

```

* 三维数组 - 输出

```java
public class Test {
	public static void main(String[] args) {
		int arr[][][] = new int[][][] {
				{{1,2,3},{4,5,6}},
				{{7,8,9},{10,11,12}},
				{{13,14,15},{16,17,18}}
				};
		for (int i=0; i<arr.length; i++) {
			System.out.println("三维数组的第" + (i+1) + "个元素是一个"+arr[i].length + "维数组，内容如下：");
			for(int j=0; j<arr[i].length; j++) {
				for (int k=0; k<arr[i][j].length; k++) {
					System.out.print(arr[i][j][k] + "\t");
				}
				System.out.println();
			}
			
		}
	}
}
```


* 实例 - 对矩阵进行转置运算

```java
public class Test {
	public static void main(String[] args) {
		int arr[][] = new int[][] {{1,2,3},{4,5,6},{7,8,9}};
		System.out.println("转置前的矩阵是：");
		printArray(arr);
		
		int arr2[][] = new int[arr.length][arr.length];
		for(int i=0; i<arr.length; i++) {
			for(int j=0; j<arr[i].length; j++)
				arr2[j][i] = arr[i][j];
		}
		System.out.println("转置后的矩阵是：");
		printArray(arr2);
	}
	
	private static void printArray(int[][] arr) {
		for (int i=0; i<arr.length; i++) {
			for (int j=0; j<arr.length; j++) {
				System.out.print(arr[i][j] + "  ");
			}
			System.out.println();
		}
		
	}
}
```

* 实例 - 求方阵的迹

```java
public class Test {
	public static void main(String[] args) {
		int arr[][] = new int[][] {{1,2,3}, {4,5,6}, {7,8,9}};
		int tr = 0;
		System.out.println("方阵arr[][]是：");
		for (int i=0; i<arr.length; i++) {
			for (int j=0; j<arr.length; j++) {
				System.out.print(arr[i][j] + "  ");
			}
			System.out.println();
		}
		
		for (int i=0; i<arr.length; i++)
			tr += arr[i][i];
		System.out.println("方阵arr[][]的迹是：" + tr);
	}
}
```

## 数组的基本操作 


* 数组的基本操作 - 遍历一维数组

```java
public class Test {
	public static void main(String[] args) {
		int day[] = new int[] {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
		for (int i=0; i<12; i++) {
			System.out.print((i+1) + "月有" + day[i] + "天" + "\t\t");
			if ((i+1)%3==0)
				System.out.println("\n");
		}
	}
}
```

* 数组的基本操作 - 遍历二维数组

```java
public class Test {
	public static void main(String[] args) {
		int b[][] = new int[][] {{1}, {2,3}, {4,5,6}};
		System.out.println("二维数组是：");
		for (int k=0; k<b.length; k++) {
			for (int c = 0; c<b[k].length; c++) {
				System.out.print(b[k][c] + "  ");
			}
			System.out.println();
		}
	}
}
```



* 数组的基本操作 - 遍历二维数组（foreach）

```java
public class Test {
	public static void main(String[] args) {
		int arr2[][] = new int[][] {{3,4,3}, {1,2}};
		for (int x[]:arr2) {
			for (int e : x) {
				System.out.print(e + "  ");
			}
			System.out.println();
		}
	}
}
```

* 数组的基本操作 - 填充数组元素（fill）

```java
import java.util.Arrays;
public class Test {
	public static void main(String[] args) {
		int arr[] = new int[5];
		Arrays.fill(arr, 8);
		for (int i=0; i<arr.length; i++)
			System.out.println("第" + (i+1) + "个元素是：" + arr[i]);
	}
}
```


* 数组的基本操作 - 填充数组元素（fill）

```java
import java.util.Arrays;
public class Test {
	public static void main(String[] args) {
		int arr[] = new int[] {45, 12, 2, 10, 1};
		Arrays.fill(arr, 1, 3, 8);
		
		for (int i=0; i<arr.length; i++) {
			System.out.println("第" + (i+1) + "个元素是：" + arr[i]);
		}
	}
}
```

* 数组的基本操作 - 排序

```java
import java.util.Arrays;
public class Test {
	public static void main(String[] args) {
		int arr[] = new int[] {23, 42, 12, 8, 5, 10};
		System.out.println("原一维数组是：");
		for (int i=0; i<arr.length; i++) {
			System.out.print(arr[i] + "  ");
		}
		Arrays.sort(arr);
		System.out.println("\n升序排列后的数组是：");
		for (int i=0; i<arr.length; i++) {
			System.out.print(arr[i] + "  ");
		}
	}
}
```


* 数组的基本操作 - 复制

```java
import java.util.Arrays;
public class Test {
	public static void main(String[] args) {
		int arr[] = new int[] {23, 42, 12};
		System.out.println("复制前的数组是：");
		for (int i=0; i<arr.length; i++) {
			System.out.print(arr[i] + "  ");
		}
		int newarr[] = Arrays.copyOf(arr, 5);
		System.out.println("\n复制后的数组是：");
		for (int i=0; i<newarr.length; i++){
			System.out.print(newarr[i] + "  ");
		}
	}
}

```

* 数组的基本操作 - 复制

```java
import java.util.Arrays;
public class Test {
	public static void main(String[] args) {
		int arr[] = new int[] {23, 42, 12, 84, 10};
		System.out.println("复制前的数组是：");
		for (int i=0; i<arr.length; i++) {
			System.out.print(arr[i] + "  ");
		}
		int newarr[] = Arrays.copyOfRange(arr, 0, 3);
		System.out.println("\n将数组下标0~3复制到新数组中：");
		for (int i=0; i<newarr.length; i++){
			System.out.print(newarr[i] + "  ");
		}
	}
}
```


* 实例 - 对比一维、二维数组所占内存

```java
public class Test {
	public static void main(String[] args) {
		int num1 = 1024*1024*2;
		int[] arr1 = new int[num1];
		for (int i=0; i<arr1.length; i++)
			arr1[i] = i;
		//获得占用内存总数，并将单位转换为MB
		long memory1 = Runtime.getRuntime().totalMemory()/1024/1024;
		System.out.println("用一维数组存储占用内存总量为：" + memory1);
		int num2 = 1024*1024;
		int[][] arr2 = new int[num2][2];
		for(int i=0; i<arr2.length; i++) {
			arr2[i][0] = i;
			arr2[i][1] = i;
		}
		long memory2 = Runtime.getRuntime().totalMemory()/1024/1024;
		System.out.println("用二维数组存储占用的内存总量为：" + memory2);
	}
}
```

* 实例 - 使用直接插入排序法排序

```java
public class Test {
	public static void main(String[] args) {
		int[] array = new int[] {20, 40, 90, 30, 80, 70, 50};
		System.out.println("排序前：");
		for (int i=0; i<array.length; i++) {
			System.out.print(array[i] + "  ");
		}
		int tmp;
		int j;
		for (int i=1; i<array.length; i++) {
			tmp = array[i];
			for (j=i-1; j>=0 && array[j] > tmp; j--) {
				array[j+1] = array[j];
			}
			array[j+1] = tmp;
		}
		System.out.println("\n排序后：");
		for (int i=0; i<array.length; i++) {
			System.out.print(array[i] + "  ");
		}
	}
}
```

* 实例 - 冒泡排序

```java
public class Test {
	public static void main(String[] args) {
		int[] array = new int[] {63, 4, 24, 1, 3, 13};
		System.out.println("冒泡排序法的过程是：");
		for (int i=1; i<array.length; i++) {
			for (int j=0; j<array.length-i; j++) {
				if (array[j] > array[j+1]) {
					int tmp = array[j];
					array[j] = array[j+1];
					array[j+1] = tmp;
				}
				System.out.print(array[j] + "  ");
			}
			System.out.print("【");
			for (int j=array.length-i; j<array.length; j++) {
				System.out.print(array[j] + "  ");
			}
			System.out.println("】");
		}
	}
}
```