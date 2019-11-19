---
title: 剑指Offer——Java答案
tags: 
  - 编程语言
  - Java
  - 剑指Offer
categories:
  - 编程语言
  - Java
date: 2016-9-4 12:43:00
author: 张学志
---




## 第二章 面试需要的基础知识


### 数组 - 二维数组中查找
* 题目：在一个二维数组中，每一行都按照从左到右递增的顺序排序，每一列都按照从上到下递增的顺序排序。请完成一个函数，输入这样的一个二维数组和一个整数，判断数组中是否含有该整数。

#### 方法一

```
public class Solution {
    public boolean Find(int [][] array, int target) {
        for (int i=0; i<array.length; i++) {
    		for (int j=0; j<array[i].length; j++) {
    			if (array[i][j] == target)
    				return true;
    		}
    	}
    	return false;
        
    }
}
```

<!-- more -->

#### 方法二
* 时间复杂度 O(n)

```
public class Solution {
    public boolean Find(int [][] array, int target) {
    	int row =0;
    	int col = array[0].length-1;
    	int numRow = array.length;
    	while (row < numRow && col>=0) {
			if (array[row][col] > target)
				col--;
			else if (array[row][col] < target)
				row++;
			else {
				return true; // 相等，返回true
			}
    	}
    	return false;  //遍历完，没有找到相等值，返回false
    }
}
```



### 替换空格

#### 方法一
* 借用String.replace()

```
public class Solution {
    public String replaceSpace(StringBuffer str) {
    	String str1 = new String(str);
    	return str1.replace(" ", "%20");
    }
}
```

#### 方法二
* 使用字符数组实现

```
public class Solution {
    public String replaceSpace(StringBuffer str) {
    	String str1 = new String(str);
    	char[] charArr = str1.toCharArray();
    	// 计算源字符串的长度和空格的数量
    	int originalLength = charArr.length;
    	int numberOfBlank = 0;
    	for (char item : charArr)
    		if (item == ' ')
    			numberOfBlank++;
    	// 计算新的字符串长度
    	int newLength = originalLength + numberOfBlank*2;
    	char[] newcharArr = new char[newLength];
    	//
    	int indexOfOriginal = originalLength-1;
    	int indexOfNew = newLength-1;
    	while(indexOfOriginal>=0) {
    		if (charArr[indexOfOriginal] == ' ') {
    			newcharArr[indexOfNew--] = '0';
    			newcharArr[indexOfNew--] = '2';
    			newcharArr[indexOfNew--] = '%';
    			indexOfOriginal--;
    		} else {
    			newcharArr[indexOfNew--] = charArr[indexOfOriginal--];
    		}
    	}
    	return String.valueOf(newcharArr);
    }
}
```


### 从头到尾打印链表

```
import java.util.ArrayList;

class ListNode {
     int val;
     ListNode next = null;
     
     ListNode(int val) {
    	 this.val = val;
     }
}

public class Solution {
    public ArrayList<Integer> printListFromTailToHead(ListNode listNode) {
    	ArrayList<Integer> al = new ArrayList<Integer>();
    	if (listNode == null) {
    		return al;
    	}
    	
    	ListNode p = listNode;
    	while (p != null) {
    		al.add(p.val);
    		p = p.next;
    	}
    	
    	int lower = 0;
    	int higher =al.size()-1;
    	while (lower < higher) {
    		int temp = al.get(lower);
    		al.set(lower, al.get(higher));
    		al.set(higher, temp);
    		lower++;
    		higher--;
    	}
    	return al;
    }
    
}
```


### 重建二叉树
```
import java.util.Arrays;

class TreeNode {
	int val;
	TreeNode left;
	TreeNode right;
	TreeNode(int x) { val = x; }
}

public class Solution {
    public TreeNode reConstructBinaryTree(int [] pre,int [] in) {
        if (pre==null || in==null) // 判空
        	return null;
        //生成根节点
        int rootValue = pre[0];
        TreeNode root = new TreeNode(rootValue);
        root.left = root.right = null;
        // 一个节点的情况
        if (pre.length==1) {
        	if (in.length==1 && pre[0]==in[0]) 
        		return root;
        	else
        		System.out.println("Invalid  input.");
        }
        // 在中序遍历中查找根节点的值
        int rootInorder =0;
        while (rootInorder<in.length && in[rootInorder]!=rootValue)
        	rootInorder++;
        // 构建左子树
        int[] leftPre = Arrays.copyOfRange(pre, 1, rootInorder+1);
        int[] leftIn = Arrays.copyOfRange(in, 0, rootInorder);
        if (leftPre.length>0) {
        	root.left = reConstructBinaryTree(leftPre, leftIn);
        }
        // 构建右子树
        int[] rightPre = Arrays.copyOfRange(pre, rootInorder+1, pre.length);
        int[] rightIn = Arrays.copyOfRange(in, rootInorder+1, in.length);
        if (rightPre.length>0) {
        	root.right = reConstructBinaryTree(rightPre, rightIn);
        }
        return root;
    }
    
}
```


### 用两个栈实现队列

```
import java.util.Stack;

public class Solution {
    Stack<Integer> stack1 = new Stack<Integer>();
    Stack<Integer> stack2 = new Stack<Integer>();
    
    public void push(int node) {
        stack1.push(node);
    }
    
    public int pop() {
    	if (stack2.isEmpty()) {
    		while (!stack1.isEmpty()) {
    			stack2.push(stack1.pop());
    		}
    	}
    	if (stack2.isEmpty()) {
    		Exception e = new Exception("123");
    		try {
				throw e;
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
    	}
    		
    	return stack2.pop();
    }
}
```

### 旋转数组的最小值

```
import java.util.ArrayList;

public class Solution {
    public int minNumberInRotateArray(int [] array) {
    	if (array.length == 0)
    		return 0;
    	int index1 = 0;
    	int index2 = array.length-1;
    	int indexMid = index1;
    	while (array[index1] >= array[index2]) {
    		if (index2-index1==1) {
    			indexMid = index2;
    			break;
    		}
    		indexMid = (index1+index2)/2;
    		if(array[indexMid] >= array[index1])
    			index1 = indexMid;
    		else if (array[indexMid] <= array[index2])
    			index2 = indexMid;
    	}
    	return array[indexMid];
        
    }
}
```


### 斐波那契数列

```
public class Solution {
    public int Fibonacci(int n) {
    	if (n<=0)
    		return 0;
    	if (n==1)
    		return 1;
    	
    	int fibOne=1;
    	int fibTwo=0;
    	while (n > 1) {
    		fibOne = fibOne + fibTwo;
    		fibTwo = fibOne - fibTwo;
    		n--;
    	}
    	return fibOne;
    }
}
```

### 跳台阶
* 类似斐波那契数列

```
public class Solution {
    public int JumpFloor(int target) {
    	if (target <= 2) 
    		return target;
    	int resOne = 2;
    	int resTwo = 1;
    	while (target>2) {
    		resOne = resOne + resTwo;
    		resTwo = resOne - resTwo;
    		target--;
    	}
    	return resOne;
    }
}
```


### 变态跳台阶
* 等比数列 
f(n) = 2^(n-1)

```
public class Solution {
    public int JumpFloorII(int target) {
        if (target < 1)
            return 0;
        if (target == 1)
            return 1;
        int result=1;
        while (target > 1) {
            result *= 2;
            target--;
        }
        return result;
    }
}
```


### 矩形覆盖
* 斐波那契数列

```
public class Solution {
    public int RectCover(int target) {
        if (target<=0)
            return 0;
        if (target<=2)
            return target;
        
        int resOne = 2;
        int resTwo = 1;
        while (target > 2) {
            resOne = resOne + resTwo;
            resTwo = resOne - resTwo;
            target--;
        }
        return resOne;
    }
}
```


### 二进制中1的个数
* 因为Java中没有无符号整数，因此限定循环的次数。

```
public class Solution {
    public int NumberOf1(int n) {
    	int flag = 1;
    	int num = 0;
    	for (int i=0; i<32; i++) {
    		if ((flag & n) != 0) {
    			num++;
    		}
    		flag <<= 1;
    	}
    	return num;
    }
}
```

## 第三章 高质量的代码

### 数值的整数次方

```
public class Solution {
    public double Power(double base, int exponent) {
        if (exponent == 0)
            return 1;
        int exp=0;
        double result=1;
        if (exponent > 0)
            exp = exponent;
        else
            exp = -exponent;
        while (exp > 0) {
            result *= base;
            exp--;
        }
        if (exponent < 0)
            result = 1/result;
		return result;
  }
}
```

