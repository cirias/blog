+++
categories = ["Blog"]
date = "2016-11-08T07:21:35+08:00"
draft = false
slug = ""
title = "React Redux Saga"

+++

## React

Web前端框架，将数据(state)与显示(dom)剥离开，并且显示完全由数据控制的单向控制流。
由于整个过程永远是单向的，所以能够有效地对当前的显示结果作出归因，提高开发效率。

另外，从实现上讲，React自己维护了一套映射DOM的数据结构，每次state变化时，
先比较这套数据结构，再根据其结果重新render发生变化的DOM。

React还提供了命为JSX的语法糖，可以直接再JS代码中编写HTML元素，
从此开发不再需要在JS与HTML之间来回切换了。这样做对样式和业务逻辑由同一人完成的工作是来说是一件好事，
但对那些样式和业务逻辑由不同人分工的情况来讲，编写样式的人还要再学习ReactJSX的写法，提高了学习成本。

还有一点是，React完全采用组件化，所有东西都是由组件构成的。所以React的复用性很高，加之JSX，使得组件完全被打包成一体。

## Redux

当多个Component的DOM都受到某个state影响的时候，而且这些Component又位于不同的层级的时候，state的管理就会变得很复杂。

Flux就是为了解决这个问题而提出的，它强化了数据的单向流动，每个state变化必须统一在一个地方完成。
用户或网络产生的各种事件首先会被转化成action，然后在修改state的地方分别处理不同的action，并完成对state的修改，
最终state的变化通过React反应到DOM上，完成一次循环。

Redux可以说是对Flux的一种实现。

它把整个前端的所有状态储存在一个数据结构中，每个Component根据自己的需要从中读取相应的状态，
但对于Component而言这些状态完全是只读的，一般在React里会通过props传递给Component。

在Redux中，action会单独放在一块，同样通过props传递给component调用。专门处理action的地方叫做reducer，
需要在前端初始化的时候注册到Redux的控制器上。

在这不得不提的是，开发过程中充满了tradeoff，你所做的每个决定都是有成本的。使用Redux的好处是代码更容易扩展和维护，
成本就是程序变得更复杂。所以大多数情况下能不用Redux就不用，只有当你面临迫切问题的时候再去用它就好了。

## Saga 

之前提到的情况都是假设程序同步运行的，如果要处理异步的情况，可以利用Saga。
Saga是Redux的中间件，也就是说它存在于action于reducer之间。

(我还没想清楚用Saga和不用Saga到底有什么实质上的差别，所以这里我先空着)。
