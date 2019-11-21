---
title: 编码练习——Java-7-集合类
tags:
  - Java
categories:
  - 编程语言
  - Java
author: 张学志
abbrlink: 61ef
date: 2016-08-12 13:55:00
---




## 基础代码

* List接口

```java
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
public class CollectionDemo {
	public static void main(String[] args) {
		String a="A", b="B", c="C", d="D", e="E";
		List<String> list = new LinkedList<String>();
		list.add(a);
		list.add(e);
		list.add(d);
		Iterator<String> firstIterator = list.iterator();
		System.out.println("修改前集合中的元素是：");
		while (firstIterator.hasNext()) {
			System.out.print(firstIterator.next() + "  ");
		}
		list.set(1,b);
		list.set(2,c);
		Iterator<String> it = list.iterator();
		System.out.println();
		System.out.println("修改后集合中的元素是：");
		while (it.hasNext()) {
			System.out.print(it.next() + "  ");
		}
	}
}
```

<!-- more -->

* List索引

```java
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
public class CollectionDemo {
	public static void main(String[] args) {
		String a="a", b="b", c="c", d="d", apple="apple";
		List<String> list = new ArrayList<String>();
		list.add(a);
		list.add(apple);
		list.add(b);
		list.add(apple);
		list.add(c);
		list.add(apple);
		list.add(d);
		System.out.println(list);
		System.out.println("apple第一次出现的索引位置是：" + list.indexOf(apple));
		System.out.println("apple最后一次出现的索引位置是：" + list.lastIndexOf(apple));
		System.out.println("b第一次出现的索引位置是：" + list.indexOf(b));
		System.out.println("b最后一次出现的索引位置是：" + list.lastIndexOf(b));
	}
}
```

* Set接口
	* 利用集合去除重复项
    
```java
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

public class CollectionDemo {
	public static void main(String[] args) {
		List<String> list = new ArrayList<String>();
		list.add("apple");
		list.add("pear");
		list.add("banana");
		list.add("apple");
		Set<String> set = new HashSet<String>();
		set.addAll(list);
		Iterator<String> it = set.iterator();
		System.out.println("集合中的元素是：");
		while(it.hasNext()) {
			System.out.print(it.next() + "  ");
		}
	}
}
```

* Map接口

```java
import java.util.HashMap;
import java.util.Map;

public class CollectionDemo {
	public static void main(String[] args) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("1", "apple");
		map.put("2", "pear");
		map.put("3", "orange");
		for (int i=1; i<=map.size(); i++) {
			System.out.println("第"+i+"元素是："+map.get(""+i+""));
		}
	}
}
```

* List接口的实现类

```java
import java.util.ArrayList;
import java.util.List;

public class Test {
	public static void main(String[] args) {
		List<String> list = new ArrayList<String>();
		int i = (int) (Math.random()*(list.size()-1));
		list.add("a");
		list.add("b");
		list.add("c");
		System.out.println("随机获取数组中的元素：" + list.get(i));
		list.remove(2);
		System.out.println("将索引是‘2’的元素从数组移除后，数组中的元素是：");
		for (int j=0; j<list.size(); j++) {
			System.out.print(list.get(j) + " ");
		}
	}
}
```

* Set接口的实现类

```java
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class CollectionDemo {
	public static void main(String[] args) {
		Set<People> hashSet = new HashSet<People>();
		hashSet.add(new People("陈同学", 201101));
		hashSet.add(new People("王同学", 201102));
		hashSet.add(new People("李同学", 201103));
		Iterator<People> it = hashSet.iterator();
		System.out.println("集合中的元素是：");
		while (it.hasNext()) {
			People person = it.next();
			System.out.println(person.getName() + "  " + person.getId_card());
		}
	}
}

class People {
	private String name;
	private long id_card;
	public People(String name, long id_card) {
		this.name = name;
		this.id_card = id_card;
	}
	public long getId_card() {
		return id_card;
	}
	public void setId_card(long id_card) {
		this.id_card = id_card;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
```

* 实例 - 使用for循环遍历ArrayList

```java
import java.util.ArrayList;
import java.util.List;

public class Test {
	public static void main(String[] args) {
		List<Integer> list = new ArrayList<Integer>();
		for (int i=0; i<10; i++) {
			list.add(i);
		}
		System.out.println("列表中的元素：" + list);
		System.out.println("列表中的奇数序号元素：");
		for (int i=1; i<list.size(); i +=2) {
			System.out.print(list.get(i) + "  ");
		}
	}
}
```

* 迭代器的创建和使用

```java
import java.util.ArrayList;
import java.util.Collections;
import java.util.ListIterator;

public class Test {
	public static void main(String[] args) {
		ArrayList<Integer> array = new ArrayList<Integer>();
		//使用Collections类中的工具方法addAll()向集合增加元素
		Collections.addAll(array, 1,2,3,4,5,6);
		System.out.println("集合中的元素：" + array);
		//使用无参数的方法获得ListIterator对象
		ListIterator<Integer> iterator = array.listIterator();
		//对于初始位置，判断是否具有下一个元素
		boolean hasNext = iterator.hasNext();
		System.out.println("集合是否具有下一个元素：" + hasNext);
		//对于初始位置，判断是否具有前一个元素
		boolean hasPrevious = iterator.hasPrevious();
		System.out.println("集合是否具有前一个元素：" + hasPrevious);
		int next = iterator.next();
		System.out.println("获得集合的下一个元素：" + next);
		int nextIndex = iterator.nextIndex();
		System.out.println("获得集合的下一个元素的索引：" + nextIndex);
		int previous = iterator.previous();
		System.out.println("获得集合的前一个元素：" + previous);
		int previousIndex = iterator.previousIndex();
		System.out.println("获得集合的前一个元素的索引：" + previousIndex);
		iterator.add(7);
		System.out.println("向集合中增加元素7后的集合：" + array);
		iterator.next();
		iterator.set(12);
		System.out.println("将获得的下一个元素修改成12后的集合：" + array);
		iterator.remove();
		System.out.println("将获得的下一个元素删除后的集合：" + array);
	}
}
```

* 实例 - Iterator遍历ArrayList

```java
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class Test {
	public static void main(String[] args) {
		List<Integer> list = new ArrayList<Integer>();
		for(int i=0; i<10; i++) {
			list.add(i);
		}
		System.out.println("列表中的全部元素：");
		for (Iterator<Integer> it = list.iterator(); it.hasNext();) {
			System.out.print(it.next() + " ");
		}
	}
}
```

* 实例 - ListIterator遍历ArrayList

```java
import java.util.ArrayList;
import java.util.List;
import java.util.ListIterator;

public class Test {
	public static void main(String[] args) {
		List<Integer> list = new ArrayList<Integer>();
		for(int i=0; i<10; i++) {
			list.add(i);
		}
		System.out.println("列表中的全部元素是：" + list);
		System.out.println("逆序输出列表中的元素：" );
		ListIterator<Integer> li = list.listIterator();
		for (li=list.listIterator(); li.hasNext();) 
			li.next();
		for (; li.hasPrevious(); ) 
			System.out.print(li.previous() + " ");
	}
}
```

