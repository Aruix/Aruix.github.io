---
title: javascript高级程序设计--变量作用域和内存
date: 2017/06/06
tags:
  - javascript高级程序设计
categories:
 - javascript
---
javascript变量松散型的本质，使得其变量没有固定的数据类型。变量的值和变量的数据类型会在脚本的生命周期内改变。
## 一、基本类型和引用类型
ecmascript的变量两种不同的数据类型的值：基本类型和引用类型。
ecmascript的数据类型有undefined、null、boolean、number、string、object六种类型。
<!-- more -->
### 1.1.基本类型和引用类型
基本类型值指的是简单的数据段，它包括undefined、boolean、null、number、string这5个数据类型。
基本类型是按值访问的，如下：
``` bash
var number = 1;
var number2 = number2;
number2 = 2;
console.log(number);//1
console.log(number2);//2
```
引用类型的值是按引用访问的，如下：
``` bash
var obj = {
    x:1
}
var obj2 = obj;
obj2.x = 3;
console.log(obj.x);//3
```
其中有一个重要的点，函数的参数都是按值传递的。所以一定要分清，访问变量有按值和按引用两种方式，但是参数只能按值传递。
虽然引用类型的变量也是按值传递的，但是还是会让人产生迷惑。
如下面的代码：
```bash
var per = {
    x : 1
}
function setX(obj){
    obj.x = 2;
}
setX(per);
console.log(per.x);//2
```
既然引用类型的变量在函数中也是按值传递的，那么为什么会改变外部的per对象的值呢？
其实即使是按值传递，但是函数中的obj和外部的per都是指向同一个对象。obj也是按引用来访问同一个对象。出现这种情况会让人产生对象在函数中是按引用来传值 的错觉。为了证明对象是按值传递的，可以看一下下面的代码。
```bash
var per = {
    x : 1
}
function setX(obj){
    obj.x = 2;
    obj = new Object();
    obj.x = 3;
}
setX(per);
console.log(per.x);//2
```
如果per是按引用传值，那么 per 就会自动被修改为指向其 x 属性值为 3 的新对象。

检测数据类型的方法有typeof，但是如果变量的值是object或是null时，返回的结果都是object。
```bash
var s = "this is string";
var b = true;
var i = 22;
var u;
var n = null;
var o = new Object();
alert(typeof s); //string
alert(typeof i); //number
alert(typeof b); //boolean
alert(typeof u); //undefined
alert(typeof n); //object
alert(typeof o); //object
```
ecmascript提供了instanceof操作符，其语法如下：
```bash
alert(person instanceof Object); // 变量 person 是 Object 吗？
alert(colors instanceof Array); // 变量 colors 是 Array 吗？
alert(pattern instanceof RegExp); // 变量 pattern 是 RegExp 吗？
```

### 1.2.
