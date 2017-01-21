+++
categories = ["Blog"]
date = "2016-11-11T21:41:51+08:00"
draft = false
slug = ""
title = "Coding Little Talk 0"

+++

## 为什么要写这篇文章？

有时到有人这样说，我想学编程，紧接着就会问应该学哪门语言？
还会听到有人这样问，大数据和编程到底是什么关系？
这篇文章就是尝试解答这类问题的。


## 对程序员的认知有哪些误区？

最多的误区就是把系统管理员当做是程序员。系统管理员在公司里一般被叫做IT或admin。虽然大家一遇到电脑问题都找IT，但其实她的工作内容里完全不需要编程的。所以可以说IT和程序员没啥关系。接下来的话大家要牢记，电脑坏了别找程序员，找IT。

还有一类容易和程序员搞混的就是数据科学家。其实听名字就能分辨出来，数据科学家是做“科学研究”的。她们的工作内容主要是以统计学为工具蓝本，依靠编程将工具实现出来，最后再利用工具对之前的猜测做出结论。所以她们一般是会编程的，但是工作中大多数时间都不在编程，而且并不一定精通。

最后再来谈程序员。这是群完全靠写代码为生的物种，工作中除了写代码之外，还需要负责读代码，调试代码等一堆围绕代码展开的工作。
说到这不得不解释下什么是代码，用一句话的话就是，人类写给计算机的命令。那么由代码组成的程序就是，为了达到某种目的而给机器下达的一连串命令。编程自然就是，撰写一连串命令的过程了。

到这里应该已经对程序员的工作及几个容易混淆的职业有了一定认识了，再往后会更深入介绍下程序员。


## 程序员内部工作有哪些种类？

大家都吃过拿破仑蛋糕吧？互联网应用其实就像它一样，一层叠在一层之上。一张图来画下这块蛋糕：

![computer tech stack](/images/2016/11/computer-tech-stack.png)

图上列出了几个技术领域，基本遵循上依赖下，左依赖右的关系，除了虚线分割的嵌入式系统。它既可以说是独立在外的，又可以说被其他的依赖，理由见下文。


## 这些种类有何不同？

绿色的部分有个统一的名字大家都听过，叫做前端。一般来将把在用户的机器上运行的程序称作前端，把在服务器上运行的程序叫做后端。但是严格来说，只有在讨论互联网应用这样的特定语境下才可以这样说。很容易就能猜到前端决定了一个App的外表，很大程度上决定了用户体验。

黄色的部分就是后端。后端除了需要负责基本的业务逻辑之外，还需要解决大量请求的拥塞问题、安全问题等。所以一个优秀的App前后端缺一不可。

不论是前端还是后端都是依托在操作系统之上的，也就是蓝色的部分，只是具体的操作系统（iOS、Android、macOS、Linux、Windows等）不太一样罢了。

最后谈一下嵌入式系统，这可能是大家最不熟悉的了。路由器的工作就需要一定的嵌入式开发，这就是之前说它被其他程序依赖的原因。除了路由器之外，还有智能手环、智能家电、汽车系统、硬件驱动、以及最近流行的IoT都算是嵌入式开发。再往远就是工业控制系统啦，大家基本接触不到。

最后提下我印象中的程序员数量分布。最多的自然是前端领域，其次是后端，然后是嵌入式，开发操作系统的程序员实在太少了以至于我到目前还没遇到过…

---

至此我非常粗略的介绍了下程序相关的基础内容，其实还有很多没说的，下一篇会谈一谈程序语言。

文中必有不足，若能指点万分感谢。