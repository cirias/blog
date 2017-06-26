+++
categories = ["Blog"]
date = "2017-06-12T20:25:06+08:00"
draft = true
slug = ""
title = "digital video notes"

+++

### 基本概念

视频由一张张图片组成。每张图片由像素组成，每个像素由RGB三种颜色组成，每种颜色需要8个bit。
如果视频每秒有30张图片，宽高分别为1280pixel和720pixel，那么可以计算出每秒视频所需要的bit为
8 * 3 * 1280 * 720 * 30 = 663552000。这就是视频的**码率（bit rate）**，单位为bit/second。

![video](/images/2017/06/video.png)

像这样码率的视频1小时需要278GB，效率太低了，所以需要利用codec来进行压缩。比如，h.264

大家总是把视频container(.mp4/.mkv)和codec(h.264)混淆。在此说明下:

1. codec 负责压缩视频数据。约定了视频的压缩方式
2. container 主要为codec提供metadata，并封装了压缩后的视频数据。约定了数据格式。

### 压缩方式

大致来说视频的压缩方式有以下几个方面组成。

#### 颜色亮度

由于人的眼睛对颜色的敏感度远低于对亮度的敏感度，所以可以用更少的空间来储存颜色信息。

![luminance_vs_color](/images/2017/06/luminance_vs_color.png)

主流的颜色空间是yCbCr，其中y代表亮度，Cb代表色度蓝，Cr代表色度红。

##### Color subsampling

对不同类型的信息按不同的比例做采样。比如，4:2:0的采样方式是，y对所有像素采样，
而Cb只采一半，Cr采另一半。
这种方式看似丢失了许多信息，但其是人眼几乎分辨不出来。
而且直接就压缩了一半的数据，十分简单高效。

![chroma_subsampling_examples](/images/2017/06/chroma_subsampling_examples.jpg)


#### 帧

视频里相邻两帧的内容大多是重复的，为了消除这类冗余，我们把所有帧进行分类：

intra, keyframe 关键帧的完整描述了这一时刻的图片。
predicted 只含有相对于前一帧的变化部分的数据。
bi-predictive 不仅依赖于前一帧，还有相对于后一帧的变化数据。

![frame_types](/images/2017/06/frame_types.png)

#### 预测

变化数据的获取方式也有讲究。这就来介绍一下：

预测的方法分为，时间和空间两个维度。

时间上，每帧被划分成若干小块，然后只保存小块的移动信息。

![original_frames_motion_estimation](/images/2017/06/original_frames_motion_estimation.png)

空间上，把颜色近似的化为一块，然后选择一个方向用相同颜色补满这块区域。
最后和原始数据做差，得到更易于压缩的残留快。

![smw_residual](/images/2017/06/smw_residual.png)


#### 关于h.265的插曲

2015年 Google在开发VP10，Moliza在搞Daala, Cisico在弄Thor，大家都各自在搞自己的开源无版权codec。
这时MEPG LA发布了HEVC(h.265)，收费是之前的h.264的十倍，没过多久又向上调整了价格，取消了年度上限等。
于是大家终于发现事态不对，硬件厂商(Intel, AMD, ARM , Nvidia, Cisco), 内容发布方(Google, Netflix, Amazon),
浏览器厂商(Google, Mozilla)等联合组成了Alliance for Open Media。
一同开发了AV1这套无版权codec, 以及简单的专利许可证。

### 容器

TODO

### Reference

- https://github.com/leandromoreira/digital_video_introduction
