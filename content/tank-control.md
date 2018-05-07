---
categories:
- Blog
date: 2016-11-08T21:56:41+08:00
draft: false
slug: ""
title: Tank Control
---

## 组件

1. 带电机的坦克平台 * 1
1. 电调             * 2
1. 分电板           * 1
1. CC3D             * 1
1. Devo10           * 1
1. 接收器           * 1

![RC & Tank](/images/2016/11/tank-control-1.jpg)

## 接线

1. 供电线接头全部换成T插，以免接错。
2. 供电方用母头，防止短路。
3. 电机和电调导线换香蕉头。

接线方式：

```
电源 -> 分电板 -> 电调 -> 电机
     -> CC3D -> 接收器
```

接收器与CC3D之间PWM的接法参考[CC3D文档](https://librepilot.atlassian.net/wiki/display/LPDOC/CC+Hardware+Configuration)

![Tank Internal](/images/2016/11/tank-control-2.jpg)


## 遥控器绑定接收器

不同的接收器绑定方式略有出入，这边就我知道的大致说下。

先把遥控器的固件刷成[Deviation的固件](http://www.deviationtx.com/)。

接下来打开遥控器，选则接收器对应的protocol。

然后根据接收器上的图示，把跳线接在BIND上。

最后在遥控器上选择bind，等待自动完成就可以了。


## 遥控器配置

主要是配置几个通道的MIX，要想使用三档开关的必须手动配置，具体多多试验就好了。


## 校准CC3D

将CC3D通过USB连接电脑，打开LibrePilot。

主要需要配置的是 Vehicle，Input 和 Output。

注意：Input -> Flight Mode Switch Settings下可以配置是否开启Stabilization，默认是开启的。