### 调整数组顺序使奇数位于偶数前面

```
import java.util.ArrayList;

public class Solution {
    public void reOrderArray(int [] array) {
    	if (array!=null && array.length>1) {
    		ArrayList<Integer> alOdd = new ArrayList<>();
    		ArrayList<Integer> alEven = new ArrayList<>();
    		for (int elem : array) {
    			if (elem % 2 == 1)
    				alOdd.add(elem);
    			else
    				alEven.add(elem);
    		}
    		int ind = 0;
    		for (int i=0; i<alOdd.size(); i++) {
    			array[ind] = alOdd.get(i);
    			ind++;
    		}
    		for (int i=0; i<alEven.size(); i++) {
    			array[ind] = alEven.get(i);
    			ind++;
    		}
    	}
    }
}
```

### 链表中倒数第k个结点

```
public class ListNode {
    int val;
    ListNode next = null;

    ListNode(int val) {
        this.val = val;
    }
}

public class Solution {
    public ListNode FindKthToTail(ListNode head,int k) {
    	if (head == null) {
    		return head;
    	}
    	if (k==0) {
    		return new ListNode(0).next;
    	}
    	ListNode pAhead = head;
    	ListNode pBehind = null;
    	
    	for (int i=0; i<k-1; i++) {
    		if (pAhead.next != null)
    			pAhead = pAhead.next;
    		else
    			return pAhead.next;	//k大于列表长度
    	}
    	pBehind = head;
    	while (pAhead.next != null) {
    		pAhead = pAhead.next;
    		pBehind = pBehind.next;
    	}
    	return pBehind;
    }
}
```

### 翻转链表

```
public class ListNode {
    int val;
    ListNode next = null;

    ListNode(int val) {
        this.val = val;
    }
}

public class Solution {
    public ListNode ReverseList(ListNode head) {
       ListNode pReversedHead = null;
       ListNode pNode = head;
       ListNode pPrev = null;
       while (pNode != null) {
    	   ListNode pNext = pNode.next;
    	   if (pNext == null)
    		   pReversedHead = pNode;
    	   pNode.next = pPrev;
    	   pPrev = pNode;
    	   pNode = pNext;
       }
       return pReversedHead;
    }
}
```


### 合并两个排序的链表
```
public class ListNode {
    int val;
    ListNode next = null;

    ListNode(int val) {
        this.val = val;
    }
}

public class Solution {
    public ListNode Merge(ListNode list1,ListNode list2) {
        if (list1 == null) {
        	return list2;
        } else if (list2 == null) {
        	return list1;
        }
        ListNode listMergeHead = null;
        if (list1.val < list2.val) {
        	listMergeHead = list1;
        	listMergeHead.next = Merge(list1.next, list2);
        } else {
        	listMergeHead = list2;
        	listMergeHead.next = Merge(list1, list2.next);
        }
        
        return listMergeHead;       
    }
}
```

### 树的子结构
```
class TreeNode {
    int val = 0;
    TreeNode left = null;
    TreeNode right = null;

    public TreeNode(int val) {
        this.val = val;

    }

}

public class Solution {
    public boolean HasSubtree(TreeNode root1,TreeNode root2) {
        boolean result = false;
        
        if (root1!=null && root2!=null) {
        	if (root1.val == root2.val)
        		result = DoesTree1HaveTree2(root1, root2);
        	if (!result)
        		result = HasSubtree(root1.left, root2);
        	if(!result) 
        		result = HasSubtree(root1.right, root2);
        }
        return result;
    }
    public boolean DoesTree1HaveTree2(TreeNode pRoot1, TreeNode pRoot2) {
    	if (pRoot2 == null)	// Tree2 为空
    		return true;
    	if (pRoot1 == null)	// Tree2非空，Tree1为空
    		return false;
    	if (pRoot1.val != pRoot2.val) // Tree1 & Tree2非空
    		return false;
    	return DoesTree1HaveTree2(pRoot1.left, pRoot2.left) && DoesTree1HaveTree2(pRoot1.right, pRoot2.right);
    	
    }
}
```

## 第四章 解决面试的思路


### 二叉树的镜像
```
class TreeNode {
    int val = 0;
    TreeNode left = null;
    TreeNode right = null;

    public TreeNode(int val) {
        this.val = val;

    }

}

// 先序遍历，交换每个节点的左右节点
public class Solution {
    public void Mirror(TreeNode root) {
        if (root == null)
        	return;
        if (root.left==null && root.right==null)
        	return;
        // 交换当前节点的左右子节点
        TreeNode temp = root.left;
        root.left = root.right;
        root.right = temp;
        // 遍历左子节点
        if (root.left != null)
        	Mirror(root.left);
        // 遍历右子节点
        if (root.right != null) 
        	Mirror(root.right);
        
    }
}
```


### 顺时针打印矩阵

```
import java.util.ArrayList;

public class Solution {
    public ArrayList<Integer> printMatrix(int [][] matrix) {
       if (matrix == null || matrix.length<=0 || matrix[0].length<=0)
    	   return new ArrayList<Integer>();
       
       ArrayList<Integer> result = new ArrayList<Integer>();
       int start = 0;
       int numRow = matrix.length;
       int numCol = matrix[0].length;
       while (numRow>2*start && numCol>2*start) {
    	   PrintMatrixInCircle(matrix, numRow, numCol, start, result);
    	   start++;
       }
       return result;
    }
    
    public void PrintMatrixInCircle(int[][] matrix, int numRow, int numCol, int start, ArrayList<Integer> result) {
 	   int endX = numCol-1-start;
 	   int endY = numRow-1-start;
 	   // 从左到右打印一行
 	   for (int i=start; i<=endX; ++i) {
 		   result.add(matrix[start][i]);
 	   }
 	   // 从上到下打印一行
 	   if (start < endY) {
 		   for (int i=start+1; i<=endY; i++) {
 			   result.add(matrix[i][endX]);
 		   }
 	   }
 	   // 从右到左打印一行
 	   if (start<endX && start<endY) {
 		   for (int i=endX-1; i>=start; i--) {
 			   result.add(matrix[endY][i]);
 		   }
 	   }
 	   // 从下到上打印一行
 	   if (start<endX && start<endY-1) {
 		   for(int i=endY-1; i>=start+1; i--) {
 			   result.add(matrix[i][start]);
 		   }
 	   }
    }
}
```


### 包含min函数的栈

```
import java.util.Stack;

public class Solution {
	Stack<Integer> dataStack = new Stack<Integer>();
	Stack<Integer> minStack = new Stack<Integer>();
	
    public void push(int node) {
        dataStack.push(node);
        if (minStack.isEmpty() || node < minStack.peek()) 
        	minStack.push(node);
        else
        	minStack.push(minStack.peek());
    }
    
    public void pop() {
        assert(!dataStack.isEmpty() && !minStack.isEmpty());
        dataStack.pop();
        minStack.pop();
    }
    
    public int top() {
        assert(!dataStack.isEmpty() && !minStack.isEmpty());
        return dataStack.peek();
    }
    
    public int min() {
        assert(!dataStack.isEmpty() && !minStack.isEmpty());
        return minStack.peek();
    }
}
```

### 栈的压入、弹出序列

```
import java.util.Stack;

public class Solution {
    public boolean IsPopOrder(int [] pushA,int [] popA) {
    	boolean bPossible = false;
    	// 判空
    	if (pushA==null || popA==null) 
    		return bPossible;
    	if (pushA.length != popA.length)
    		return bPossible;
    	int nLength = pushA.length;
      
    	int nextPushInd = 0;
    	int nextPopInd = 0;
    	Stack<Integer> stack = new Stack<Integer>();
    	while (nextPopInd < nLength) {
    		while (stack.empty() || stack.peek() != popA[nextPopInd]) {
    			if (nextPushInd == nLength)
    				break;
    			stack.push(pushA[nextPushInd]);
    			nextPushInd++;
    		}
    		if (stack.peek() != popA[nextPopInd])
    			break;
    		stack.pop();
    		nextPopInd++;
    	}
    	
    	if (stack.empty() && nextPopInd== nLength)
    		bPossible=true;
    	System.out.println(nextPushInd);
    	System.out.println(nextPopInd);
    	return bPossible;
	}
    
    public static void main(String[] args) {
    	int[] pushA = {1,2,3,4,5};
    	int[] popA = {4,5,3,2,1};
    	Solution solution = new Solution();
    	boolean result = solution.IsPopOrder(pushA, popA);
    	System.out.println(result);
    }
}
```


