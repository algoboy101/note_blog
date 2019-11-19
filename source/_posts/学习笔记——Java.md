---
title: 学习笔记——Java
tags: 
  - 笔记
  - Java
categories:
  - 编程语言
  - Java
date: 2016-8-9 13:14:00
author: 张学志
---




## Java基础语法
* 第一个Java程序（HelloWorld.java）

```java
public class HelloWorld { // 公开类 
    public static void main(String []args) { // 程序入口
       System.out.println("Hello World");    // 标准输出
    }
}
```

<!-- more -->
    
* 一个Java程序可以认为是一系列对象的集合，而这些对象通过调用彼此的方法来协同工作。
* 类、对象、方法和实例
	* 类：类是一个模板，它描述一类对象的行为和状态。
	* 对象：对象是类的一个实例，有状态和行为。
	* 方法：方法就是行为。
	* 实例变量：每个对象都有独特的实例变量，对象的状态由这些实例变量的值决定。
* 基本语法
	* 大小写敏感
	* 类名大写
	* 方法名小写
	* 源文件名必须和类名相同
	* 主方法入口：所有的Java 程序由`public static void main(String []args)`方法开始执行
* 标识符
	* 字母、美元符和下划线开始
	* 首字符之后可以是任何字符的组合
	* 不能使用关键字
	* 大小写敏感

* 修饰符
	* 可访问：default, public , protected, private
	* 不可访问：final, abstract, strictfp

* 变量
	* 局部变量
	* 类变量（静态变量）
	* 成员变量（非静态变量）

* 数组
	* 数组可以存储多个同类型的变量。

* 枚举
	* 枚举限制变量只能是预先设定好的值。使用枚举可以减少代码中的bug。

* 注释
	* 单行注释：`//`
	* 多行注释：`/*....*/`

* 继承
	* 一个类可以由其他类派生。利用继承的方法，可以重用已存在类的方法和属性，而不用重写这些代码。超类→子类。

* 接口
	* 对象间相互通信的协议。
	* 接口只定义派生要用到的方法，但是方法的具体实现完全取决于派生类。

* 关键字

| 关键字 | 描述|
| ------------- |:-------------|
|abstract|	抽象方法，抽象类的修饰符|
|assert|	断言条件是否满足|
|boolean|	布尔数据类型|
|break|	跳出循环或者label代码段|
|byte|	8-bit 有符号数据类型|
|case|	switch语句的一个条件|
|catch|	和try搭配扑捉异常信息|
|char|	16-bit Unicode字符数据类型|
|class|	定义类|
|const|	未使用|
|continue|	不执行循环体剩余部分|
|default|	switch语句中的默认分支|
|do|	循环语句，循环体至少会执行一次|
|double|	64-bit双精度浮点数|
|else|	if条件不成立时执行的分支|
|enum|	枚举类型|
|extends|	表示一个类是另一个类的子类|
|final|	表示一个值在初始化之后就不能再改变了。表示方法不能被重写，或者一个类不能有子类|
|finally|	为了完成执行的代码而设计的，主要是为了程序的健壮性和完整性，无论有没有异常发生都执行代码。|
|float|	32-bit单精度浮点数|
|for|	for循环语句|
|goto|	未使用|
|if|	条件语句|
|implements|	表示一个类实现了接口|
|import|	导入类|
|instanceof|	测试一个对象是否是某个类的实例|
|int|	32位整型数|
|interface|	接口，一种抽象的类型，仅有方法和常量的定义|
|long|	64位整型数|
|native|	表示方法用非java代码实现|
|new|	分配新的类实例|
|package|	一系列相关类组成一个包|
|private|	表示私有字段，或者方法等，只能从类内部访问|
|protected|	表示字段只能通过类或者其子类访问。子类或者在同一个包内的其他类|
|public|	表示共有属性或者方法|
|return|	方法返回值|
|short|	16位数字|
|static|	表示在类级别定义，所有实例共享的|
|strictfp|	浮点数比较使用严格的规则|
|super|	表示基类|
|switch|	选择语句|
|synchronized|	表示同一时间只能由一个线程访问的代码块|
|this|	表示调用当前实例，或者调用另一个构造函数|
|throw	抛出异常|
|throws|	定义方法可能抛出的异常|
|transient|	修饰不要序列化的字段|
|try|	表示代码块要做异常处理或者和finally配合表示是否抛出异常都执行finally中的代码|
|void|	标记方法不返回任何值|
|volatile|	标记字段可能会被多个线程同时访问，而不做同步|
|while|	while循环|

