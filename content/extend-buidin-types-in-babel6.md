---
date: 2016-03-04T20:59:21+08:00
description: es6自定义错误类型
keywords:
- es6
- babel
- javascript
title: babel6继承内置类型
---

直奔主题，我在使用babel6尝试通过`class ... extend`继承`Error`来实现自定义错误类型的时候遇到了问题。

```js
class CustomError extends Error {
  constructor(message) {
    super(message);
  }
}

const e = new CustomError();

console.log(e instanceof CustomError); // false
```

这结果和预期正好相反。

---

查了资料，有人提供这样的方案：

```js
class ExtendableError extends Error {
  constructor(message) {
    super(message);
    this.name = this.constructor.name;
    this.message = message; 
  }
}    

class MyError extends ExtendableError {
  constructor(m) {   
    super(m);
  }
}

const myerror = new MyError('ll');
console.log(myerror.message);            // ll
console.log(myerror instanceof MyError); // false
console.log(myerror.name);               // Error
```

还是不正确！

---

经过一番搜索之后，终于得知，babel对内置类型的继承一直都是做不到的。
而且，babel5和babel6做不到的方式不一样！
上述方法其实是针对babel5的解决方案，但是myerror下是没有stack属性的。

在babel6的情况下，上述方法就不起作用了。需要通过
[babel-plugin-transform-builtin-extend](https://www.npmjs.com/package/babel-plugin-transform-builtin-extend)
这个插件来解决。
或者，如果用的是node5的话，可以不用`es2015`改用[node5](https://www.npmjs.com/package/babel-preset-node5)
用node5原生的class特性来处理这种情况。

---

下面是我参考的链接：

- http://stackoverflow.com/questions/31089801/extending-error-in-javascript-with-es6-syntax
- http://stackoverflow.com/questions/33870684/why-doesnt-instanceof-work-on-instances-of-error-subclasses-under-babel-node
