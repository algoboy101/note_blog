---
title: 学习笔记——Git
tags:
  - 软件
categories:
  - 软件
author: 张学志
abbrlink: e9ae
date: 2016-08-02 13:19:00
description: ...
---




 

# 一、安装和设置

```bash
# Ubuntu安装Git
sudo apt-get install git -y
# 设置全局用户名和邮件，该机器上所有仓库使用该配置
$ git config --global user.name "Your Name"
$ git config --global user.email "email@example.com"
```

<!-- more -->

# 二、创建版本库

## 创建版本库
```bash
# 创建一个空目录
mkdir learngit
cd learngit
pwd
# 将目录变成“Git仓库”
git init
```
* 该Git库是空仓库。不要私自修改.git目录，Git用它来跟踪管理版本库。
* 不是必须在空目录下创建Git仓库。
* 所有的版本控制系统，其实只能跟踪文本文件的改动，Git也是如此。对于图片和视频等二进制文件，可以使用Git管理，但没法跟踪文件的变化。

## 添加和提交文件
* 	创建readme.txt，添加如下内容。

```bash
Git is a version control system.
Git is free software.
```
* 使用下面的命令添加和提交文件：

```bash
# 添加到仓库
git add readme.txt
# 提交到仓库
git commit –m “wrote a readme file”
```
* `-m “….”`是注释，便于查找改动。推荐使用。
* `git commit` 相当于保存一个快照，可以用于恢复。
* 为什么Git添加文件需要add、commit两步？因为commit可以一次提交很多文件。

```bash
# 多次add，一次提交
git add file1.txt
git add file2.txt file3.txt
git commit –m “add 3 file.”
``` 

## 查看仓库状态和文件变化
* 要随时掌握工作区的状态，使用git status命令。
* 如果git status告诉你有文件被修改过，使用git diff查看修改内容。
* 修改readme.txt，如下所示。

```bash
Git is a distributed version control system.
Git is free software.
```
* 输入以下命令练习。

```bash
# 掌握仓库的当前状态
git status #红色
# 查看修改内容
# git diff的显示格式是Unix通用的diff格式
git diff readme.txt
# 添加到仓库
git status #绿色
# 提交到仓库
git commit -m “add distributed”
git status
```

# 三、时光穿梭机

## 版本回退
* `git log` 显示提交日志（从最近到最远）
* `git log –pretty=online` 精简显示
* `git reset` 版本回退
* 类似`0347cda67cf047da1ad612ab2319e2ef2bf8cff8`是**commit id**（版本号）。之所以不用1,2…，是为了防止多人在同一个仓库工作时出现冲突。
* Git把每次提交串成一条时间线。
* 在Git中，用HEAD表示当前版本，也就是最新的提交。上一个版本就是HEAD^，上上一个版本就是HEAD^^，往上100个版本就是HEAD~100。
* 只要记得版本号，回退之后还可以恢复。（命令行窗口未关或提前保存了git log）
* Git的版本回退速度非常快，因为Git在内部有个指向当前版本的HEAD指针，当你回退版本的时候，Git仅仅是把HEAD从指向当前版本，改为指向上一个版本。
* 让HEAD指向哪个版本号，你就把当前版本定位在哪。
* HEAD指向的版本就是当前版本，因此，Git允许我们在版本的历史之间穿梭，使用命令git reset --hard commit_id。
* 穿梭前，用git log可以查看提交历史，以便确定要回退到哪个版本。
* 要重返未来，用git reflog查看命令历史，以便确定要回到未来的哪个版本。

修改readme.txt，如下所示。

```bash
Git is a distributed version control system.
Git is free software distributed under the GPL.
```
输入以下命令练习。

```bash
# 提交
git add readme.txt
git commit –m “append GPL”
# 查看提交日志
git log
# 保存提交日志
git log > ../log.txt
# 精简显示日志
git log –pretty=oneline
# 回退到上个版本
git reset –hard HEAD^
# 查看提交日志（最新的已经没有了）
git log
# 恢复最新版本（前提：命令行窗口未关）
# 查看最新版本的版本号。假定为: 73bdb9efc29b3ed95567e57e4640418e8e809307
git reset –hard 73bdb9efc
# 如果命令行窗口已关，通过git reflog命令查看历史命令（包含版本号）
git reflog
```