## Java对象和类
* Java支持以下概念：
	* 多态
	* 继承
	* 封装
	* 抽象
	* 类：类是一个模板，它描述一类对象的行为和状态。
	* 对象：对象是类的一个实例，有状态和行为。
	* 实例
	* 方法
	* 重载

* 举例：定义类

```java
public class Dog{ // Dog类（模板）
   String breed;  // 实例变量（属性）
   int age;
   String color;
   void barking(){// 方法
   }
}
```

* 类变量：
	* **局部变量**：**在方法、构造方法或者语句块中**定义的变量被称为局部变量。变量声明和初始化都是在方法中，方法结束后，变量就会自动销毁。
	* **成员变量**：成员变量是**定义在类中，方法体之外**的变量。这种变量在创建对象的时候实例化。成员变量可以被类中方法、构造方法和特定类的语句块访问。
	* **类变量**：类变量也**声明在类中，方法体之外**，但必须声明为**static类型**。

* 构造方法
	* 构造方法的名称必须与类同名。
	* 一个类可以有多个构造方法。
	* 如果没有显式地为类定义构造方法，Java编译器将会为该类提供一个默认构造方法。

* 创建对象
	* 使用关键字**new**来创建一个新的对象。
	* 创建对象的步骤：
		* 声明：包括名称和类型。
		* 实例化：用**new**创建对象。
		* 初始化：调用构造方法初始化对象。

* 访问实例的**变量和方法**
	* 运算符：**.**

```
/* 实例化对象 */
ObjectReference = new Constructor();
/* 访问其中的变量 */
ObjectReference.variableName;
/* 访问类中的方法 */
ObjectReference.MethodName();
```

* 源文件声明规则
	* 一个源文件中只能有一个public类
	* 一个源文件可以有多个非public类
	* 源文件的名称应该和public类的类名保持
	* 如果一个类定义在某个包中，那么package语句应该在源文件的首行。
	* mport语句放在package语句和类定义之间。
	* import语句和package语句对源文件中定义的所有类都有效。

* Java包：用于对类和接口分类。
* Import语句是用来提供一个合理的路径，使得编译器可以找到某个类。


## 基本数据类型
* Java两大数据类型：
	* **内置**数据类型
	* **引用**数据类型

* 内置数据类型
	* Java语言提供了**八种基本类型**。六种数字类型（四个整数型，两个浮点型），一种字符类型，还有一种布尔型。
	* 四种整数类型：byte、short、int、long。
	* 两种浮点型：float、double。
	* 一个布尔型：boolean (true、false)
	* 一个字符型：char (16 bits Unicode字符)

* 引用类型
	* 类似于C++指针。
	* 引用类型指向一个对象，指向对象的变量是引用变量。
	* 对象、数组都是引用数据类型。
	* 所有引用类型的默认值都是null。
	* 一个引用变量可以用来引用与任何与之兼容的类型。
	* 例子：`Site site = new Site("Runoob")`

* 常量
	* 使用**final**关键字修饰常量。
	* 一般用**大写字母**表示。
	* 常量前缀：八进制（0）和十六进制（0x）。
	* 字符串常量：`"...."`
	* 字符串常量和字符常量都可以包含任何Unicode字符。`String a = "\u0001";`。


