---
title: 剑指Offer——Python答案
tags: 
  - 编程语言
  - Python
  - 剑指Offer
categories:
  - 编程语言
  - Python
date: 2016-8-5 13:18:00
author: 张学志
---




# 说明
* 《剑指Offer》书中所有题目的答案是C++语言编写的。本人在[牛客网](http://www.nowcoder.com/activity/oj)上做题时，用Python编写了一套答案，整理如下。
* 《剑指Offer》在线刷题网址：[牛客网-剑指Offer](http://www.nowcoder.com/ta/coding-interviews?page=1)
* 牛客网上的剑指Offer题目有一点需要说明：题目不是完全一样，具体要求有点小的改动。不知道是故意为之，还没认真输入题目。

<!-- more -->

# 题目


## 二维数组中的查找
* 第一种方法：

```python
# 借助于in
# -*- coding:utf-8 -*-
class Solution:
    # array 二维列表
    def Find(self, array, target):
        # write code here
        flag = False
        for index in range(len(array)):
            if target in array[index]:
                flag = True
        return flag
```

* 第二种方法：

```python
# 线性复杂度
# -*- coding:utf-8 -*-
class Solution:
    # array 二维列表
    def Find(self, array, target):
        # write code here
        # 标识变量
        found = False
        # 检查输入 None，空数组
        if array == None:
            return found
        nRow = len(array)
        nCol = len(array[0])
        # 右上角位置
        row = 0
        col =  nCol-1
        # 从右上角遍历
        while (row<nRow) and (col>=0):
            if array[row][col] ==  target:
            	found = True
                break
            elif array[row][col] >  target:
                col = col-1
            else:
                row = row+1
        return found
```


## 替换空格

* 第一种方法：

```python
# -*- coding:utf-8 -*-
# 线性空间复杂度
class Solution:
    # s 源字符串
    def replaceSpace(self, s):
        # write code here
        if s == None:
            return None
        if len(s) == 0:
            return ''
        result = ''
        for item in s:
            if item.isspace():
            	result = result+'%20'
            else:
                result = result+item
        return result
```

* 第二种方法：

```python
# -*- coding:utf-8 -*-
class Solution:
    # s 源字符串
    def replaceSpace(self, s):
        # write code here
        return s.replace(' ', '%20')
```


## 从头到尾打印链表

* 第一种方法：使用insert()方法

```python
# -*- coding:utf-8 -*-
class Solution:
    # 返回从尾部到头部的列表值序列，例如[1,2,3]
    def printListFromTailToHead(self, listNode):
        # write code here
        L = []
        head = listNode
        while head:
            L.insert(0, head.val)
            head = head.next
        return L
```
* 第二种方法：使用append()和reverse()

```python
# -*- coding:utf-8 -*-
# 假定是个栈结构，append移动元素少
class Solution:
    # 返回从尾部到头部的列表值序列，例如[1,2,3]
    def printListFromTailToHead(self, listNode):
        # write code here
        L = []
        head = listNode
        while head:
            L.append(head.val)
            head = head.next
        L.reverse()
        return L
```


## 重建二叉树

```python
# -*- coding:utf-8 -*-
# class TreeNode:
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None

    
class Solution:
    # 返回构造的TreeNode根节点
    def reConstructBinaryTree(self, pre, tin):
        # write code here
        if (len(pre) == 0) or (len(tin) == 0):
            return None
            
        rootValue = pre[0]
        root = TreeNode(rootValue)
        if len(pre)==1:
            return root
        rootTinIndex = 0
        for i in range(len(tin)):
            if tin[i] == rootValue:
                rootTinIndex = i
        preStart = 1
        preEnd = rootTinIndex+1
        tinStart = 0
        tinEnd = rootTinIndex
        if rootTinIndex > 0:
            root.left = self.reConstructBinaryTree(pre[preStart:preEnd], tin[tinStart:tinEnd])
        if rootTinIndex < len(pre):
            root.right = self.reConstructBinaryTree(pre[preEnd:], tin[tinEnd+1:])
        return root
```


## 用两个栈实现队列

```python
# -*- coding:utf-8 -*-
class Solution:
    stack1 = []
    stack2 = []
    def push(self, node):
        # write code here
        self.stack1.append(node)
    def pop(self):
        # return xx
        if len(self.stack2) !=  0:
            return self.stack2.pop()
        elif len(self.stack1) != 0:
            while len(self.stack1):
            	self.stack2.append(self.stack1.pop())
            return self.stack2.pop()          
```




## 旋转数组的最小数字

* 第一种方法：

```python
# -*- coding:utf-8 -*-
class Solution:
    def minNumberInRotateArray(self, rotateArray):
        # write code here
        if len(rotateArray) == 0:
            return 0
        else:
            return min(rotateArray)
   
```

* 第二种方法：

```python
# -*- coding:utf-8 -*-
class Solution:
    def minNumberInRotateArray(self, rotateArray):
        # write code here
        if len(rotateArray) == 0:
            return 0
        '''
        if len(rotateArray) == 1:
            return rotateArray[0];
		'''
        index1 = 0
        index2 = len(rotateArray)-1
        indexMid = index1
        while rotateArray[index1] >= rotateArray[index2]:
            if index2-index1 == 1:
                indexMid = index2
                break
            indexMid = (index1+index2)//2
            if rotateArray[indexMid] >= rotateArray[index1]:
                index1 = indexMid
            elif rotateArray[indexMid] <= rotateArray[index2]:
                index2 = indexMid 
        return rotateArray[indexMid]
     
```

## 斐波那契数列

```python
# -*- coding:utf-8 -*-
class Solution:
    def Fibonacci(self, n):
        # write code here
        N2 = 0
        N1 = 1
        if n<=0:
            return 0
        if n==1:
            return 1
        while n>1:
            N1 = N1+N2
            N2 = N1-N2
            n = n-1
        return N1
```

## 跳台阶

```python
# -*- coding:utf-8 -*-
class Solution:
    def jumpFloor(self, number):
        # write code here
        N1 = 2
        N2 = 1
        if number==1:
            return 1
        if number==2:
            return 2
        while number>2:
            N1 = N1+N2
            N2 = N1-N2
            number = number-1
            
        return N1
```

## 变态跳台阶

```python
# -*- coding:utf-8 -*-
class Solution:
    def jumpFloorII(self, number):
        # write code here
        # 规律：f(n) = 2^(n-1)
        return 2**(number-1)
    
```

## 矩形覆盖

```python
# -*- coding:utf-8 -*-
class Solution:
    def rectCover(self, number):
        # write code here
        # 菲波那切数列
        N1 = 2
        N2 = 1
        if number <= 0:
            return 0
        if number == 1:
            return N2
        if number == 2:
            return N1
        while number > 2:
            N1 = N1+N2
            N2 = N1-N2
            number -=1
            
        return N1
```

## 二进制中1的个数

```python
# -*- coding:utf-8 -*-
class Solution:
    def NumberOf1(self, n):
        # write code here
        flag = 1
        print(type(flag))
        count = 0
        # int 4字节，4x8=32位
        # python能表示任意大的数字，所以手动限定
        maxBit = 32
        for i in range(maxBit):
            if n & flag:
                count += 1
            flag = flag << 1
        return count
```

## 数值的整数次方

* 第一种方法：

```python
# -*- coding:utf-8 -*-
class Solution:
    def Power(self, base, exponent):
        # write code here
        return base ** exponent
```

* 第二种方法：

```python
# -*- coding:utf-8 -*-
class Solution:
    def Power(self, base, exponent):
        # write code here
        result = 1.0
        if exponent >= 0:
            for i in range(exponent):
            	result *= base
        else:
            for i in range(abs(exponent)):
                result *= base
            result = 1.0/result
        return result
```
## 调整数组顺序使奇数位于偶数前面

* 第一种方法：

```python
# -*- coding:utf-8 -*-
class Solution:
    def reOrderArray(self, array):
        # write code here
        oddL = [item for item in array if item % 2]
        evenL = [item for item in array if not (item % 2)]
        result = oddL + evenL
        return result
```

* 第二种方法：

```
# -*- coding:utf-8 -*-
class Solution:
    def reOrderArray(self, array):
        # write code here
        oddL = filter(lambda x: x%2, array)
        evenL = filter(lambda x:not (x%2), array)
        result = oddL + evenL
        return result
```

## 链表中倒数第k个结点

* 第一种方法：

```python
# -*- coding:utf-8 -*-
# class ListNode:
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution:
    def FindKthToTail(self, head, k):
        # 检查输入：空表
        if  not head:
            return head
        # 检查输入：k<=0
        if k <= 0:
            return ListNode(0).next
        pNode = head
        p1 = head
        p2 = head
        for i in range(k-1):
            # 检查k大于链表长度的情况
            if p1.next:
            	p1 = p1.next
            else:
                return p1.next
        while p1.next :
            p1 = p1.next
            p2 = p2.next
        return p2
```

* 第二种方法：

```python
# -*- coding:utf-8 -*-
# class ListNode:
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution:
    def FindKthToTail(self, head, k):
        # 检查输入：空表
        if  not head:
            return head
        # 检查输入：k<=0
        if k <= 0:
            return ListNode(0).next
        # 栈
        stack1 = []
        pNode = head
        stack1.append(pNode)
        while pNode.next:
            pNode = pNode.next
            stack1.append(pNode)
        if k <= len(stack1):
            return stack1[-k]
        else:
            return ListNode(0).next
```


## 反转链表

```python
# -*- coding:utf-8 -*-
# class ListNode:
#     def __init__(self, x):
#         self.val = x
#         self.next = None
class Solution:
    # 返回ListNode
    def ReverseList(self, pHead):
        # write code here
        # 检查输入:空链表
        if not pHead:
            return pHead
        pNode = pHead
        while pNode:
            pAfter = pNode.next
            if not pAfter:
                pReversedHead = pNode
            if pNode == pHead:
                pNode.next = None
            else:
                pNode.next = pBefore
            pBefore = pNode
            pNode = pAfter
        return pReversedHead
```


## 合并两个排序的链表

```python
# -*- coding:utf-8 -*-
# class ListNode:
#     def __init__(self, x):
#         self.val = x
#         self.next = None
class Solution:
    # 返回合并后列表
    def Merge(self, pHead1, pHead2):
        # 检查输入：空链表
        if not pHead1:
            return pHead2
        if not pHead2:
            return pHead1
        # 确定pHead
        pNode1 = pHead1
        pNode2 = pHead2
        if pNode1.val <= pNode2.val:
            pNode = pNode1
            pNode1 = pNode1.next
        else:
            pNode = pNode2
            pNode2 = pNode2.next
        pHead = pNode
        while pNode1 or pNode2:
            if not pNode1:
                pNode.next = pNode2
                pNode2 = pNode2.next
            elif not pNode2:
                pNode.next = pNode1
                pNode1 = pNode1.next
            else:
                if pNode1.val <= pNode2.val:
                    pNode.next = pNode1
                    pNode1 = pNode1.next
                else:
                    pNode.next = pNode2
                    pNode2 = pNode2.next
            pNode = pNode.next
        return pHead
```


## 树的子结构

```python
# -*- coding:utf-8 -*-
# class TreeNode:
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None
class Solution:
    def DoesTree1HaveTree2(self, pRoot1, pRoot2):
        if not pRoot2:
            return True
        if not pRoot1:
            return False
        if pRoot1.val != pRoot2.val:
            return False
        
        return self.DoesTree1HaveTree2(pRoot1.left, pRoot2.left) and self.DoesTree1HaveTree2(pRoot1.right, pRoot2.right)
        
        
    def HasSubtree(self, pRoot1, pRoot2):
        # write code here
        result = False
        if pRoot1 and pRoot2:
            if pRoot1.val == pRoot2.val:
                result = self.DoesTree1HaveTree2(pRoot1, pRoot2)
            if not result:
                result = self.HasSubtree(pRoot1.left, pRoot2)
            if not result:
                result = self.HasSubtree(pRoot1.right, pRoot2)
        return result
```

## 包含min函数的栈

* 第一种方法：

```python
# -*- coding:utf-8 -*-
class Solution:
    def __init__(self):
        self.data = []
    def push(self, node):
        # write code here
        self.data.append(node)
    def pop(self):
        # write code here
        return self.data.pop()
    def top(self):
        # write code here
        return self.data[-1]
    def min(self):
        # write code here
        return min(self.data)
```

* 第二种方法：

```python
# -*- coding:utf-8 -*-
# 借助于辅助栈，操作的时间复杂度都为O(1)
class Solution:
    def __init__(self):
        self.stackData = []
        self.stackMin = []
    def push(self, node):
        # write code here
        self.stackData.append(node)
        if (len(self.stackMin)==0) or (node<self.stackMin[-1]):
            self.stackMin.append(node)
        else:
            self.stackMin.append(self.stackMin[-1])
    def pop(self):
        # write code here
        if len(self.stackData) <= 0:
            print "Stack is empty, can't pop."
            return
        self.stackMin.pop()
        return self.stackData.pop()
        
        
    def top(self):
        # write code here
        return self.stackData[-1]
        
    def min(self):
        # write code here
        if len(self.stackMin) <= 0:
            print "Stack is empty, can't pop."
            return
        return self.stackMin[-1]
```



## 栈的压入、弹出序列

```python
# -*- coding:utf-8 -*-
class Solution:
    def __init__(self):
        self.stackT =[]
    def IsPopOrder(self, pushV, popV):
        # write code here
        flag = False
        pushV.reverse()
        popV.reverse()
        while len(pushV)>0:
            self.stackT.append(pushV.pop())
            while (len(self.stackT)>0) and (len(popV)>0) and (self.stackT[-1] == popV[-1]):
                self.stackT.pop()
                popV.pop()
        if len(self.stackT) == 0:
            flag = True
        return flag             
```


## 从上往下打印二叉树
```python
# -*- coding:utf-8 -*-
# class TreeNode:
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None
class Solution:
    # 返回从上到下每个节点值列表，例：[1,2,3]
    def __init__(self):
        self.queue = []
    def PrintFromTopToBottom(self, root):
        # write code here
        result = []
        if not root:
            return []
        self.queue.append(root)
        while len(self.queue) > 0:
            #print self.queue[0]
            tmpNode = self.queue[0]
            result.append(tmpNode.val)
            if tmpNode.left:
                self.queue.append(tmpNode.left)
            if tmpNode.right:
                self.queue.append(tmpNode.right)
            self.queue.remove(self.queue[0])
        return result
```


## 二叉搜索树的后序遍历序列
```python
# -*- coding:utf-8 -*-
class Solution:
    def VerifySquenceOfBST(self, sequence):
        if not sequence:
            return False
        length = len(sequence)
        if length<=0:
            return False
        rootValue = sequence[length-1]
        i = 0
        for ii in range(length-1):
            if sequence[i] > rootValue:
                break
            i = i+1
        for j in range(i, length-1):
            if sequence[j] < rootValue:
                return False
        leftFlag = True
        if i > 0:
            leftFlag = self.VerifySquenceOfBST(sequence[:i])
        rightFlag = True
        if i < length-1:
            rightFlag = self.VerifySquenceOfBST(sequence[i:length-1])
        return leftFlag and rightFlag
```



**(持续更新中......)**