---
title: javascript中的正则表达式
date: 2017/06/06
thumbnail: https://cdn.viosey.com/img/blog/landscape-hot-air-balloons-mist.jpg
tags:
  - 正则表达式
categories:
 - javascript
---
正则表达式是一个强大的文本处理工具，可以进行强大的模式匹配和文本的检索与替换。
## 一、什么是正则表达式

## 二、如何构建一个正则表达式

在javascript中有两种方法构建正则表达式，分别是通过RegExp对象构建和采用字面量的方式构建

### 2.1.通过javascript提供的RegExp()对象构造

例如：
``` bash
var number = new RegExp("box","ig");
```
第一个参数是需要匹配的字符串(必填)，第二个参数是可选模式修饰符(选填)
其中第二个参数的可选值如下：
i 忽略大小写
g 全局匹配 一般情况匹配到一个节点就停止匹配，改参数是匹配到文本结束
m 多行匹配 如果没有加m只匹配第一行

### 2.2.直接构造的方式

例如：
``` bash
var number = /123/
```
## 三、正则表达式方法

正则表达式是方法有两大类，一是正则对象的正则表达式方法，另外一种是字符串对象的正则表达式方法。

### 3.1.正则对象的正则表达式方法

RegExp有两个方法用来测试正则表达式：test()和exec()

#### 3.1.1.test()方法

test()方法在字符串中查找是否存在指定的正则表达式，若存在则返回true，不存在就返回false。
``` bash
var reg = /box/ig;
var str = "this is box,is you box";
console.log(reg.test(str)); //true
```

#### 3.1.2.exec()

exec()方法在字符串中查找指定的正则表达式，若成功则返回 包含要查找的字符串的相关信息数组，若没有成功则返回null。
``` bash
var reg = /box/ig;
var str = "this is box,is you box";
console.log(reg.exec(str)); 
```
返回的数组如下：
["box",index:8,input:"this is box,is you box"]
其中第1个是正则中的字符串，index是第一次匹配的位置，input是匹配的字符串

### 3.2.字符串对象的正则表达式方法

字符串的正则表达式的方法，主要有match(),replace(),search()和split()

#### 3.2.1.使用match()方法获取匹配数组

match()方法，检索字符串中指定的值，返回一个结果数组。
例如：
``` bash
var str = "1 是 1 ，二是二 ， 3是3";
console.log(str.match(/\d+/g)) // [1,1,3,3]
console.log(str.match(/\d+/)) // ["1",index:0,input:"1 是 1 ，二是二 ， 3是3"]
```
其中 /\d+/g 是全局检索所有的数字，上面的代码把字符串中的数字检索出来，并以数组的形式返回。
而 /\d+/ 是非全局检索，最后所得的结果与 exec() 方法类似。数组中第1个是正则中的字符串，index是第一次匹配的位置，input是匹配的字符串。