## Java变量类型
* 声明变量格式：`type identifier [ = value][, identifier [= value] ...] ;`。
* Java变量类型：
	* 局部变量
		* 声明在方法、构造方法或者语句块中；
		* 用完即毁；
		* 只在声明它的方法、构造方法或者语句块中可见；
		* 在**栈**上分配；
		* 没有默认值，需要初始化。
	* 成员变量（实例变量）
		* 声明在一个类中，但在方法、构造方法和语句块之外；
		* 可以声明在使用前或者使用后；
		* 在对象创建的时候创建，在对象被销毁的时候销毁；
		* 访问修饰符可以修饰实例变量；
		* 实例变量对于类中的方法、构造方法或者语句块是可见的。一般情况下应该把实例变量设为私有。
		* 实例变量具有默认值。数值型变量的默认值是0，布尔型变量的默认值是false，引用类型变量的默认值是null。
		* 实例变量可以直接通过变量名访问。但在静态方法以及其他类中，就应该使用完全限定名：ObejectReference.VariableName。
	* 类变量（静态变量）
		* 在类中以static关键字声明，但必须在方法构造方法和语句块之外。
		* 类只拥有类变量的一份拷贝。
		* 静态变量储存在静态存储区。
		* 静态变量在程序开始时创建，在程序结束时销毁。
		* 静态变量具有默认值。
		* 类变量被声明为public static final类型时，类变量名称必须使用大写字母。


## Java修饰符
* 分为2类：
	* 访问修饰符
	* 非访问修饰符

* 访问修饰符
	* default，默认的，同一包内可见，不使用修饰符。
	* private，私有的，同一类内可见。
	* public，公有的，对所有类可见。
	* protected，受保护的，同一包和所有子类可见。
* 基本知识
	* 类和接口不能声明为private。
	* Private访问修饰符的使用主要用来隐藏类的实现细节和保护类的数据。
	* 私有访问类型的变量只能通过类中公共的getter方法被外部类访问。
	* public的类、方法、构造方法和接口能够被任何其他类访问。
	* 如果几个相互访问的public类分布在不同的包中，则需要导入相应public类所在的包。
	* Java程序的main() 方法必须设置成公有的，否则，Java解释器将不能运行该类。
	* protected的变量、方法和构造器能被同一个包中的任何其他类访问，也能够被不同包中的子类访问。

* 方法继承规则：
	* 父类中声明为public的方法在子类中也必须为public。
	* 父类中声明为protected的方法在子类中要么声明为protected，要么声明为public。不能声明为private。
	* 父类中声明为private的方法，不能够被继承。

* 非访问修饰符
	* static，创建类方法和类变量。
	* final，inal修饰的类不能够被继承，修饰的方法不能被继承类重新定义，修饰的变量为常量，是不可修改的。
	* abstract，创建抽象类和抽象方法。
	* synchronized和volatile，用于线程编程。

* 基本知识：
	* 抽象类不能用来实例化对象，声明抽象类的唯一目的是为了将来对该类进行扩充。
	* 如果一个类包含抽象方法，那么该类一定要声明为抽象类，否则将出现编译错误。
	* 抽象类可以包含抽象方法和非抽象方法。
	* 抽象方法是一种没有任何实现的方法，该方法的的具体实现由子类提供。


## Java运算符

* 运算符分类：
	* 算术运算符
	* 关系运算符
	* 位运算符
	* 逻辑运算符
	* 赋值运算符
	* 其他运算符

* 算术运算符
	* `+、-、*、/、%、++、--`
* 关系运算符
	* `==/!=、>、<、>=、<=`
* 位运算符
	* 应用对象：字节型（byte）、字符型（char）、短整型（short）、整型、长整型。
	* &，按位与
	* |，按位或
	* ^，按位异或
	* ~，按位补，翻转每一位
	* <<，按位左移
	* >>，按位右移
	* >>>，按位右移补零

* 逻辑运算符
	* `&&、||、!`

