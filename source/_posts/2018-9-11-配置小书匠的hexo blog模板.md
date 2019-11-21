---
title: 2018-9-11-配置小书匠的hexo blog模板
tags:
  - 小书匠
  - hexo
  - blog
categories:
  - blog
comments: true
updated: false
author: 张学志
grammar_cjkRuby: true
abbrlink: 55b4
date: 2018-09-02 20:56:30
---

> 本文描述了：**如何配置小书匠的模板，适用于hexo blog。**
<!-- more -->


## 模板内容

* 按照以下填写模板，即可。

```

---
title: <% print((new Date()).getFullYear().toString()+ '-'+ ((new Date()).getMonth() + 1).toString() + '-'+ (new Date()).getDate().toString()); %>-未命名
tags: 
 - 新建
categories: 
 - 未分类
comments: true
updated: false
author: 张学志
date: <% print((new Date()).getFullYear().toString()+ '-'+ ((new Date()).getMonth() + 1).toString() + '-'+ (new Date()).getDay().toString() + ' ' + (new Date()).getHours().toString() + ':' + (new Date()).getMinutes().toString() + ':' + (new Date()).getSeconds().toString()); %>
grammar_cjkRuby: true
---

> 本文描述了：
<!-- more -->

```

* 更新不保存？