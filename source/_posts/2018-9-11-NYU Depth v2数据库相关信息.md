---
title: 2018-9-11-NYU Depth v2数据库相关信息
tags:
  - 论文
categories:
  - 论文
comments: true
updated: false
author: 张学志
date: '2018-9-2 21:10:5'
grammar_cjkRuby: true
abbrlink: c7a7
description: ...
---

## 基本信息

NYU Depth V2

链接

## Indoor Segmentation and Support Inference from RGBD Images
* 贡献：NYU数据集
* 主页：https://cs.nyu.edu/~silberman/projects/indoor_scene_seg_sup.html





## Predicting Depth, Surface Normals and Semantic Labels with a Common Multi-Scale Convolutional Architecture


## Depth Map Prediction from a Single Image using a Multi-Scale Deep Network
* Eigen 论文切分方法
* 使用数据库：NYU Depth V2和KITTI
* 融合全局和局部信息，提高鲁棒性。本文通过coarse net估计全局depth结构，在更大分辨率上refine。
* 贡献：
    * 1. 由粗到细的策略。两个网络，粗网络使用全局特征，估计全局结构；精细网络使用局部特征，refine结果。
    * 2. 提出尺度无关的误差。

* 464个场景，249个作为训练集，215个作为测试集。
* 使用NYU Raw，构建训练集。
* 分辨率下采样1/2。（640x480→320x240）
* 由于RGB图和depth图采样频率不一致，需要做时间同步。（把一个图像对应多个depth的样本删除）。
* 使用相机参数对齐RGB图和depth图。
* 没有深度信息的像素点 mask掉。
* 为了去除窗子，开着的门和光谱引起的无效区域，也mask掉等于最小值和最大值的区域。
* 训练集有120K图像，经过均匀化每个场景的样本量，得到220K图像。1200 * 249=298800。
* 2M 训练coarse net；
* 1.5M 训练fine net；
* batch_size：32
* SGD优化算法；lr=0.001

* Kitti Raw
    * 56个场景，28用于训练，28个用于测试。
    * 每个场景有800张图像；去除汽车静止的图片，避免重复。
    * 左右摄像头数据都使用了，但不做关联。
    * 训练集有20K图像，经过均匀化每个场景的样本量，扩充至40K。

* 使用最近邻上采样，将预测的低分辨率输出 还原到 原始分辨率。

* 切分带标签的数据集
    * train:795
    * test:654
    * https://github.com/janivanecky/Depth-Estimation/tree/master/dataset

* 评价指标如下所示：
![enter description here](https://www.github.com/xuezhisd/xuezhisd.github.io.img/raw/dev/imgs/1536671720648.png)