### 从上往下打印二叉树
* 使用队列实现

```
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.Queue;

class TreeNode {
    int val = 0;
    TreeNode left = null;
    TreeNode right = null;

    public TreeNode(int val) {
        this.val = val;

    }
}

public class Solution {
    public ArrayList<Integer> PrintFromTopToBottom(TreeNode root) {
        if (root==null)
        	return new ArrayList<Integer>();
        ArrayList<Integer> result = new ArrayList<Integer>();
        Queue<TreeNode> queue = new LinkedList<TreeNode>();	//创建队列
        queue.add(root);
        while (queue.size() > 0) {
        	TreeNode temp = queue.peek();
        	queue.remove();
        	
        	result.add(temp.val);
        	
        	if (temp.left != null)
        		queue.add(temp.left);
        	if (temp.right != null) 
        		queue.add(temp.right);
        }
        return result;
    }
}
```


### 二叉搜索树的后序遍历序列
* 二叉搜索树的左子树结点小于根节点，右子树结点大于根结点；
* 根结点位于后续遍历序列的最后位置

```
import java.util.Arrays;

public class Solution {
    public boolean VerifySquenceOfBST(int [] sequence) {
        if (sequence == null || sequence.length==0) 
        	return false;
        int root = sequence[sequence.length-1]; //根存储在数组的最后位置
        // 二叉搜索树中左子树的结点小于根节点
        int i=0;
        for (; i<sequence.length-1; i++) {
        	if (sequence[i] > root)
        		break;
        }
        // 二叉搜索树中右子树的结点大于根节点
        int j = i;
        for (; j<sequence.length-1; j++) {
        	if (sequence[j] < root) {
        		return false;
        	}
        }
        // 判断左子树是不是二叉搜索树
        boolean left = true;
        if (i > 0) {
        	left = VerifySquenceOfBST(Arrays.copyOfRange(sequence, 0, i));
        }
        // 判断右子树是不是二叉搜索树
        boolean right = true;
        if (i < sequence.length-1)
        	right = VerifySquenceOfBST(Arrays.copyOfRange(sequence, i, sequence.length-1));
        
        return (left && right);
    }
}
```


### 二叉树中和为某一值的路径

```
import java.util.ArrayList;
import java.util.Iterator;

class TreeNode {
    int val = 0;
    TreeNode left = null;
    TreeNode right = null;

    public TreeNode(int val) {
        this.val = val;

    }

}

public class Solution {
    public ArrayList<ArrayList<Integer>> FindPath(TreeNode root,int target) {
        if (root == null)
        	return new ArrayList<ArrayList<Integer>>();
        ArrayList<ArrayList<Integer>> arrayList = new ArrayList<ArrayList<Integer>>();
        ArrayList<Integer> path = new ArrayList<Integer>(); // 栈，用做存储路径
        int currentSum = 0;
        FindPath(root, target, arrayList, path, currentSum);
        
        return arrayList;
    }
    public void FindPath(TreeNode root,int target, ArrayList<ArrayList<Integer>> arrayList, ArrayList<Integer> path, int currentSum) {
    	currentSum += root.val;
    	path.add(root.val);
    	// 如果是叶结点，并且路径和符合条件
    	boolean isLeaf = ((root.left==null) && (root.right==null));
    	if (currentSum==target && isLeaf) {
    		Iterator<Integer> iterator = path.iterator();
    		ArrayList<Integer> pathTemp = new ArrayList<>();
    		while (iterator.hasNext()) {
    			pathTemp.add(iterator.next());
    		}
    		
    		arrayList.add(pathTemp);
    	}
    	//如果不是叶结点，遍历它的子节点
    	if (root.left != null) 
    		FindPath(root.left, target, arrayList, path, currentSum);
    	if (root.right != null) 
    		FindPath(root.right, target, arrayList, path, currentSum);
    	// 返回父节点前，在路径上删除当前节点
    	path.remove(path.size()-1);
    }

}
```


### 复杂链表的复制
* 分成3步实现

```

class RandomListNode {
    int label;
    RandomListNode next = null;
    RandomListNode random = null;

    RandomListNode(int label) {
        this.label = label;
    }
}

public class Solution {
    public RandomListNode Clone(RandomListNode pHead)
    {
    	CloneNode(pHead);
    	ConnectRandomNodes(pHead);
    	return ReconnectNodes(pHead);
    }
    // 第一步：创建N的结点，并链接到原结点的后面
    public void CloneNode(RandomListNode pHead) {
    	RandomListNode pNode = pHead;
    	while (pNode != null) {
    		RandomListNode pCloned = new RandomListNode(pNode.label);
    		pCloned.next = pNode.next;
    		pCloned.random = null; // 冗余
    		pNode.next = pCloned;
    		pNode = pCloned.next;
    	}
    }
    // 第二部：设置复制出来的节点的random
    public void ConnectRandomNodes (RandomListNode pHead) {
    	RandomListNode pNode = pHead;
    	while (pNode != null) {
    		RandomListNode pCloned = pNode.next;
    		if (pNode.random != null) { // 存在随机链接
    			pCloned.random = pNode.random.next;
    		}
    		pNode = pCloned.next;
    	}
    }
    // 第三步：将链表分解成两部分：原链表和复制的链表
    public RandomListNode ReconnectNodes (RandomListNode pHead) {
    	RandomListNode pNode = pHead;
    	RandomListNode pClonedHead = null;
    	RandomListNode pClonedNode = null;
    	//处理头结点
    	if (pNode != null) {
    		pClonedHead = pClonedNode = pNode.next;
    		pNode.next = pClonedNode.next;
    		pNode = pNode.next;
    	}
    	//处理后面的结点
    	while (pNode != null) {
    		pClonedNode.next = pNode.next;
    		pClonedNode = pClonedNode.next;
    		pNode.next = pClonedNode.next;
    		pNode = pNode.next;
    	}
    	
    	return pClonedHead;
    }
        
}
```


### 二叉搜索树与双向链表
* 这道题有点难

```
class TreeNode {
    int val = 0;
    TreeNode left = null;
    TreeNode right = null;

    public TreeNode(int val) {
        this.val = val;

    }

}

public class Solution {
    public TreeNode Convert(TreeNode pRootOfTree) {
    	if (pRootOfTree == null)
    		return pRootOfTree;
        //TreeNode pLastOfList = null;
    	TreeNode pLastOfList = new TreeNode(0);
    	pLastOfList = ConvertNode(pRootOfTree, pLastOfList);
        TreeNode pHeadOfList = pLastOfList;
        while (pLastOfList!=null  && pHeadOfList.left!=null) {
        	pHeadOfList = pHeadOfList.left;
        }
        pHeadOfList = pHeadOfList.right;
        pHeadOfList.left = null;
        return pHeadOfList;
    }
    
    public TreeNode ConvertNode (TreeNode pNode, TreeNode pLastOfList) {
    	if (pNode == null) 
    		return pNode;
    	TreeNode pCurrent = pNode;
    	if (pCurrent.left != null) 
    		pLastOfList = ConvertNode(pCurrent.left, pLastOfList);
    	pCurrent.left = pLastOfList;
    	if (pLastOfList != null)
    		pLastOfList.right = pCurrent;
    	pLastOfList = pCurrent;
    	if (pCurrent.right != null) {
    		pLastOfList = ConvertNode(pCurrent.right, pLastOfList);
    	}
    	return pLastOfList;
    }
    
    public static void main(String[] args) {
    	TreeNode a = new TreeNode(10);
    	TreeNode b = new TreeNode(6);
    	TreeNode c = new TreeNode(14);
    	TreeNode d = new TreeNode(4);
    	TreeNode e = new TreeNode(8);
    	TreeNode f = new TreeNode(12);
    	TreeNode g = new TreeNode(16);
    	a.left = b;
    	a.right = c;
    	b.left = d;
    	b.right = e;
    	c.left = f;
    	c.right = g;
    	Solution solution = new Solution();
    	TreeNode pHead = solution.Convert(a);
    	
    	while (pHead != null) {
    		System.out.print(pHead.val + "→");
    		pHead = pHead.right;
    	}
    	System.out.println();
    	while (pHead != null) {
    		System.out.print(pHead.val + "→");
    		pHead = pHead.left;
    	}
    	
    }
}
```


### 字符串的排列

