---
title: 如何在ipython或python中使用Spark
tags:
  - Linux
categories:
  - Linux
author: 张学志
abbrlink: 777a
date: 2016-07-31 13:21:00
description: ...
---





# 如何在ipython中使用spark
* 说明：
	* spark 1.6.0
	* scala 2.10.5
	* spark安装路径是`/usr/local/spark`；已经在`.bashrc`中配置了`SPARK_HOME`环境变量。

<!-- more -->
    
## 方法一

* `/usr/local/spark/bin/pyspark`默认打开的是python，而不是ipython。通过在pyspark文件中添加一行，来使用ipython打开。

``` bash
cp pyspark ipyspark
vi ipyspark
# 在最前面添加
IPYTHON=1
# 启动
ipyspark
```

## 方法二：
* 通过为spark创建一个ipython 配置的方式实现。

```
# 为spark创建一个ipython 配置
ipython profile create spark
# 创建启动配置文件
cd ~/.config/ipython/profile_spark/startup
vi 00-pyspark-setup.py
```

* 在00-pyspark-setup.py中添加如下内容：

```
import os
import sys
# Configure the environment
if 'SPARK_HOME' not in os.environ:
    os.environ['SPARK_HOME'] = '/srv/spark'
# Create a variable for our root path
SPARK_HOME = os.environ['SPARK_HOME']
# Add the PySpark/py4j to the Python Path
sys.path.insert(0, os.path.join(SPARK_HOME, "python", "pyspark"))
sys.path.insert(0, os.path.join(SPARK_HOME, "python", "lib", "py4j-0.9-src.zip"))
sys.path.insert(0, os.path.join(SPARK_HOME, "python"))
```

* 启动ipython

```
ipython –profile spark
```

## 测试程序
* 在ipython中输入一下命令，如果下面的程序执行完后输出一个数字，说明正确。

``` python
from pyspark import  SparkContext
sc = SparkContext( 'local', 'pyspark')

def isprime(n):
    """
    check if integer n is a prime
    """
    # make sure n is a positive integer
    n = abs(int(n))
    # 0 and 1 are not primes
    if n < 2:
        return False
    # 2 is the only even prime number
    if n == 2:
        return True
    # all other even numbers are not primes
    if not n & 1:
        return False
    # for all odd numbers
    for x in range(3, int(n**0.5)+1, 2):
        if n % x == 0:
            return False
    return True

# Create an RDD of numbers from 0 to 1,000,000
nums = sc.parallelize(xrange(1000000))
# Compute the number of primes in the RDD
print “Result: ”, nums.filter(isprime).count()
```

## 方法三
* 将上面的程序放入test.py文件，执行命令`python test.py`。发现错误。因为没有将pyspark路径加入`PYTHONPATH`环境变量。
* 在~/.bashrc或/etc/profile中添加如下内容:

```bash
# python can call pyspark directly
export PYTHONPATH=$SPARK_HOME/python:$SPARK_HOME/python/pyspark:$SPARK_HOME/python/lib/py4j-0.9-src.zip:$PYTHONPATH
```
    
    
* 执行如下命令：

```bash
# 使配置生效
source ~/.bashrc
# 测试程序
python test.py
```
    
* 此时，已经能够运行了。



