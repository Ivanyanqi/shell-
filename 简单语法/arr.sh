#!/bin/bash
#数组是shell脚本非常重要的组成部分，它借助索引将多个独立的数据存储为一个集合。
#普通 数组只能使用整数作为数组索引。
#Bash也支持关联数组(4.0)，它可以使用字符串作为数组索引。
#在很 多情况下，采用字符串式索引更容易理解，这时候关联数组就派上用场了
#定义一个数组
arr=(1 2 4)
arr[4]=5
echo ${arr[0]}
echo ${arr[3]}  #  没设置arr[3],所以为空
echo ${arr[4]}
index=2
echo ${arr[$index]} #引用变量作为索引值
#打印数组所有值
echo ${arr[*]}
echo ${arr[@]}
#打印数组长度(元素个数，空值不算)
echo ${#arr[*]}
echo ${#arr[@]}

#关联数组借助散列技术，关联数组成为解决很多问题的有力工具
#定义关联数组
#在关联数组中，我们可以用任意的文本作为数组索引。首先，需要使用声明语句将一个变量 名声明为关联数组
declare -A ass_arr
#声明之后，可以用两种方法将元素添加到关联数组中
#利用内嵌“索引-值”列表的方法，提供一个“索引-值”列表
ass_arr=([index1]=val1 [index2]=val2)
#使用独立的“索引-值”进行赋值
ass_arr[index3]=val3
#打印数组内容
echo ${ass_arr[index1]}
#列出数组索引
echo ${ass_arr[*]} #取值
echo ${!ass_arr[*]} #取索引

#我们可以创建一个别名rm，它能够删除原始文件，同时在backup目录中保留副本
#创建别名时，如果已经有同名的别名存在，那么原有的别名设置将被新的设置取代
alias rm='cp $@ ./backup && rm $@'