```
import java.util.ArrayList;
import java.util.Arrays;

public class Solution {
    public ArrayList<String> Permutation(String str) {
       if (str == null)
    	   return null;
    	   //return new ArrayList<String>();
       ArrayList<String> arrayList = new ArrayList<String>();
       StringBuffer stringBuffer = new StringBuffer(str);
       Permutation(arrayList, stringBuffer, 0);
       String[] strArray = new String[arrayList.size()];
       arrayList.toArray(strArray);
       Arrays.sort(strArray);
       for (int i=0; i<arrayList.size(); i++) {
    	   arrayList.set(i, strArray[i]);
       }
       return arrayList;
    }
    
    public void Permutation(ArrayList<String> arrayList, StringBuffer stringBuffer, int ind) {
    	if (ind == stringBuffer.length()-1) {
    		if (!arrayList.contains(stringBuffer.toString())) {
    			arrayList.add(stringBuffer.toString());
    		}
    	} else {
    		for (int i=ind; i<stringBuffer.length(); i++) {
    			char temp = stringBuffer.charAt(i);
    			stringBuffer.setCharAt(i, stringBuffer.charAt(ind));
    			stringBuffer.setCharAt(ind, temp);
    			
    			Permutation(arrayList, stringBuffer, ind+1);
    			
    			temp = stringBuffer.charAt(i);
    			stringBuffer.setCharAt(i, stringBuffer.charAt(ind));
    			stringBuffer.setCharAt(ind, temp);
    		}
    	}
    }
    
    public static void main (String[] args) {
    	Solution solution = new Solution();
        ArrayList<String> arrayList = new ArrayList<String>();
        arrayList = solution.Permutation("abc");

    	System.out.println(arrayList.size());
    	for (String item : arrayList) {
    		System.out.println(item);
    	}
    }
}
```


## 第五章 优化时间和空间效率


### 数组中出现次数超过一半的数字

```
// 中位数，快速排序，partition
public class Solution {
    public int MoreThanHalfNum_Solution(int [] array) {
        if (CheckInvalidArray(array)) // 检查输入是否有效
        	return 0;
        int result = array[0];
        int times = 1;
        for (int i=1; i<array.length; i++) {
        	if (times==0) {
        		result = array[i];
        		times = 1;
        	} else if (array[i] == result)
        		times++;
        	else 
        		times--;
        }
        
        if (!CheckMoreThanHalf(array, result))
        	return 0;
        
        return result;
    }
    
    public boolean CheckInvalidArray (int[] array) {
    	boolean g_bInputInvalid = false;
    	if (array==null || array.length<=0) {
    		g_bInputInvalid = true;
    	}
    	return g_bInputInvalid;
    }
    
    boolean CheckMoreThanHalf (int[] array, int number) {
    	int times = 0;
    	for (int i=0; i<array.length; i++) {
    		if (array[i] == number)
    			times++;
    	}
    	boolean isMoreThanHalf = true;
    	if (times * 2 <= array.length) {
    		isMoreThanHalf = false;
    	}
    	return isMoreThanHalf;
    }
}
```


### 最小的K个数

```
import java.util.ArrayList;

public class Solution {
    public ArrayList<Integer> GetLeastNumbers_Solution(int [] input, int k) {
    	int n = input.length;
    	if (input==null || n<=0 || k<=0 || k>n)
    		return new ArrayList<Integer>();
    	
    	int start = 0;
    	int end = n-1;
    	int index = Partition(input, start, end);
    	while (index != k-1) {
    		if (index>k-1) {
    			end = index-1;
    			index = Partition(input, start, end);
    		} else {
    			start = index+1;
    			index = Partition(input, start, end);
    		}
    	}
    	
    	ArrayList<Integer> result = new ArrayList<Integer>();
    	for (int i=0; i<k; i++) {
    		result.add(input[i]);
    	}
    	
    	return result;
    }
    
    public int Partition(int[] data, int start, int end) {
    	int length = data.length;
    	if (data==null || length<=0 || start<0 || end>=length)
			try {
				throw new Exception("Invalid Parameters");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	int index = (int)(Math.random()*(end-start) + start);
    	Swap(data, index, end);
    	
    	int small = start-1;
    	for (index=start; index<end; index++) {
    		if (data[index] < data[end]) {
    			small++;
    			if (small != index)
    				Swap(data, index, small);
    		}
    	}
    	small++;
    	Swap(data, small, end);
    	
    	return small;
    }
    
    public void Swap (int[] data, int index, int end) {
    	int temp = data[index];
    	data[index] = data[end];
    	data[end] = temp;
    }
}
```


### 连续子数组的最大和

```
public class Solution {
    public int FindGreatestSumOfSubArray(int[] array) {
        if (array==null || array.length<=0)
        	return 0;
        
        int nCurSum = 0;
        int nGreatestSum = Integer.MIN_VALUE;
        for (int i=0; i<array.length; i++) {
        	if (nCurSum<0)
        		nCurSum = array[i];
        	else
        		nCurSum += array[i];
        	
        	if (nCurSum>nGreatestSum)
        		nGreatestSum = nCurSum;
        }
        
        return nGreatestSum;
    }
}
```


### 整数中1出现的次数（从1到n整数中1出现的次数）

```
public class Solution {
    public int NumberOf1Between1AndN_Solution(int n) {
    	int number = 0;
    	for (int i=1; i<=n; i++) 
    		number += NumberOf1(i);
    	return number;
    }
    
    public int NumberOf1(int n) {
    	int number = 0;
    	while (n > 0) {
    		if (n%10 == 1) 
    			number++;
    		n /= 10;
    	}
    	
    	return number;
    }
    
    public static void main (String[] args) {
    	Solution solution = new Solution();
    	
    	System.out.println(solution.NumberOf1Between1AndN_Solution(11));
    }
}
```


### 把数组排成最小的数
* 确定一种排序规则
* 隐性的大数问题

```
import java.util.Arrays;
import java.util.Comparator;

public class Solution {
    public String PrintMinNumber(int [] numbers) {
    	if (numbers==null || numbers.length<=0)
    		return new String();
    	// 数组转化成字符串数组
    	String[] strArray = new String[numbers.length];
    	for (int i=0; i<numbers.length; i++) 
    		strArray[i] = String.valueOf(numbers[i]);
    	//排序
    	Arrays.sort(strArray, new ComparatorTest());
    	// 连接
    	StringBuilder sBuilder = new StringBuilder();
    	for (int i=0; i<numbers.length; i++) {
    		sBuilder.append(strArray[i]);
    	}
    	
    	return sBuilder.toString();
    }
    
    public static void main(String[] args) {
    	Solution solu = new Solution();
    	int[] a = {3, 5, 1, 4,2};
    	String str = new String();
    	str = solu.PrintMinNumber(a);
    	System.out.println(str);
    	
    }
}


class ComparatorTest implements Comparator<String> {
	@Override
    public int compare(String str1, String str2) {
    	String strCombine1 = str1 + str2;
    	String strCombine2 = str2 + str1;
    	return strCombine1.compareTo(strCombine2);
    }
}
```


### 丑数
* 第一种方法，复杂度过高

```
public class Solution {
    public int GetUglyNumber_Solution(int index) {
    	if (index <= 0)
    		return 0;
    	
    	int number = 0;
    	int uglyFound = 0;
    	while (uglyFound < index) {
    		number++;
    		if (IsUgly(number))
    			uglyFound++;
    	}
    	
        return number;
    }
    
    public boolean IsUgly (int number) {
    	while (number%2 == 0)
    		number /=2;
    	while (number%3 == 0)
    		number /=3;
    	while (number%5 == 0)
    		number /=5;
    	
    	return (number==1) ? true : false;
    }
    
    public static void main(String[] args) {
    	Solution solu = new Solution();
    	System.out.println(solu.GetUglyNumber_Solution(1000));
    }
}
```

* 第二种方法：优化时间复杂度