## 工作区和暂存区
* Git区别于其它版本控制器之处在于：Git有暂存区。
* 工作区：在电脑里能看到的目录。
* 版本库：工作区中的隐藏目录.git。
* 版本库中有：暂存区（stage或index），master分支，以及指向master的指针HEAD。
![这里写图片描述](http://img.blog.csdn.net/20160802105724206)
* 提交文件到Git仓库分为2步：git add是把文件修改添加到暂存区；git commit是把暂存区的所有内容提交到当前分支。
* master分支是创建Git版本库时，Git自动创建的。
* 简单理解：需要提交的文件修改通通放到暂存区，然后，一次性提交暂存区的所有修改到当前分支。
	
修改readme.txt，如下所示。

```bash
Git is a distributed version control system.
Git is free software distributed under the GPL.
Git has a mutable index called stage.
```
* 在工作区新增文件LICENSE，内容随便。

执行以下命令，检查状态和添加文件。

```bash
git status
git add readme.txt
git add LICENSE
git status
```
* 暂存区的状态如下图所示。
![这里写图片描述](http://img.blog.csdn.net/20160802105927894)
* git add命令实际上就是把要提交的所有修改放到暂存区（Stage），然后，执行git commit就可以一次性把暂存区的所有修改提交到分支。

```bash
git commit -m “understand how stage works”
git stauts
```
![这里写图片描述](http://img.blog.csdn.net/20160802110018172)
* 暂存区是Git非常重要的概念，弄明白了暂存区，就弄明白了Git的很多操作到底干了什么。

## 管理修改
* Git比其它版本控制系统优秀的地方在于：GTI跟踪并管理修改，而非文件。
* 下面的例子说明了这个过程。

```bash
# 修改readme.txt
git add readme.txt
git status
# 继续修改
git commit -m “git tracks changes”
git status
#说明：第一次修改提交了，第二次修改没有提交
# 检查工作区和版本库里最新版的区别
git diff HEAD -- readme.txt
```
* Git跟踪修改原理：每次修改，如果不add到暂存区，那就不会加入到commit中。

## 撤销修改	
* git checkout -- filename
* git checkout – readme.txt 就是把readme.txt文件在工作区的修改全部撤销。分两种情况：第一种是readme.txt自修改后还没有被放到暂存区，现在，撤销修改就回到和版本库一模一样的状态；第二种是readme.txt已经添加到暂存区后，又作了修改，现在，撤销修改就回到添加到暂存区后的状态。总之，就是让这个文件回到最近一次git commit或git add时的状态。
* 如果想删除已经git add，但是没有git commit的内容。就使用git reset HEAD readme.txt命令。git reset HEAD filename 可以把暂存的修改撤销掉，重新放回工作区。
* git reset命令既可以回退版本，也可以把暂存区的修改回退到工作区。
* 如果已经git commit，但是没有把自己的本地库推送到远程。可以通过git reset实现版本回退。
* 如果已经推送到远程，就没有办法删除了。

## 删除文件
* 真的删除文件

```bash
rm test.txt
git rm test.txt
git commit -m “remove test.txt”
```
* 误删文件，恢复到最新版

```bash
rm test.txt
# 发现删错了，恢复
git checkout -- tes.txt
```
* 命令git rm用于删除一个文件。如果一个文件已经被提交到版本库，那么你永远不用担心误删，但是要小心，你只能恢复文件到最新版本，你会丢失最近一次提交后你修改的内容。

# 四、远程仓库
* Git杀手级功能：远程仓库。Git是分布式版本控制系统，同一个Git仓库，可以分布到不同的机器上。
* 最早，肯定只有一台机器有一个原始版本库，此后，别的机器可以“克隆”这个原始版本库，而且每台机器的版本库其实都是一样的，并没有主次之分。
* 实际情况：找一台电脑充当服务器的角色，每天24小时开机，其他每个人都从这个“服务器”仓库克隆一份到自己的电脑上，并且各自把各自的提交推送到服务器仓库里，也从服务器仓库中拉取别人的提交。
* Github，提供了Git仓库托管服务。国内有类似的coding。
* 本地Git仓库和GitHub仓库之间的传输是通过SSH加密的。
* 配置：
	* 第1步：创建SSH Key。
	
```bash
# 创建SSH Key
ssh-keygen -t rsa
ssh-keygen -t rsa -C “youremail@example.com” 
#~/.ssh目录下生成两个文件：id_rsa（私匙）和id_rsa.pub（公匙）
```
    
	* 第2步：登陆GitHub，打开“Account settings”，“SSH Keys”页面；然后，点“Bew SSH Key”，填上任意Title，在Key文本框里粘贴id_rsa.pub文件的内容

* 为什么GitHub需要SSH Key呢？因为GitHub需要识别出你推送的提交确实是你推送的，而不是别人冒充的。
* Github上的免费托管的Git仓库是公开的，别人可以看到。国内的coding.net可以免费托管私有仓库。

## 添加远程仓库
* 在Github上创建一个远程库，可以克隆这个库，或者和本地的仓库进行合并。
	* 在Github上创建远程库learngit；
	* 上传自己的SSH公匙；
	* 关联本地仓库和远程仓库。
	* 推送代码
    
```bash
#关联远程库
git remote add origin git@github.com:xuezhisd/learngit.git
#关联后，远程库的名字就是origin
# 推送本地库内容到远程库上
git push -u origin master
# -u把本地的master分支和远程的master分支关联起来，简化以后推送命令。
# 以后使用下面命令推送
git push orgin master
```

* 本地库的内容推送到远程，用git push命令。

## 从远程库克隆
* 要克隆一个仓库，首先必须知道仓库的地址，然后使用git clone命令克隆。
Git支持多种协议，包括https，但通过ssh支持的原生git协议速度最快。

```bash
git clone git@github.com:xuezhisd/learngit.git
git clone https://github.com/xuezhisd/learngit.git
cd learngit
ls
```

## 分支管理
* 分支==平行宇宙
* 通过创建自己的分支，既可以随时提交，又能避免丢失每天进度的风险。直到开发完成后，在一次性合并到原来的分支上。既安全，有不影响别人工作。
* Git分支优点：无论创建、切换和删除分支，1秒完成。

## 创建于合并分支
* 每次提交串起来，就是一个分支。Git中的master分支是主分支。HEAD严格来说不是指向提交，而是指向master，master才是指向提交的，所以，HEAD指向的就是当前分支。
* Git用master指向最新的提交，再用HEAD指向master，就能确定当前分支，以及当前分支的提交点：
![这里写图片描述](http://img.blog.csdn.net/20160802110930107)
* 创建dev分支，并把HEAD指向dev：
![这里写图片描述](http://img.blog.csdn.net/20160802110957404)
* dev上的工作完成了，就可以把dev合并到master上：
![这里写图片描述](http://img.blog.csdn.net/20160802111026992)
* 合并完分支后，可以删除dev分支。删除dev分支就是把dev指针给删掉：
![这里写图片描述](http://img.blog.csdn.net/20160802111056218)

```bash
# 创建dev分支，然后切换到dev分支
# -b表示创建并切换分支
git checkout -b dev
# 查看当前分支
git branch
# 修改readme.txt
# 提交
git add readme.txt
git commit -m “branch test”
# 切回master分支
git checkout master
# 将dev分支的工作合并到master分支
# 注意：当前在master分支中
git merge dev
# 删除dev分支
git branch -d dev
# 查看剩余分支
git branch
```
* git merge命令用于合并指定分支到当前分支。


## 解决冲突
* 当Git无法自动合并分支时，就必须首先解决冲突。解决冲突后，再提交，合并完成。
* 用git log --graph命令可以看到分支合并图。

```bash
# 添加分支
git checkout -b feature1
#readme.txt最后一行添加
#Creating a new branch is quick AND simple
#提交
git add readme.txt
git commit -m “AND simple”
#切回master
git checkout master
#readme.txt最后一行添加
#Creating a new branch is quick & simple.
gti add readme.txt
git commit -m “& simple”
# 此时，master分支和feature1分支各自有了新的提交。此时，快速合并无法执行
# 尝试合并
git merge feature1
git status
# 查看冲突内容，修改为
# Creating a new branch is quick and simple.
# 重新提交
git add readme.txt
git commit -m “conflict fixed”
# 查看分支合并情况
git log --graph --pretty-oneline --abbrev-commit
# 删除feature1分支
git branch -d feature1 
```

## 分支管理策略
* 分支管理的几个基本原则：
	* master分支应该是稳定的，仅用于发布新版本，不用来干活；
	* 平时大家都在dev分支上干活。发布新版本时，再合并到master分支上。
* 强制禁用Fast forward模式，Git就会在merge时生成一个新的commit，这样，从分支历史上就可以看出分支信息。

```bash
# 创建并切换dev分支
git checkout -b dev
# 随便修改readme.txt文件
# 提交
git add readme.txt
git commit -m “add merge”
# 切回master分支
# 合并dev分支
# --no-ff参数：表示禁用Fast forward
git merge --no-ff -m “merge with no-ff” dev
# 查看分支历史
git log --graph --pretty=oneline --abbrev-commit
```

* Git分支十分强大，在团队开发中应该充分应用。
* 合并分支时，加上--no-ff参数就可以用普通模式合并，合并后的历史有分支，能看出来曾经做过合并，而fast forward合并就看不出来曾经做过合并。

## Bug分支
* 鉴于Git的分支如此强大，每个bug都可以通过一个新的临时分支来修复，修复后，合并分支，然后将临时分支删除。
* 先将正在工作现场“储藏”起来，等修复完Bug之后，再恢复现场，继续工作。
* git stash 把当前工作现场“储藏”起来，等以后恢复现场后继续工作。

```bash
# 保存工作现场
git stash
# 查看工作区，就是干净的，可以放心创建分支修复Bug
# 假定需从master分支上修复，就从master创建临时分支
# 切回master分支
git checkout master
# 创建并切到issue-101分支（Bug分支）
git checkout -b issue-101
# 修改Bug
# 提交
git add readme.txt
git commit -m “fix bug 101”
# 切回master分支，合并
git checkout master
git merge --no-ff -m “merged bug fix 101” issue-101
# 删除Bug分支
git branch -d issue-101
# 切回dev分支
git checkout dev
# 查看装填，此时是干净的
git status
# 查看工作现场（此时工作现场存在）
git stash list
# 恢复现场，并删除stash内容
git stash pop
# 查看工作现场（此时无stash内容了）
git stash list
```

* 修复bug时，我们会通过创建新的bug分支进行修复，然后合并，最后删除；
* 当手头工作没有完成时，先把工作现场git stash一下，然后去修复bug，修复后，再git stash pop，回到工作现场。

## Feature分支
* 每添加一个新功能，最好新建一个feature分支，在上面开发，完成后，合并，最后，删除该feature分支。

```bash
# 为Vulan功能创建并切换分支
git checkout -b feature-vulcan
#开发功能
#开发完毕，提交
git add vulcan.py
git status
git commit -m “add feature vulcan”
# 切回dev分支
git checkout dev
#因某些状况，新功能取消，就地销毁该分支
git branch -D feature-vulcan
```

* 开发一个新feature，最好新建一个分支；
* 如果要丢弃一个没有被合并过的分支，可以通过git branch -D <name>强行删除。


## 多人协作
* 从远程仓库克隆时，Git自动把本地的master分支和远程的master分支对应起来，并且，远程仓库的默认名称是origin。
* **推送分支**

```bash
# 查看远程库信息
git remote
# 查看更详细的远程库信息
git remote -v
# 推送master分支到远程库master
git push origin master
# 推送dev分支到远程库dev
git push origin dev
```

* **抓取分支**

```bash
# 克隆远程库
git clone git@github.com:xuezhisd/learngit.git
# 从远程库克隆时，默认只有master分支
# 查看分支
git branch
#在dev分支上开发，就必须创建远程origin的dev分支到本地
git checkout -b dev origin/dev
# 多人协作时，可能同时修改了dev分支中的同一文件，这时就会推送失败
# 此时需要先抓取分支
# 地dev分支与远程origin/dev分支的链接
git branch --set-upstream dev origin/dev
git pull
# 有冲突，需要手动解决，再push
```

# 五、标签管理
* 发布一个版本时，我们通常先在版本库中打一个标签（tag），这样，就唯一确定了打标签时刻的版本。标签也是版本库的一个快照。
* Git的标签虽然是版本库的快照，但其实它就是指向某个commit的指针（跟分支很像，但是分支可以移动，标签不能移动）。
* tag就是一个让人容易记住的有意义的名字，它跟某个commit绑在一起。
* tag如下图所示：
![这里写图片描述](http://img.blog.csdn.net/20160802112427859)

## 创建标签
* 首先，切到需要打标签的分支上：

```bash
# 查看分支情况
git branch
# 切换
git checkout master
```

* 然后，使用命令`git tag name`打标签：

```bash
git tag v1.0
```
* 查看所有的标签：

```bash
git tag
```
* 默认标签是打在最新提交的commit上。如果想给历史commit打标签，需要先找到它的`commit id`，然后打标签：

```bash
# 查找标签
git log --pretty=oneline -abbrev-commit
# 为历史提交打标签
# 加入想打标签的commit id是6224937
git tag v0.9 62249
# 查看所有标签
# 注：标签按字母顺序列出
git tag
# 查看标签信息
git show v0.9
```
* 创建带注释的标签：

```bash
# 创建带注释的标签
git tag -a v0.1 -m "version 0.1 released" 3628164
# 查看标签信息
git show v0.1
```
* 使用PGP私匙签名打标签：

```bash
# -m 用私匙签名一个标签
fec145a是commit id
git tag -s -m "signed version 0.2 released" fec145a
# 查看PGP签名信息
git show v0.2
```

## 操作标签
* 标签打错了，删除标签：

```bash
git tag -d v0.1
```
* 创建的标签只存储在本地，不会自动推送到远程。
* 将某个标签推送到远程：

```bash
# 推送v1.0标签
git push origin v1.0
# 推送所有标签（为上传的）
git push origin --tags
```
* 删除远程标签

```bash
# 先删除本地标签
git tag -d v0.9
# 再从远程删除
git push origin :refs/tags/v0.9
```

# 六、参考
* [Git教程——廖雪峰](http://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000)

