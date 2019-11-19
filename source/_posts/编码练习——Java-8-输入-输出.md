---
title: 编码练习——Java-8-输入/输出
tags: 
  - Java
categories:
  - 编程语言
  - Java
date: 2016-08-13 13:4:00
author: 张学志
---




## 基础编码

* 创建和删除文件
```java
import java.io.File;

public class Test {
	public static void main(String[] args) {
		File file = new File("D:/myword", "test.txt");
		if (file.exists()) {
			file.delete();
			System.out.println("文件已删除");
		} else {
			try {
				file.createNewFile();
				System.out.println("文件已创建");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
```

<!-- more -->

* 获取文件的信息
```java
import java.io.File;

public class Test {
	public static void main(String[] args) {
		File file = new File("D:/mywork", "work.txt");
		if (file.exists()) {
			String name = file.getName();
			long length = file.length();
			boolean hidden = file.isHidden();
			System.out.println("文件名称：" + name);
			System.out.println("文件长度：" + length);
			System.out.println("该文件是隐藏文件吗？" + hidden);
		} else {
			System.out.println("该文件不存在");
		}
	}
}
```