```
public class Solution {
    public int GetUglyNumber_Solution(int index) {
    	if (index <= 0)
    		return 0;
    	
    	int[] uglyNumbers = new int[index];
    	uglyNumbers[0] = 1;
    	int nextUglyIndex = 1;
    	
    	int ind2 = 0;
    	int ind3 = 0;
    	int ind5 = 0;
    	
    	while (nextUglyIndex < index) {
    		int min = Min(uglyNumbers[ind2]*2, uglyNumbers[ind3]*3, uglyNumbers[ind5]*5);
    		uglyNumbers[nextUglyIndex] = min;
    		while(uglyNumbers[ind2]*2 <= uglyNumbers[nextUglyIndex])
    			ind2++;
    		while(uglyNumbers[ind3]*3 <= uglyNumbers[nextUglyIndex])
    			ind3++;
    		while(uglyNumbers[ind5]*5 <= uglyNumbers[nextUglyIndex])
    			ind5++;
    		++nextUglyIndex;
    	}
    	
    	int ugly = uglyNumbers[nextUglyIndex-1];
    	
    	return ugly;
    }
    
    int Min(int number1, int number2, int number3) {
    	int min = (number1<number2) ? number1 : number2;
    	min = (min<number3) ? min : number3;
    	return min;
    }
    
    public static void main(String[] args) {
    	Solution solu = new Solution();
    	System.out.println(solu.GetUglyNumber_Solution(5));
    }
}
```


### 第一个只出现一次的字符位置

```
public class Solution {
    public int FirstNotRepeatingChar(String str) {
    	if (str==null || str.length()<=0) {
    		return -1;
    	}
    	int tableSize = 256;
    	int[] hashTable = new int[tableSize]; //自动初始化为0
    	
    	for (int i=0; i<str.length(); i++)
    		hashTable[str.charAt(i)]++;
    	
    	for (int i=0; i<str.length(); i++) {
    		if (hashTable[str.charAt(i)]==1) {
    			return i;
    		}
    	}
        return -1;
    }
    
    public static void main(String[] args) {
    	Solution solu = new Solution();
    	String str = "google";
    	System.out.println(solu.FirstNotRepeatingChar(str));
    }
}
```


### ---数组中的逆序对---
* 错误

```
public class Solution {
    public int InversePairs(int [] array) {
        if (array==null || array.length<=0)
        	return 0;
        int[] copy = new int[array.length];
        for (int i=0; i<array.length; ++i)
        	copy[i] = array[i];
        
        long count=InversePairsCore(array, copy, 0, array.length-1);
        return (int)count;
    }
    
    public long InversePairsCore(int[] array, int[] copy, int start, int end) {
    	if (start == end) {
    		copy[start] = array[start];
    		return 0;
    	}
    	int length = (end-start)/2;
    	long left = InversePairsCore(copy, array, start, start+length);
    	long right = InversePairsCore(copy, array, start+length+1, end);
    	// i初始化为前半段最后一个数字的下标
    	int i= start + length;
    	// j初始化为后半段最后一个数字的下标
    	int j = end;
    	int indexCopy = end;
    	long count = 0;
    	while (i>=start && j>=start+length+1) {
    		if (array[i] > array[j]) {
    			copy[indexCopy--] = array[i--];
    			count += j-start-length;
    		} else {
    			copy[indexCopy--] = array[j--];
    		}
    	}
    	
    	for (; i>=start; --i) 
    		copy[indexCopy--] = array[i];
    	for (; j>=start+length+1; --j) 
    		copy[indexCopy--] = array[j];
    	
    	return left+right+count;
    }
    
    public static void main(String[] args) {
    	Solution solu = new Solution();
    	int[] a = {364,637,341,406,747,995,234,971,571,219,993,407,416,366,315,301,601,650,418,355,460,505,360,965,516,648,727,667,465,849,455,181,486,149,588,233,144,174,557,67,746,550,474,162,268,142,463,221,882,576,604,739,288,569,256,936,275,401,497,82,935,983,583,523,697,478,147,795,380,973,958,115,773,870,259,655,446,863,735,784,3,671,433,630,425,930,64,266,235,187,284,665,874,80,45,848,38,811,267,575};
    	System.out.println(solu.InversePairs(a));
    }
}

```


### 两个链表的第一个公共节点
* 先计算链表的长度，然后让长链表先走几步，再让两个链表同时走，第一个相同的结点就是结果。
* 两个链表的形状是Y形。

```
class ListNode {
    int val;
    ListNode next = null;

    ListNode(int val) {
        this.val = val;
    }
}

public class Solution {
    public ListNode FindFirstCommonNode(ListNode pHead1, ListNode pHead2) {
    	if (pHead1==null)
    		return pHead1;
    	else if(pHead2==null)
    		return pHead2;
    	int nLength1 = GetListLength(pHead1);
    	int nLength2 = GetListLength(pHead2);
    	int nLengthDif = nLength1 - nLength2;
    	ListNode pListHeadLong = pHead1;
    	ListNode pListHeadShort = pHead2;
    	if (nLength2 > nLength1) {
    		pListHeadLong = pHead2;
    		pListHeadShort = pHead1;
    		nLengthDif = nLength2-nLength1;
    	}
    	// 长链表先走几步
    	for (int i=0; i<nLengthDif; i++)
    		pListHeadLong = pListHeadLong.next;
    	// 再同时在两个链表上遍历
    	while((pListHeadLong!=null) && (pListHeadShort!=null) && (pListHeadLong!=pListHeadShort)) {
    		pListHeadLong = pListHeadLong.next;
    		pListHeadShort = pListHeadShort.next;
    	}
    	// 得到第一个公共结点
    	ListNode pFirstCommonNode = pListHeadLong;
    	return pFirstCommonNode;
    }
    // 计算链表的长度
    public int GetListLength(ListNode head) {
    	int nLength = 0;
    	ListNode node = head;
    	while (node != null) {
    		nLength++;
    		node = node.next;
    	}
    	return nLength;
    }
}
```


## 第六章 面试中的各项能力


### 数字在排序数组中出现的次数
* 通过二分查找找到第一个k和最后一个k的位置，即可。

```
public class Solution {
    public int GetNumberOfK(int [] array , int k) {
       if (array==null || array.length<=0)
    	   return 0;
       int number=0;
       int length = array.length;
       int first = GetFirstK(array, length, k, 0, length-1);
       int last = GetLastK(array, length, k, 0, length-1);
       if (first>-1 && last>-1)
    	   number = last-first+1;
       
       return number;
    }
    // 计算第一个K的索引位置
    int GetFirstK(int[] array, int length, int k, int start, int end) {
    	if (start>end)
    		return -1;
    	int middleIndex = (start+end)/2;
    	int middleData = array[middleIndex];
    	if(middleData == k) {
    		if ((middleIndex>0 && array[middleIndex-1]!=k) || middleIndex==0)
    			return middleIndex;
    		else 
    			end = middleIndex-1;
    	} else if(middleData>k)
    		end = middleIndex-1;
    	else
    		start = middleIndex+1;
    	
    	return GetFirstK(array, length, k, start, end);
    }
    // 计算最后一个k的位置
    int GetLastK(int[] array, int length, int k, int start, int end) {
    	if (start>end)
    		return -1;
    	int middleIndex = (start+end)/2;
    	int middleData = array[middleIndex];
    	if(middleData == k) {
    		if ((middleIndex<length-1 && array[middleIndex+1]!=k) || middleIndex==length-1)
    			return middleIndex;
    		else 
    			start = middleIndex+1;
    	} else if(middleData<k)
    		start = middleIndex+1;
    	else
    		end = middleIndex-1;
    	
    	return GetLastK(array, length, k, start, end);
    }
}
```


### 二叉树的深度
* 根据树的遍历改写。

```
public class Solution {
	public int TreeDepth(TreeNode pRoot)
    {
		if (pRoot==null)
			return 0;
		int nLeft = TreeDepth(pRoot.left);
		int nRight = TreeDepth(pRoot.right);
		
		return (nLeft>nRight) ? (nLeft+1) : (nRight+1);
    }
}
```


### 平衡二叉树

```

```


### 数组中只出现一次的数字
* 难

```
//num1,num2分别为长度为1的数组。传出参数
//将num1[0],num2[0]设置为返回结果
public class Solution {
  public void FindNumsAppearOnce(int [] array,int num1[] , int num2[]) {
	  int length = array.length;
      if (array==null || length<2)
    	  return;
      int resultExclusiveOR = 0;
      for (int i=0; i<length; i++)
    	  resultExclusiveOR ^= array[i];
      int indexOf1 = FindFirstBitIs1(resultExclusiveOR);
      num1[0] = num2[0] = 0;
      for (int j=0; j<length; j++) {
    	  if (IsBit1(array[j], indexOf1))
    		  num1[0] ^= array[j];
    	  else
    		  num2[0] ^= array[j];
      }
  }
  
  public int FindFirstBitIs1 (int num) {
	  int indexBit = 0;
	  while (((num&1)==0) && (indexBit<Integer.SIZE)) {
		  num = num>>1;
	      indexBit++;
	  }
	  return indexBit;
  }
  
  public boolean IsBit1 (int num, int indexBit) {
	  num = num >> indexBit;
	  return ((num & 1)!=0);
  }
  
  public static void main (String[] args) {
	  Solution solu = new Solution();
	  int[] a = {2,4,3,6,3,2,5,5};
	  int[] b = new int[1];
	  int[] c = new int[1];
	  solu.FindNumsAppearOnce(a, b, c);
	  System.out.println(b[0] + " " + c[0]);
  }
}
```


