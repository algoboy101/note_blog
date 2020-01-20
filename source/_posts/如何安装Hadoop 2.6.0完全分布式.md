---
title: 如何安装Hadoop 2.6.0完全分布式？
tags:
  - Linux
categories:
  - Linux
author: 张学志
abbrlink: e6d7
date: 2016-07-31 13:20:00
description: ...
---




> 本教程是关于如何在Ubuntu中搭建完全分布式Hadoop2.6.*环境的完整教程。

## 一、环境说明
* 操作系统：Ubuntu 14.04
	注：其它版本的Ubuntu安装过程一样
* 虚拟机：VMware Workstation或VirtualBox
	注：VMware Workstation的功能更强大，但是软件体积也比较大；而且在Ubuntu中我没有安装成功。VirtualBox软件体积小，更加灵活好用，而且可以跨平台使用。但是VirtualBox有些功能不支持，比如Linux版本的VirtualBox不支持文件拖拽和共享粘贴板功能。另外，Ubuntu版VirtualBox5.1存在问题，安装增强工具包之后无法启动。建议安装VirtualBox5.0。
* JDK：Java 1.8
* 集群节点：2个（master, slave1）

<!-- more -->

## 二、安装虚拟机
* 此处考虑到跨平台的因素，选择使用VirtualBox
* 存在两种安装方式，下载deb包和添加路径，使用apt-get命令安装。
* 请点击下面的链接自行安装
参考：
[Ubuntu15.04系统安装Virtualbox虚拟机](http://jingyan.baidu.com/article/870c6fc3092aedb03fe4be28.html)

## 三、准备工作

### 安装Java

#### 下载JDK
* JDK下载地址：[官网下载地址，点此下载](http://www.oracle.com/technetwork/java/javase/downloads/index.html)

#### 安装JDK
* 安装方法很简单，简单的说就2步：
	* 第一步：解压，并复制文件到指定路径。如`/usr/local/jdk`
	* 第二部：添加路径，修改配置文件。如修改`/etc/profile`或`~/.bashrc`。
* 参考：[Ubuntu下搭建JAVA开发环境](http://jingyan.baidu.com/article/86fae346b696633c49121a30.html)

### 创建hadoop账号
* 注：不一定非得创建hadoop账号，这一项可选。
* 但是，对于新手来说，最好创建hadoop账号，并且为它添加超级用户权限。
* 后面的操作都在hadoop账号下进行。
* 参考：[Linux命令——adduser](http://blog.csdn.net/xuezhisdc/article/details/49642573)
* 添加超级用户权限。使用命令`sudo visudo`修改sudoers文件，添加一行。如下图所示。
![这里写图片描述](http://img.blog.csdn.net/20160731101242857) 

### 复制虚拟机
* 网上教程很多，自己搜索。
* 现在有2台虚拟机，一台做NameNode，另一台做DataNode。

## 四、修改配置文件

### 设置静态IP地址
* 因为Hadoop集群中的不同节点之间是基于TCP/IP进行通信的。如果使用DHCP方式动态分配IP，就无法定位到网络中的节点。所以，此处使用静态IP。
* 设置过程：
1. 查看本机IP网段。比如我的网址是`192.168.36.15`,局域网的网段是：`192.168.36.0`~`192.168.36.255`。
2. 设置虚拟机的网络连接方式为**桥接网卡**。如下图所示。
3. 修改配置文件。修改`/etc/network/interfaces`文件。
4. 重启计算机，使配置生效。
* 网络连接方式图如下所示。
 ![这里写图片描述](http://img.blog.csdn.net/20160731095102565)

* 第一台虚拟机的`/etc/network/interfaces`文件内容如下所示：
```bash
auto eth0
#iface eth0 inet dhcp
iface eth0 inet static
address 192.168.36.100
gateway 192.168.36.254
netmask 255.255.255.0
iface eth0 inet6 auto
```
    
* 第二台虚拟机的`/etc/network/interfaces`文件内容如下所示：
```bash
auto eth0
#iface eth0 inet dhcp
iface eth0 inet static
address 192.168.36.101
gateway 192.168.36.254
netmask 255.255.255.0
iface eth0 inet6 auto
```
    
* 注意：因为我们学校有IPv6网络，因此也配置了`inet6`，如果没有的话可以忽略这一项。

### 修改hostname
* Hadoop集群中的各个节点通过主机名互相通信，同时为了好区分主节点和数据节点。此处需要重新设置主机名。
* 将第一台虚拟机的主机名设置为`master`，第一台虚拟机的主机名设置为`slave1`。
* 使用下面的命令设置。

	```
	sudo vi /etc/hostname
	```
* 第一台虚拟机的`/etc/hostname`内容是：

	```
	master
	```
* 第二台虚拟机的`/etc/hostname`内容是：

	```
	slave1
	```
* 重启计算机，使用命令`hostname`确认是否修改成功。

### 修改hosts文件
* 修改命令：`sudo vi /etc/hosts`
* 在master和slave1主机的`/etc/hosts`文件中添加如下内容：

	```bash
	192.168.36.100 	master
	192.168.36.101	slave1
	```
* 重启计算机，测试是否成功。

	```
	ping master
	ping slave1
	```

### 配置ssh免密码登录
* master 和 slave1共同操作

	```bash
	# 如果没有ssh，先安装
	sudo apt-get install openssh-server
	# 生成密匙（不断按回车键，默认即可）
	ssh-keygen -t rsa
	```
* 在~/.ssh/下生成了两个文件id_rsa,id_rsa.pub。第一个是私匙，第二个是公匙。
* 在slave1中的操作

	```bash
	scp id_rsa.pub hadoop@192.168.36.100:~/.ssh/id_rsa.pub_slave1
	```
* 在master中的操作

	```bash
	# 将公匙都存储到authorized_keys文件中
	cat id_rsa.pub >> authorized_keys
	cat id_rsa.pub_slave1 >> authorized_keys
	# 将authorized_keys文件分发到slave1中
	scp authorized_keys hadoop@192.168.36.101:~/.ssh/
	```
* 测试是否成功

	```bash
	# master中测试
	ssh slave1
	# slave1中测试
	ssh master
	```

## 五、安装hadoop
* 注：如未其它说明，以下操作都是在**master节点**上进行的。
* 原来教程将Hadoop安装在`/usr/local/`目录下，但是后面会遇到问题：无法启动NameNode或DataNode。这种问题归根结底都是由于权限造成的。所以，我修改了教程，将Hadoop安装在hadoop用户自己目录下：`/home/hadoop/software/`。

### 下载安装包
* 下载地址：[通用地址](http://hadoop.apache.org/releases.html) or [Hadoop 2.6.0下载地址](http://mirror.bit.edu.cn/apache/hadoop/common/hadoop-2.6.0/)
* 注意：下载二进制版本就可以，不要下载源码。
* 如果是在主机上下载的，请使用Xftp等其他工具将其上传到客户机master和slave1中。
* 假定hadoop存储位置：`~/hadoop-2.6.0.tar.gz`

### 解压拷贝文件
* 先解压，然后重命名，再复制到指定目录，最后创建tmp目录。

	```bash
	# 解压
	tar -zxvf hadoop-2.6.0.tar.gz
	# 重命名
	mv hadoop-2.6.0 hadoop
	# 移动（我安装在/usr/local/下）
	sudo mv hadoop ~/software/
	# 创建tmp目录，后面会用到
	cd ~/software/hadoop
	mkdir -p tmp/dfs/data
	mkdir -p tmp/dfs/name
	```
* 注意：不要安装在`/usr/local`目录下。防止权限问题造成后面无法启动NameNode或DataNOde问题。

### 修改hadoop配置文件
* 此处需要修改**7个**配置文件，全部在`/usr/local/hadoop/etc/hadoop/`目录下。
* 7个配置文件的名字分别是：

	```bash
	hadoop-env.sh # hadoop的环境变量
	yarn-env.sh   # yarn的环境变量
	slaves        # 数据节点名字列表
	core-site.xml   # 
	hdfs-site.xml   # HDFS配置文件
	mapred-site.xml # MapReduce配置文件
	yarn-site.xml   # yarn配置文件
	```

#### 修改hadoop-env.sh 
* 修改JAVA_HOME环境变量。在`hadoop-env.sh`文件中添加一行：

	```
	export JAVA_HOME=/usr/local/jdk
	```
* 注意：我的JDK安装位置时`/usr/local/jdk`。你的不一定相同。所以，这个需要根据自己的JDK位置来设定。

#### 修改yarn-env.sh
* 修改JAVA_HOME环境变量。在`yarn-env.sh`文件中添加一行：

	```
	export JAVA_HOME=/usr/local/jdk
	```
* 注意：我的JDK安装位置时`/usr/local/jdk`。你的不一定相同。所以，这个需要根据自己的JDK位置来设定。

#### 配置slave节点
* 需要修改slaves文件
* 因为此教程只创建了两个虚拟机：master和slave1。master用作NameNode节点，slave1用作DataNode节点。所以，slaves文件仅需要添加slave1即可
* 在slaves文件中添加一行：
	
	```
	slave1
	```

#### 配置core-site.xml
* 在core-site.xml文件中增加以下内容： 

	```
	<configuration>
	    <property>
	        <name>hadoop.tmp.dir</name>
	        <value>file:/home/hadoop/software/hadoop/tmp</value>
	        <description>Abase for other temporary directories.</description>
	    </property>
	    <property>
	        <name>fs.defaultFS</name>
	        <value>hdfs://master:9000</value>
	    </property>
	</configuration>
	```
* 注意：`hadoop.tmp.dir`的值需要和前面创建的tmp路径对应。

#### 配置hdfs-site.xml
* 在hdfs-site.xml文件中增加以下内容： 

	```
	<configuration>
	    <property>
	        <name>dfs.namenode.secondary.http-address</name>
	        <value>master:9001</value>
	    </property>
	    <property>
	        <name>dfs.replication</name>
	        <value>2</value>
	    </property>
	    <property>
	        <name>dfs.namenode.name.dir</name>
	        <value>file:/home/hadoop/software/hadoop/tmp/dfs/name</value>
	    </property>
	    <property>
	        <name>dfs.datanode.data.dir</name>
	        <value>file:/home/hadoop/software/hadoop/tmp/dfs/data</value>
	    </property>
	    <property> 
	            <name>dfs.permissions</name>  
	            <value>false</value>  
	     </property>
	    <property>
	        <name>dfs.webhdfs.enabled</name>
	        <value>true</value>
	    </property>
	</configuration>
	```

#### 配置mapred-site.xml
* 在mapred-site.xml文件中增加以下内容：

	```
	<configuration>
	    <property>
	        <name>mapreduce.framework.name</name>
	        <value>yarn</value>
	    </property>
	    <property>
	        <name>mapreduce.jobhistory.address</name>
	        <value>master:10020</value>
	    </property>
	    <property>
	        <name>mapreduce.jobhistory.webapp.address</name>
	        <value>master:19888</value>
	    </property>
	</configuration> 
	```

#### 配置yarn-site.xml
* 在yarn-site.xml文件中增加以下内容：

	```
	<configuration>
	    <property>
	        <name>yarn.nodemanager.aux-services</name>
	        <value>mapreduce_shuffle</value>
	    </property>
	    <property>
	        <name>yarn.nodemanager.aux-services.mapreduce.shuffle.class</name>
	        <value>org.apache.hadoop.mapred.ShuffleHandler</value>
	    </property>
		<property>  
			<name>yarn.resourcemanager.hostname</name>  
			<value>master</value>  
		</property> 
	    <property>
	        <name>yarn.resourcemanager.address</name>
	        <value>master:8032</value>
	    </property>
	    <property>
	        <name>yarn.resourcemanager.scheduler.address</name>
	        <value>master:8030</value>
	    </property>
	    <property>
	        <name>yarn.resourcemanager.resource-tracker.address</name>
	        <value>master:8035</value>
	    </property>
	    <property>
	        <name>yarn.resourcemanager.admin.address</name>
	        <value>master:8033</value>
	    </property>
	    <property>
	        <name>yarn.resourcemanager.webapp.address</name>
	        <value>master:8088</value>
	    </property>
	<property>  
		<name>yarn.resourcemanager.webapp.https.address</name>  
	    <value>${yarn.resourcemanager.hostname}:8090</value>  
	</property>
	</configuration>
	```

### 复制修改后的hadoop文件夹到其它节点
* 注意：因为`/usr/local`为系统目录，所以先复制到slave1中hadoop的Home路径，再复制到`/usr/local/`下。

	```
	# 从master传输到slave1中
	scp -r /home/hadoop/software/hadoop hadoop@slave1:~/software/
	```
### 修改配置文件profile或.bashrc
* 注意：此操作在**master和slave1**中都要进行。
* 修改`/etc/profile`文件，对所有用户生效；修改`~/.bashrc`文件，仅对自己有效。
* 在`.bashrc`中添加如下内容：

	```
	# added by xuezhi zhang
	PS1='[\[\e[33;40m\]\u@\w]\$\[\e[m\]'
	# java
	export JAVA_HOME=/usr/local/jdk
	export JRE_HOME=/usr/local/jdk/jre
	export CLASSPATH=.:$CLASSPATH:$JAVA_HOME/lib:$JRE_HOME/lib
	export PATH=.:$JAVA_HOME/bin:$JRE_HOME/bin:$PATH
	# Hadoop enviroment var.
	export HADOOP_INSTALL=/home/hadoop/software/hadoop
	export PATH=$PATH:$HADOOP_INSTALL/bin
	export PATH=$PATH:$HADOOP_INSTALL/sbin
	export HADOOP_MAPRED_HOME=$HADOOP_INSTALL
	export HADOOP_COMMON_HOME=$HADOOP_INSTALL
	export HADOOP_HDFS_HOME=$HADOOP_INSTALL
	export YARN_HOME=$HADOOP_INSTALL
	export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_INSTALL/lib/native
	export HADOOP_OPTS="-Djava.library.path=$HADOOP_INSTALL/lib"
	```
* 使配置生效

	```
	source ~/.bashrc
	```


* **至此，Hadoop已经配置完成了。**

## 六、测试hadoop
* 下面开始测试一下hadoop
### 开启hadoop
* 注意：在**master**节点上操作

	```bash
	# 格式化HDFS
	hdfs namenode -format
	# 启动HDFS
	start-dfs.sh
	# 查看Java进程
	jps
	# 启动Yarn
	start-yarn.sh
	jps
	# 查看集群状态
	hdfs dfsadmin -report
	# 或者访问：http://master:8088/
	```

### 关闭hadoop
* 注意：在**master**节点上操作

	```bash
	# 关闭HDFS
	stop-dfs.sh
	# 查看Java进程
	jps
	# 关闭Yarn
	stop-yarn.sh
	jps
	```


* 至此，整个教程已完，谢谢阅读！