* 赋值运算符
	* `=、+=、-=、*=、/=、%=、<<=、>>=、&=、^=、|=`

* 条件运算符（?:）
	* `variable x = (expression) ? value if true : value if false`

* instanceOf
	* 检查该对象是否是一个特定类型（类类型或接口类型）

* 运算符优先级
![这里写图片描述](http://img.blog.csdn.net/20160809133521483)

## Java循环结构
* 三种循环结构：
	* while
	* do...while
	* for（主要用于数组）
* while
	* 最基本循环
    
```
while( 布尔表达式 ) {
    //循环内容
}
```

* do...while
	* 至少执行一次

```
do {
       //代码语句
}while(布尔表达式);
```

* for
	* for循环执行的次数是在执行前就确定的
    
```
for(初始化; 布尔表达式; 更新) {
    //代码语句
}
```

* 增强for循环
	* 主要用于数组
    
```
for(声明语句 : 表达式)
{
   //代码句子
}
```

* break
	* 跳出一层循环和switch语句块

* continue
	* 跳过一次循环

## Java分支结构
* 2种分支结构:
	* if...else...
	* switch

* if

```
if(布尔表达式)
{
   //如果布尔表达式为true将执行的语句
}
```

* if...else...

```
if(布尔表达式){
   //如果布尔表达式的值为true
}else{
   //如果布尔表达式的值为false
}
```

* if...else if...else

```
if(布尔表达式 1){
   //如果布尔表达式 1的值为true执行代码
}else if(布尔表达式 2){
   //如果布尔表达式 2的值为true执行代码
}else if(布尔表达式 3){
   //如果布尔表达式 3的值为true执行代码
}else {
   //如果以上布尔表达式都不为true执行代码
}
```

* 嵌套的if…else

```
if(布尔表达式 1){
   ////如果布尔表达式 1的值为true执行代码
   if(布尔表达式 2){
      ////如果布尔表达式 2的值为true执行代码
   }
}
```

* switch
	* 判断一个变量与一系列值中某个值是否相等，每个值称为一个分支。
	* switch语句中的变量类型只能为byte、short、int或者char。

```
switch(expression){
    case value :
       //语句
       break; //可选
    case value :
       //语句
       break; //可选
    //你可以有任意数量的case语句
    default : //可选
       //语句
}
```


## Number类
* Java语言为每一个内置数据类型提供了对应的包装类。
* 所有的包装类（Integer、Long、Byte、Double、Float、Short）都是抽象类Number的子类。
* 由编译器特别支持的包装称为**装箱**，所以当内置数据类型被当作对象使用的时候，编译器会把内置类型装箱为**包装类**。相似的，编译器也可以把一个对象**拆箱**为内置类型。Number类属于java.lang包。
* 区分：内置数据类型和对象？

```
Integer x = 5;
```


## Character类
* 用于对单个字符进行操作。
* Character 类在对象中包装一个基本类型 char 的值。
* 需要使用对象，而不是内置数据类型的情况。
* 注意:String类是不可改变的，所以你一旦创建了String对象，那它的值就无法改变了。 如果需要对字符串做很多修改，那么应该选择使用StringBuffer & StringBuilder 类。
* 用于获取有关对象的信息的方法称为访问器方法。

```
Character ch = 'a';
```


## String类
* 在Java中，String属于对象。
* 创建字符串：`String greeting = "Hello world!";`
* 方法：
	* 字符串长度：str.length()
	* 连接字符串：str.concat()、str1+str2
	* 创建格式化字符串
		* printf()
		* format()
		* String类的静态方法format()能用来创建可复用的格式化字符串，而不仅仅是用于一次打印输出。
        
```java
System.out.printf("浮点型变量的的值为 " +
                  "%f, 整型变量的值为 " +
                  " %d, 字符串变量的值为 " +
                  "is %s", floatVar, intVar, stringVar);
// or
String fs;
fs = String.format("浮点型变量的的值为 " +
                   "%f, 整型变量的值为 " +
                   " %d, 字符串变量的值为 " +
                   " %s", floatVar, intVar, stringVar);
System.out.println(fs);         
```

## StringBuffer和StringBuilder
* 当对字符串进行修改的时候，需要使用StringBuffer和StringBuilder类。
* StringBuilder的方法不是线程安全的（不能同步访问），这一点和StringBuffer不同。
* StringBuilder有速度优势，一般使用它。当程序要求线程安全时，必须使用StringBuffer。

```java
public class Test{
    public static void main(String args[]){
       StringBuffer sBuffer = new StringBuffer(" test");
       sBuffer.append(" String Buffer");
       System.out.println(sBuffer);  
   }
}
```

## Java数组
* Java数组是用来存储固定大小的同类型元素。
* 声明数组变量：

```
dataType[] arrayRefVar;   // 首选的方法
//或
dataType arrayRefVar[];  // 效果相同，但不是首选方法
```

* 创建数组（new）

```
arrayRefVar = new dataType[arraySize];
// 1. 使用dataType[arraySize]创建了一个数组。
// 2. 把新创建的数组的引用赋值给变量 arrayRefVar。
```

* 创建数组和声明数组变量

```java
dataType[] arrayRefVar = new dataType[arraySize];
dataType[] arrayRefVar = {value0, value1, ..., valuek};
```

* 处理数组
	* 数组元素类型和大小都是确定的，通常使用基本循环或foreach循环。
	* foreach循环或者加强型循环，它能在不使用下标的情况下遍历数组。
	* 数组可以作为参数传递给方法。
	* 数组作为函数的返回值。


## Java日期时间
* java.util包提供了Date类来封装当前的日期和时间。 
* Date类提供两个构造函数来实例化Date对象。
	* 第一个构造函数使用当前日期和时间来初始化对象。
	* 第二个构造函数接收一个参数，该参数是从1970年1月1日起的毫秒数。


## Java正则表达式
* Java正则表达式
	* 正则表达式定义了字符串的模式。
	* 正则表达式可以用来搜索、编辑或处理文本。
	* Java正则表达式和Perl的是最为相似的。
	* java.util.regex包主要包括以下三个类：
		* Pattern类：pattern对象是一个正则表达式的编译表示。
		* Matcher类：Matcher对象是对输入字符串进行解释和匹配操作的引擎。
		* PatternSyntaxException类：PatternSyntaxException是一个非强制异常类，它表示一个正则表达式模式中的语法错误。

* 捕获组
	* 捕获组是把多个字符当一个单独单元进行处理的方法，它通过对括号内的字符分组来创建。


## Java方法
* System.out.println()
	* System：系统类
	* out：标准输出对象
	* println()：方法
* 方法的定义：

```
修饰符 返回值类型 方法名 (参数类型 参数名){
    ...
    方法体
    ...
    return 返回值;
}
```
    
* 方法调用：
	* 根据是否返回值，分为2种：
		* 方法返回一个值的时候，方法调用通常被当做一个值。
		* 如果方法返回值是void，方法调用一定是一条语句。


## Java Stream、File、IO
* Java.io包几乎包含了所有操作输入、输出需要的类。所有这些流类代表了输入源和输出目标。
* Java.io包中的流支持很多种格式。
* 一个流可以理解为一个数据的序列。
* 读取控制台输入

```java
BufferedReader br = new BufferedReader(new 
                      InputStreamReader(System.in));
//从控制台读取单字符
char c = br.read();
//从控制台读取字符串
String str = br.readLine();
```
    
* 控制台输出
	* 控制台的输出由 print( ) 和println( )完成。这些方法都由类PrintStream 定义，System.out是该类对象的一个引用。
	* PrintStream 继承了OutputStream类，并且实现了方法write()。这样，write()也可以用来往控制台写操作。




## 参考：
* [Java教程](http://www.runoob.com/java/java-tutorial.html)