### 和为S的连续正数序列

```
import java.util.ArrayList;
public class Solution {
    public ArrayList<ArrayList<Integer> > FindContinuousSequence(int sum) {
    	ArrayList<ArrayList<Integer>> result = new ArrayList<ArrayList<Integer>>();
    	if (sum<3)
    	   return result;
    	
    	int small = 1;
    	int big = 2;
    	int middle = (1+sum)/2;
    	int curSum = small + big;
    	
    	while (small < middle) {
    		if (curSum == sum)
    			addElem (result, small, big);
    		while(curSum>sum && small<middle) {
    			curSum -= small;
    			small++;
    			if (curSum==sum)
    				addElem (result, small, big);
    		}
    		big++;
    		curSum += big;
    	}
    	return result;
    }
    
    public void addElem (ArrayList<ArrayList<Integer>> array, int small, int big) {
    	ArrayList<Integer> temp= new ArrayList<Integer>();
		for (int i=small; i<=big; i++) {
			temp.add(i);
		}
		array.add(temp);
    }
    
    public static void main (String[] args) {
    	Solution solu = new Solution();
    	ArrayList<ArrayList<Integer>> array;
    	array = solu.FindContinuousSequence(15);
    	for (int i=0; i<array.size(); i++) {
    		for (int j=0; j<array.get(i).size(); j++) {
    			System.out.print(array.get(i).get(j));
    		}
    		System.out.println();
    	}
    }
}
```


### 	和为S的两个数字

```
import java.util.ArrayList;
public class Solution {
	public ArrayList<Integer> FindNumbersWithSum(int [] array,int sum) {
        //boolean found = false;
        int length = array.length;
        ArrayList<Integer> al = new ArrayList<Integer>();
        if (length<1) 
        	return al;
        
        int ahead = length-1;
        int behind = 0;
        
        while (ahead>behind) {
        	long curSum = array[ahead] + array[behind];
        	if(curSum==sum) {
        		al.add(array[behind]);
        		al.add(array[ahead]);
        		//found = true;
        		break;
        	} else if (curSum > sum) {
        		ahead--;
        	} else 
        		behind++;
        }
        return al;
        
    }
}
```


### 左旋转字符串

```
public class Solution {
    public String LeftRotateString(String str,int n) {
        if (str != null) {
        	int nLength = str.length();
        	if (nLength>0 && n>0 && n<nLength) {
        		int begin1 = 0;
        		int end1 = n-1;
        		int begin2 = n;
        		int end2 = nLength-1;
        		char[] strArr = str.toCharArray();
        		Reverse(strArr, begin1, end1);
        		Reverse(strArr, begin2, end2);
        		Reverse(strArr, begin1, end2);
        		str = String.copyValueOf(strArr);
        	}
        }
        return str;
    }
    
    public void Reverse(char[] strArr, int begin, int end) {
    	if (strArr==null)
    		return;
    	while (begin<end) {
    		char temp = strArr[begin];
    		strArr[begin] = strArr[end];
    		strArr[end] = temp;
    		begin++;
    		end--;
    	}
    }
    
    public static void main(String[] args) {
    	Solution solu = new Solution();
    	//String str = solu.ReverseSentence("I am a student.");
    	String str = solu.LeftRotateString("Wonderful", 2);
    	System.out.println(str);
    }
}
```


### 翻转单词顺序序列

```
public class Solution {
    public String ReverseSentence(String str) {
        if (str==null || str.length()<=0)
        	return str;
        char[] strArr = str.toCharArray();
        // 翻转所有的字符
        Reverse(strArr, 0, strArr.length-1);
        // 翻转句子中每个单词
        int begin = 0;
        int end = 0;
        while (begin < strArr.length-1) {
        	if (strArr[begin] == ' ') {
        		begin++;
        		end++;
        	} else if ( end == strArr.length || strArr[end]==' ') {
        		end--;
        		Reverse(strArr, begin, end);
        		begin = ++end;
        	} else {
        		
        		end++;
        	}
        }
        return String.copyValueOf(strArr);
    }
    
    public void Reverse(char[] strArr, int begin, int end) {
    	if (strArr==null)
    		return;
    	while (begin<end) {
    		char temp = strArr[begin];
    		strArr[begin] = strArr[end];
    		strArr[end] = temp;
    		begin++;
    		end--;
    	}
    }
    
    public static void main(String[] args) {
    	Solution solu = new Solution();
    	//String str = solu.ReverseSentence("I am a student.");
    	String str = solu.ReverseSentence("Wonderful");
    	System.out.println(str);
    }
}
```


### 扑克牌顺子

```
import java.util.Arrays;
import java.util.Comparator;

public class Solution {
    public boolean isContinuous(int [] numbers) {
    	int length = numbers.length;
    	if (numbers==null || length<1) 
    		return false;
    	Integer[] numArr = new Integer[length];
    	for (int i=0; i<length; i++) {
    		numArr[i] = numbers[i];
    	}
    	Arrays.sort(numArr, new ComparatorTest());
    	
    	int numOfZero = 0;
    	int numOfGap = 0;
    	// 统计0的个数
    	for (int i=0; i<length;i++)
    		if (numArr[i] == 0)
    			numOfZero++;
    	// 统计间隔的数目
    	int small = numOfZero;	//第一个非零数字的位置
    	int big = small + 1;	//第二个非零数字的位置
    	while (big < length) {
    		// 如果两个数相等，不可能是顺子
    		if (numArr[small] == numArr[big])
    			return false;
    		numOfGap += numArr[big] - numArr[small] - 1;
    		small = big;
    		big++;
    	}

    	return (numOfGap>numOfZero) ? false: true;
    }
    
    public static void main(String[] args) {
    	Solution solu = new Solution();
    	//int a[] = {1,2,0,4,5};
    	int[] a = {1,3,2,6,4};
    	System.out.println(solu.isContinuous(a));
    }
}

class ComparatorTest implements Comparator<Integer> {
	@Override
	public int compare(Integer num1, Integer num2) {
		// TODO Auto-generated method stub
		return num1-num2;
	}
}
```


### 孩子们的游戏（圆圈中最后剩下的数）
* 分析规律，构建递归公式。

```
public class Solution {
    public int LastRemaining_Solution(int n, int m) {
    	if (n<1 || m<1)
    		return -1;
    	int last = 0;
    	for (int i=2; i<=n; i++) {
    		last = (last+m)%i;
    	}
    	return last;
    }
}
```


### 求1+2+3+...+n
* 要求不让使用循环，条件语句实现。
* 使用构造函数可以实现。

```
public class Solution {
    public int Sum_Solution(int n) {
    	int sum=0;
        for (int i=1; i<=n; i++) {
        	sum += i;
        }
        
        return sum;
    }
    
    public static void main (String[] args) {
    	Solution solu = new Solution();
    	System.out.println(solu.Sum_Solution(10));
    }
}

```


### 不用加减乘除做加法

```
public class Solution {
    public int Add(int num1,int num2) {
        int sum, carry;
        do {
        	sum = num1 ^ num2;
        	carry = (num1 & num2) << 1;
        	num1 = sum;
        	num2 = carry;
        }while(num2 != 0);
        
        return num1;
    }
    
    public static void main(String[] args) {
    	Solution solu = new Solution();
    	System.out.println(solu.Add(3, 34));
    }
}
```


## 第七章 两个面试案例


### 把字符串转换成整数

```
public class Solution {
    public int StrToInt(String str) {
    	int result=0;
    	try{
    		result = Integer.valueOf(str);
    	} catch(Exception e) {
    		//e.printStackTrace();
    	} 
    	return result;
        
    }
    public static void main (String[] args) {
    	Solution solu = new Solution();
    	System.out.println(solu.StrToInt("12a"));
    }
}
```

## 第八章 英文版新增面试题


### 数组中重复的数字 

