title: 运维-使用国内免费CDN加速GitHub Pages
tags:
  - 运维
categories:
  - 运维
comments: true
updated: false
author: 张学志
date: 2018-04-15 23:11:00
---
> 本文描述了使用国内免费CDN**【加速乐】**来加速GitHub-Pages。
<!-- more -->

 ## 概述
 
#### 博客
* 我的博客使用github pages服务搭建的。国内访问速度比较慢，因此想到CDN加速。
 
#### CDN
* CDN很多，但是好的服务要收费的，比如阿里云。
* 在网上找到一些免费的CDN。[《国内9大免费CDN汇总》](https://blog.csdn.net/qq_25281775/article/details/77479785)
* 本文是使用了上面链接中的第一个：**加速乐**。

#### 域名
* 我的域名`xuezhisd.top`是在阿里云（万网）购买的。


## 配置加速乐

#### 注册账户
* 点击[https://www.yunaq.com/](https://www.yunaq.com/)，填写邮箱，手机号，密码等注册。
* 根据提示，完成邮箱和手机验证。

#### 添加域名

* 点击右侧面板的`域名管理`，然后点击`添加域名`，添加需要CDN加速的域名。
* 有两种接入方式，NS和CNAME。由于CNAME需要备案，本文选择使用NS。
* 如下图所示，已经添加了`xuezhisd.top`。

![upload successful](/images/pasted-1.png)

* 点击域名`xuezhisd.top`，添加子域名`blog.xuezhisd.top`。如下图所示。

![upload successful](/images/pasted-2.png)


#### 切换DNS

* 点击`下一步，DNS切换`，按照提示，到阿里云上修改DNS。


* 在阿里云上，点击`DNS修改`，将默认的DNS修改为`ns1.jiasule.net`和`ns2.jiasule.net`。

![upload successful](/images/pasted-3.png)

* 如下图所示，点击`立即接入`，提示**域名切换成功**。【这需要等几分钟】
![upload successful](/images/pasted-4.png)


