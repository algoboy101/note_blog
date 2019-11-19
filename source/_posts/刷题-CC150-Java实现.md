---
title: 刷题-CC150-Java实现
tags: 
  - Java
  - CC150
categories:
  - 编程语言
  - Java
date: 2016-8-13 13:14:00
author: 张学志
---




---

# 8.1

## 1.1 字符串互异
* 确定一个字符串的所有字符是否全都不同。
	* 方法一：逐字符比较的方法。时间复杂度：$O(n^2)$。

```java
import java.util.*;

public class Different {
    public boolean checkDifferent(String iniString) {
        // write code here
        if (iniString.length()>256)
            return false;
        for (int i=0; i<iniString.length()-1; i++) {
            for (int j=i+1; j<iniString.length(); j++) {
                if (iniString.charAt(i) == iniString.charAt(j))
                    return false;
            }
        }
        return true;
    }
}
```

<!-- more -->
    
* 方法二：

```java
import java.util.*;

public class Different {
    public boolean checkDifferent(String iniString) {
        // write code here
        if (iniString.length()>256)
            return false;
        boolean[] char_set = new boolean[256];
        for (int i=0; i<iniString.length(); i++) {
            char val = iniString.charAt(i);
            if ((val < 0) ||(val > 255))	//检查输入
                return false;
            if (char_set[val])
                return false;
            char_set[val] = true;
        }
        return true;
    }
}
```
 
## 1.2 原串翻转
* 翻转一个给定的字符串(可以使用单个过程变量)。
    * 使用Array实现 
    
```java
import java.util.*;

public class Reverse {
    public String reverseString(String iniString) {
        // write code here
        char[] strArray = iniString.toCharArray();
        int low = 0, high = iniString.length()-1;
        while (low < high) {
            char tmp = strArray[low];
            strArray[low] = strArray[high];
            strArray[high] = tmp;
            low++;
            high--;
        }
        String tmpString = new String(strArray);
        return tmpString;
    }
}
```

* 使用StringBuilder
    
```java
import java.util.*;

public class Reverse {
    public String reverseString(String iniString) {
        // write code here
        StringBuilder sb = new StringBuilder(iniString);
        int low = 0, high = sb.length()-1;
        while (low < high) {
            char tmp = sb.charAt(low);
            sb.setCharAt(low, sb.charAt(high));
            sb.setCharAt(high, tmp);
            low++;
            high--;
        }  	
        return sb.toString();
    }
}
```

## 1.3
* 确定其中一个字符串的字符重新排列后，能否变成另一个字符串。这里规定大小写为不同字符，且考虑字符串重点空格。

```java
import java.util.*;

public class Same {
    public boolean checkSam(String stringA, String stringB) {
        // 优化 - 如果两个字符串长度不等，一定不可能
        if (stringA.length() != stringB.length())
            return false;
        return sortMy(stringA).equals(sortMy(stringB));
    }
    
    public String sortMy(String s) {
        char[] as = s.toCharArray();
        java.util.Arrays.sort(as);
        return new String(as);
    }
}
```

## 1.4 空格替换

* 空格替换

```java
import java.util.*;

public class Replacement {
    public String replaceSpace(String iniString, int length) {
        return iniString.replaceAll(" ", "%20");
    }
}
```


## 1.5 基本字符串压缩
* 基本字符串压缩

```java
import java.util.*;

public class Zipper {
    public String zipString(String iniString) {
        // write code here
        String mystr = "";
        char last = iniString.charAt(0);
        int count = 1;
        for (int i=1; i<iniString.length(); i++) {
            if (iniString.charAt(i)==last) {
                count++;
            } else {
                mystr += last + "" + count;
                last = iniString.charAt(i);
                count = 1;
            }
        }
        mystr += last + "" + count;
        if (mystr.length() > iniString.length())
            return iniString;
        else {
            return mystr;
        }
    }
}
```




