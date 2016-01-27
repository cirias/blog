+++
date = "2016-01-27T20:10:38+08:00"
description = "introduction of ES6 generator feature"
keywords = ["javascript", "es6", "generator"]
isCJKLanguage = true
title = "ES6 Generator"

+++

Generator是ES6新加入的一项特性，一种特殊的函数——可以暂停的函数。它的主要作用是生成一个iterator（迭代器），
用于遍历一组数据。

```js
function* maker() {
  yield 1;
  yield 2;
  yield 3;
}

var it = maker();
console.log(it.next().value);
// 1
console.log(it.next().value);
// 2
console.log(it.next().value);
// 3
console.log(it.next().value);
// undefined
```

我们来一步一步分析上面这段代码。

首先，这个`function*`就是定义generator的关键字，这里定义了一个叫做`maker`的generator。
`var it = maker();`这行调用了maker这个generator，这时maker函数体中的内容其实并没有执行。
直到第一个`it.next()`，这步使得maker的函数体开始执行，直到遇到`yield 1;`。`yield`这个关键字只能用在generator内部，
它的作用是让函数暂停，并把它后面的`1`作为`it.next()`返回的`value`。

第二个`it.next()`，让maker从之前暂停的地方继续向下执行，直到`yield 2;`。同样地，它把`2`返回给`it.next()`
作为`value`。

第三个next也是一样。最后一个next，maker继续往下执行，默认return `undefined`，于是`undefined`就被返回作为`value`。

---
既然`yield`可以暂停，那么我们甚至可以这样：

```js
function* realMaker() {
  var n = 1;
  while (1) {
    yield n++;
  }
}

var it = realMaker();
console.log(it.next().value);
// 1
console.log(it.next().value);
// 2
console.log(it.next().value);
// 3
console.log(it.next().value);
// 4
// ...
```

在上面的代码中`readMaker`的函数体是个死循环，但是没关系，利用`yield`，只有执行`it.next()`才会while循环一次，
不执行next的话，循环就不会继续。这样，我们就完成了一个实数生成器。

---
那么这个`yield`的返回值是什么呢？（所有表达式都有返回值，对不对！）来看下面这段代码：

```js
function* maker() {
  var n = yield 1;
  console.log(n);
}

var it = maker();
console.log(it.next().value);
// 1
console.log(it.next(2).value); //注意：next有参数2
// 2
// undefined
```

其实当`it.next()`被调用的时候，`yield`在对`n`赋值之前就已经暂停了。直到`it.next(2)`被调用，
这时`next`的参数`2`被当作之前`yield`的返回值赋值给了`n`。这段逻辑有点绕，但是很有用，继续往下看。

---
让我再进一步，既然`yield`可以暂停执行，那么能不能用它来代替恶心的`callback`呢？答案是YES。

先给出原本用`callback`的样子：

```js
var fs = require('fs');

fs.readFile(__filename, 'utf8', function (err, data) {
  console.log(data);
});
```

这个端代码会读取自己，并且输出出来。我们希望可以去掉`callback`写成这样：

```js
var fs = require('fs');

var data = fs.readFile(__filename, 'utf8'); // 注意：是readFile而不是readFileSync
console.log(data);
```

上面这段代码显然是不能执行的，这里只是想表达出我们的目标，然后以此为基础开始改造。

```js
var fs = require('fs');

function* main(callback) {
  var data = yield fs.readFile(__filename, 'utf8', callback); // 注意：是readFile而不是readFileSync
  console.log(data);
}
```

首先，我们希望在异步的时候暂停，所以应该在`fs.readFile`前面加上`yield`。然而`yield`只能出现在generator内部，
所以把它们整个放进`main`这个generator里。`callback`还是要的，但是我们不直接从`callback`获取结果。
这个`callback`如果不由我们写，那就在调用`main`的时候作为参数传进来，之后要用到。

接下来，这个`main`要如何被调用呢？不妨假设有个`run`函数，它以generator作为参数
，把`main`传给`run`就使`main`开始执行。
再来看看`run`需要解决哪些问题：

1. 把`fs.readFile`的结果通过`yield`赋值给data
2. 启动`main`

到这里，大家应该明白`run`会是什么样了吧。

```js
function run (fn) {
  let callback = function (err, data) {
    it.next(data);
  };

  let it = fn(callback);
  it.next();
}

run(main);
```

`run`函数里先是实现了`callback`，然后调用`main`生成iterator，执行`it.next()`开始运行`main`的函数体。
在`main`里，代码执行到`yield`就暂停了。当`fs.readFile`完成后，调用`run`里实现的`callback`，
`callback`里再次调用`it.next(data)`，让`main`继续执行，并且把`fs.readFile`的结果`data`赋值给`main`里的`data`。

再把代码完整发下：

```js
// test.js
// > node --harmony_destructuring test.js

'use strict';

function run (fn) {
  let callback = function (err, data) {
    it.next([...arguments]);
  };

  let it = fn(callback);
  it.next();
}

var fs = require('fs');

function* main(callback) {
  let [err, data] = yield fs.readFile(__filename, 'utf8', callback);
  console.log(data);
}

run(main);
```

---
文章先介绍了Generator作为iterator的用法，最后尝试把主要逻辑放入Generator内部，来解决callback的问题，希望大家能有所收获。

全文代码在nodejs 4.0.0以上的环境都应该可以正确执行，我的测试环境是nodejs 5.5.0

__完__
