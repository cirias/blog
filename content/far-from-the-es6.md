+++
date = "2016-03-12T14:52:10+08:00"
description = "使用async generator的方法，及一些感想"
keywords = ["ES7", "babel", "async generator"]
title = "ES7初体验"

+++

有一天，我需要写一个脚本，它的任务是不停地调用一个异步函数，把异步函数返回的一组数据每个单独存放到redis，直到异步函数返回null为止。

```js
function next() {
  return getItems().then(items => {
    if (items === null) return;

    return Promise.all(items.map(saveToRedis)).then(next);
  });
}
```

在上面这段代码中，`getItems`就是那个异步函数。整个逻辑用Promise来写的话，就这样简单。

但是我却突发奇想，既然需要遍历`getItems`返回的结果，为何不写成一个generator呢？
但是generator只能同步传递值，有没有异步的generator呢？

找了一圈之后，还真给我找到了，说明真的存在这样的需求，叫做[Asynchronous Iterators](https://github.com/tc39/proposal-async-iteration)。（在我写这篇文章的时候，它处于stage-1）
找到之后我很是兴奋，急急忙忙看了说明之后，就开始写了。

```js
async function *itemGenerator() {
  while (true) {
    const items = await getItems();

    if (items === null) break;

    for (const item of items) {
      yield item;
    }
  }
}
```

这就是那个async generator啦。它不停地调用`getItems`获取数据，直到遇到null。同时，它每次只返回一个`item`。
然后来看看怎么使用。

```js
async function main() {
  for await (const item of itemGenerator()) {
    await saveToRedis(item);
  }
}
```

根据上面提到的份proposal可以用`for await`关键字来遍历async generator。
但是，我更希望可以这样用:

```js
async function main() {
  await itemGenerator().forEach(saveToRedis);
}
```

然而不幸的是并不行。更不幸的是，之前的`for await`也不行！原因就是，没有实现！！

果然我缺乏经验，看到proposal就心急火燎开始写，都没看清楚实现的情况。仔细看过之后，发现async generator是实现了，通过使用 babel插件，就可以写async generator了。但是`for await`就没能找到实现。唉！于是只能这样用：

```js
async function main() {
  const itemIterator = itemGenerator();

  while (true) {
    const {done, value: item} = await itemIterator.next();

    if (done) break;

    await saveToRedis(item);
  }
}
```

看起来好不优雅哎。这事儿到这里就算告一段落了。

---

最后，总结一下收获：

1. 尝试新特性的时候，一定要看清楚实现情况再动手，免得白忙活。
2. 目前JavaScript增加了不少语法糖，对于我这样没写过可以metaprogramming语言的人来说有点太过眼花撩乱了，在做尝试的时候一定要设定好底线，到一个程度之后，就不要再深入了。这些语法糖看起来很美好，其实不一定能提升很多代码可读性。找到自己的原则是最重要的。

(完)
