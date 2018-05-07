---
categories:
- Blog
date: 2016-08-20T09:19:47+08:00
draft: false
slug: ""
title: 正则表达式
---

正则表达式没有统一的标准，各个语言、工具的实现都有差别。
在此主要讨论UNIX环境下一些命令行工具对正则表达式的不同定义。

---

// TODO add information about `Group`

正则基本由Anchors、Character Sets和Modifiers组成的。

- Anchors用来匹配位置，通常室一行中的位置。
- Character Sets匹配一个或多个字符。
- Modifiers匹配之前模式的出现次数。

---

正则主要分两种：

1. Basic
2. Extended

在Basic中，如果要用"<"，">"，"{"，"}"，"("，")"的特殊含义的话，需要在之前加反斜杠。
之所以需要这样，是因为最早的Basic是不支持这些符号的特殊含义的。
后来添加的时候，为了兼容之前的表达式，所以就用反斜杠前缀来表示特殊含义了。


Extended顾名思义是Basic的扩展。上面的这些特殊符号在Extended中是不需要加反斜杠的。
除此之外，Extended还添加了几个Modifier: "?", "+" 等等。

---

UNIX中分别支持不同Regex的程序列表：

| Utility | Regular Expression Type   |
| ------- | ------------------------- |
| vi      | Basic                     |
| sed     | Basic                     |
| grep    | Basic                     |
| csplit  | Basic                     |
| dbx     | Basic                     |
| dbxtool | Basic                     |
| more    | Basic                     |
| ed      | Basic                     |
| expr    | Basic                     |
| lex     | Basic                     |
| pg      | Basic                     |
| nl      | Basic                     |
| rdist   | Basic                     |
| awk     | Extended                  |
| nawk    | Extended                  |
| egrep   | Extended                  |
| EMACS   | EMACS Regular Expressions |
| PERL    | PERL Regular Expressions  |

---

注：

- 用来指示单词开始和结束的Anchors "<" ">" 已经很少见了，现在主要由PERL Regex中的"\b"替代。