```
public class Solution {
    // Parameters:
    //    numbers:     an array of integers
    //    length:      the length of array numbers
    //    duplication: (Output) the duplicated number in the array number,length of duplication array is 1,so using duplication[0] = ? in implementation;
    //                  Here duplication like pointor in C/C++, duplication[0] equal *duplication in C/C++
    //    这里要特别注意~返回任意重复的一个，赋值duplication[0]
    // Return value:       true if the input is valid, and there are some duplications in the array number
    //                     otherwise false
    public boolean duplicate(int numbers[],int length,int [] duplication) {
    	duplication[0] = -1;
    	if (numbers==null || numbers.length<1)
    		return false;
    	for (int i=0; i<length; i++) 
    		if (numbers[i]<0 || numbers[i]>length-1)
    			return false;
    	
    	for (int i=0; i<length; i++) {
    		while (numbers[i] != i) {
    			if (numbers[i] == numbers[numbers[i]]) {
    				duplication[0] = numbers[i];
    				return true;
    			}
    			// 交换第i个元素和第numbers[i]个元素
    			int temp = numbers[i];
    			numbers[i] = numbers[temp];
    			numbers[temp] = temp;
    		}
    	}
    	
    	return false;
    }
    
    public static void main (String[] args) {
    	Solution solu = new Solution();
    	//int[] numbers = {2,3,1,0,2,5,3};
    	int[] numbers = {0,1};
    	int[] duplication = new int[1];
    	boolean b = solu.duplicate(numbers, numbers.length, duplication);
    	System.out.println(b);
    	System.out.println(duplication[0]);
    }
}
```


### 构建乘积数组

```
public class Solution {
    public int[] multiply(int[] A) {
		int[] result = null;
		if (A==null || A.length<1)
			return result;
		result = new int[A.length];
		// result = C*D
		// C
		result[0] = 1;
		for (int i=1; i<result.length; i++) {
			result[i] = result[i-1] * A[i-1];
		}
		// D
		int temp = 1;
		for (int i=result.length-2; i>=0; i--) {
			temp *= A[i+1]; // D[i]
			result[i] *= temp; // result[i]=C[i]*D[i]
		}
		return result;
    }
    
    public static void main(String[] args) {
    	Solution solu = new Solution();
    	int[] a = {1,2,3};
    	int[] b = new int[3];
    	b = solu.multiply(a);
    	for (int i=0; i<b.length; i++) {
    		System.out.print(b[i]);
    	}
    }
}
```


### 正则表达式匹配

```
import java.util.Arrays;

public class Solution {
    public boolean match(char[] str, char[] pattern)
    {
        if (str==null || pattern==null)
        	return false;
        
        return matchCore(str, pattern);
    }
    
    public boolean matchCore (char[] str, char[] pattern) {
    	// 模式为空的情况
    	if (str.length==0 && pattern.length==0)
    		return true;
    	if (str.length!=0 && pattern.length==0)
    		return false;
    	
    	if (pattern.length>1 && pattern[1] == '*') {
    		//if (str[0]==pattern[0] || (pattern[0]=='.' && str.length!=0)){
    		if (str.length!=0 && (str[0]==pattern[0] || pattern[0]=='.')){
    			boolean b1, b2, b3;
    			b1 = matchCore(Arrays.copyOfRange(str, 1, str.length), Arrays.copyOfRange(pattern, 2, pattern.length));
    			b2 = matchCore(Arrays.copyOfRange(str, 1, str.length), pattern);
    			b3 = matchCore(str, Arrays.copyOfRange(pattern, 2, pattern.length));
    			return b1 || b2 || b3;
    		} else {
    			return matchCore(str, Arrays.copyOfRange(pattern, 2, pattern.length));
    		}
    	}
    	
    	if (str.length!=0 && (str[0]==pattern[0] || pattern[0]=='.'))
    		return matchCore(Arrays.copyOfRange(str, 1, str.length), Arrays.copyOfRange(pattern, 1, pattern.length));
    	
    	return false;    	
    }
    
    public static void main (String[] args) {
    	/*
    	char[] str = {'b'};
    	char[] str2 = Arrays.copyOfRange(str, 1, str.length);
    	System.out.println(str2.length);
    	*/
    	char[] str = {};
    	char[] pattern = {'.'};
    	Solution solu = new Solution();
    	boolean res = solu.match(str, pattern);
    	System.out.println(res);
    	
    }
} 
```


### 表示数值的字符串

```
import java.util.Arrays;

public class Solution {
    public boolean isNumeric(char[] str) {
        if (str==null || str.length<1)
        	return false;
        //跳过正负号
        if (str.length>0 && (str[0]=='+' || str[0]=='-'))
        	str = Arrays.copyOfRange(str, 1, str.length);
        if (str.length==0)
        	return false;
        boolean[] isNumeric = {true};
        // 跳过0-9数字
        str = scanDigits(str);
        if (str.length>0) {
        	// 浮点数
        	if (str[0] == '.') {
        		str = Arrays.copyOfRange(str, 1, str.length);
        		str = scanDigits(str);
        		if (str.length>0 && (str[0]=='e' || str[0]=='E'))
        			str = isExponential(str, isNumeric);
        	} else if (str[0]=='e' || str[0]=='E') // 整数
        		str = isExponential(str, isNumeric);
        	else
        		isNumeric[0] = false;
        }

        return isNumeric[0] && (str.length==0);
    }
    
    public char[] scanDigits(char[] str) {
    	while (str.length>0 && str[0]>='0' && str[0]<='9') {
    		str = Arrays.copyOfRange(str, 1, str.length);
    		//System.out.println(String.valueOf(str));
    	}
    	return str;
    }
    
    public char[] isExponential (char[] str, boolean[] isExp) {
    	if (str.length>0 && str[0]!='e' && str[0]!='E') {
    		isExp[0] = false;
    		return str;
    	}
    	str = Arrays.copyOfRange(str, 1, str.length);
    	if (str.length>0 && (str[0]=='+' || str[0]=='-'))
    		str = Arrays.copyOfRange(str, 1, str.length);
    	if (str.length<1) {
    		isExp[0] = false;
    		return str;
    	}
    	str = scanDigits(str);
    	
    	isExp[0] = (str.length==0) ? true : false;
    	return str;
    }
    
    public static void main (String[] args) {
    	Solution solu = new Solution();
    	boolean res = solu.isNumeric("12E3".toCharArray());
    	System.out.println(res);
    }
}
```


### 字符流中第一个不重复的字符

```
public class Solution {
	int[] occurrence = new int[256];
	int index;
	
	public Solution() {
		for (int i=0; i<occurrence.length; i++) {
			occurrence[i] = -1;
		}
	}
	
    //Insert one char from stringstream
    public void Insert(char ch)
    {
        if (occurrence[ch] == -1) //没出现过，设置为索引
        	occurrence[ch] = index;
        else if (occurrence[ch]>=0) //已经出现过，标记为-2
        	occurrence[ch] = -2;
        index++;
    }
  //return the first appearence once char in current stringstream
    public char FirstAppearingOnce()
    {
    	char ch = '#';
    	int minIndex = Integer.MAX_VALUE;
    	for (int i=0; i<256; i++) {
    		if (occurrence[i]>=0 && occurrence[i]<minIndex) {
    			ch = (char)i;
    			minIndex = occurrence[i];
    		}
    	}
    	
    	return ch;
    }
    
}
```


###  链表中第一个不重复的字符

```
public class Solution {
	int[] occurrence = new int[256];
	int index;
	
	public Solution() {
		for (int i=0; i<occurrence.length; i++) {
			occurrence[i] = -1;
		}
	}
	
    //Insert one char from stringstream
    public void Insert(char ch)
    {
        if (occurrence[ch] == -1) //没出现过，设置为索引
        	occurrence[ch] = index;
        else if (occurrence[ch]>=0) //已经出现过，标记为-2
        	occurrence[ch] = -2;
        index++;
    }
  //return the first appearence once char in current stringstream
    public char FirstAppearingOnce()
    {
    	char ch = '#';
    	int minIndex = Integer.MAX_VALUE;
    	for (int i=0; i<256; i++) {
    		if (occurrence[i]>=0 && occurrence[i]<minIndex) {
    			ch = (char)i;
    			minIndex = occurrence[i];
    		}
    	}
    	
    	return ch;
    }
    
}
```


### 链表中环的入口结点

```
public class Solution {

    public ListNode EntryNodeOfLoop(ListNode pHead)
    {
        if (pHead==null)
        	return null;
        // 找到环中的一个结点
        ListNode meetingNode = MeetingNode(pHead);
        if (meetingNode==null)
        	return null;
        // 计算环中节点的数目
        int nodesInLoop = 1;
        ListNode pNode1 = meetingNode;
        while(pNode1.next!=meetingNode) {
        	pNode1 = pNode1.next;
        	nodesInLoop++;
        }
        // 移动n个
        pNode1 = pHead;
        for (int i=0; i<nodesInLoop; i++) {
        	pNode1 = pNode1.next;
        }
        // 同时移动pNode1和pNode2
        ListNode pNode2 = pHead;
        while (pNode1 != pNode2) {
        	pNode1 = pNode1.next;
        	pNode2 = pNode2.next;
        }
        
        return pNode1;
    }
    
    public ListNode MeetingNode(ListNode pHead) {
    	if (pHead==null) // 判空
    		return null;
    	ListNode pSlow = pHead.next; // 定义慢指针
    	if (pSlow==null)
    		return null;
    	ListNode pFast = pSlow.next;
    	while (pFast!=null && pSlow!=null) {
    		if (pFast==pSlow)
    			return pFast;
    		pSlow = pSlow.next; // 慢指针走一步
    		pFast = pFast.next; // 快指针走两步
    		if (pFast!=null)
    			pFast = pFast.next;
    	}
    	return null;
    }
}
```


### 删除链表中重复的结点

```
class ListNode {
    int val;
    ListNode next = null;

    ListNode(int val) {
        this.val = val;
    }
}

public class Solution {
    public ListNode deleteDuplication(ListNode pHead)
    {
    	if (pHead == null)
    		return null;
    	ListNode pPreNode = null;
    	ListNode pNode = pHead;
    	while(pNode!=null) {
    		ListNode pNext = pNode.next;
    		boolean needDelete = false;
    		if (pNext!=null && pNext.val==pNode.val)
    			needDelete = true;
    		
    		if (!needDelete) {//不需要删除
    			pPreNode = pNode;
    			pNode = pNode.next;
    		} else {
    			int value = pNode.val;
    			ListNode pToBeDel = pNode;
    			while(pToBeDel!=null && pToBeDel.val==value) {
    				pNext=pToBeDel.next;
    				pToBeDel = pNext;
    			}
    			
    			if (pPreNode==null)
    				pHead = pNext;
    			else
    				pPreNode.next = pNext;
    			pNode = pNext;
    		}
    	}
    	
    	return pHead;
    }
}
```


### 二叉树的下一个结点

```
class TreeLinkNode {
    int val;
    TreeLinkNode left = null;
    TreeLinkNode right = null;
    TreeLinkNode next = null;

    TreeLinkNode(int val) {
        this.val = val;
    }
}


public class Solution {
    public TreeLinkNode GetNext(TreeLinkNode pNode)
    {
        if (pNode==null)
        	return null;
        TreeLinkNode pNext = null;
        if (pNode.right != null) { // 查询点有右子树的情况
        	TreeLinkNode pRight = pNode.right;
        	while (pRight.left != null)
        		pRight = pRight.left;
        	pNext = pRight;
        } else if (pNode.next != null) { // 查询点不存在右子树，存在父节点
        	TreeLinkNode pCurrent = pNode;
        	TreeLinkNode pParent = pNode.next;
        	while (pParent!=null && pCurrent==pParent.right) {
        		pCurrent = pParent;
        		pParent = pParent.next;
        	}
        	
        	pNext = pParent;
        }
        
        return pNext;
    }
}
```


### 对称的二叉树

```
class TreeNode {
    int val = 0;
    TreeNode left = null;
    TreeNode right = null;

    public TreeNode(int val) {
        this.val = val;

    }

}

public class Solution {
    boolean isSymmetrical(TreeNode pRoot)
    {
        return isSymmetrical(pRoot, pRoot);
    }
    
    boolean isSymmetrical(TreeNode pRoot1, TreeNode pRoot2) {
    	if (pRoot1==null && pRoot2==null) // 两个都为null
    		return true;
    	if (pRoot1==null || pRoot2==null) // 其中一个为null
    		return false;
    	if (pRoot1.val != pRoot2.val)
    		return false;
    	
    	return isSymmetrical(pRoot1.left, pRoot2.right) 
    			&& isSymmetrical(pRoot1.right, pRoot2.left);
    }
}
```


### 按之字形顺序打印二叉树

```
import java.util.ArrayList;
import java.util.Stack;

class TreeNode {
    int val = 0;
    TreeNode left = null;
    TreeNode right = null;

    public TreeNode(int val) {
        this.val = val;

    }

}

public class Solution {
    public ArrayList<ArrayList<Integer> > Print(TreeNode pRoot) {
    	if (pRoot == null)
    		return new ArrayList<ArrayList<Integer> >();
    	
    	ArrayList<ArrayList<Integer>> result = new ArrayList<ArrayList<Integer>>();
    	
    	Stack<TreeNode> level0 = new Stack<TreeNode>();
    	Stack<TreeNode> level1 = new Stack<TreeNode>();
		Stack<TreeNode> levelCurrent;
		Stack<TreeNode> levelNext;
    	//Stack<TreeNode>levleOdd = new Stack<TreeNode>();  // 奇数层栈
    	//Stack<TreeNode>levleEven = new Stack<TreeNode>(); // 偶数层栈
    	int current = 0;
    	int next = 1;
    	
    	level0.push(pRoot);
    	while (!level0.empty() || !level1.empty()) {
    		if (current == 0) {
    			levelCurrent = level0;
    			levelNext = level1;
    		} else {
    			levelCurrent = level1;
    			levelNext = level0;
    		}
    		ArrayList<Integer> temp = new ArrayList<Integer>();
    		while (!levelCurrent.empty()) {
        		TreeNode pNode = levelCurrent.peek();
        		levelCurrent.pop();
        		temp.add(pNode.val);
        		if (current==0) {
        			if (pNode.left != null)
        				levelNext.push(pNode.left);
        			if (pNode.right != null) 
        				levelNext.push(pNode.right);
        		} else {
        			if (pNode.right != null)
        				levelNext.push(pNode.right);
        			if (pNode.left != null)
        				levelNext.push(pNode.left);
        		}
    		}
    		
			result.add(temp);
			current = 1-current;
			next = 1-next;
    	}
    	
    	return result;
    }
    
    public static void main (String[] args) {
    	Solution solu = new Solution();
    	ArrayList<ArrayList<Integer> > result;
    	TreeNode t0 = new TreeNode(8);
    	TreeNode t1 = new TreeNode(6);
    	TreeNode t2 = new TreeNode(10);
    	TreeNode t3 = new TreeNode(5);
    	TreeNode t4 = new TreeNode(7);
    	TreeNode t5 = new TreeNode(9);
    	TreeNode t6 = new TreeNode(11);
    	t0.left = t1;
    	t0.right = t2;
    	t1.left = t3;
    	t1.right = t4;
    	t2.left = t5;
    	t2.right = t6;
    	result = solu.Print(t0);
    	System.out.println(result.toString());
    }
}
```


### 把二叉树打印成多行

```
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.Queue;

class TreeNode {
    int val = 0;
    TreeNode left = null;
    TreeNode right = null;

    public TreeNode(int val) {
        this.val = val;

    }

}

public class Solution {
    ArrayList<ArrayList<Integer> > Print(TreeNode pRoot) {
    	ArrayList<ArrayList<Integer>> result = new ArrayList<ArrayList<Integer>>();
    	if (pRoot == null)
    		return result;
    	Queue<TreeNode> nodes = new LinkedList<TreeNode>();	//创建队列
    	nodes.add(pRoot);
    	int nextLevel = 0;	 // 下一层点数
    	int toBePrinted = 1; // 当前层中还没有打印的点数
    	while (!nodes.isEmpty()) {
    		ArrayList<Integer> temp = new ArrayList<Integer>();
    		while (toBePrinted > 0) {
        		TreeNode pNode = nodes.peek();
        		temp.add(pNode.val);
        		
        		if (pNode.left != null) {
        			nodes.add(pNode.left);
        			nextLevel++; // 下一层增加一个结点
        		}
        		if (pNode.right != null) {
        			nodes.add(pNode.right);
        			nextLevel++;
        		}
        		nodes.poll();
        		toBePrinted--;
    		}
    		result.add(temp);
    		toBePrinted = nextLevel;
    		nextLevel = 0;
    		
    	}
    	
    	return result;
    }
}
```


### 序列化二叉树


### 二叉搜索树的第k个结点


### 数据流中的中位数


### 滑动窗口的最大值


### 矩阵中的路径


### 机器人的运动范围

