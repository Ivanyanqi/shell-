#!/bin/bash
#在Bash shell环境中，可以利用let、(( ))和[]执行基本的算术操作。
#而在进行高级操作时， expr和bc这两个工具也会非常有用
#可以用普通的变量赋值方法定义数值，这时，它会被存储为字符串.
#然而，我们可以用一些方法使它能像数字一样进行运算
n1=4
n2=5
# 直接输出 4+5 字符串
n3=$n1+$n2
echo $n3 # 4+5
#let命令可以直接执行基本的算术操作。当使用let时，变量名之前不需要再添加$
let result=n1+n2
#或者 let result=$n1+$n2
echo $result  # 9 
let n1++
let n2--
let n1+=6
let n2-=2
#其他方法
result=$[ n1 + n2 ]
result=$(( $n1 + 5 ))
#expr同样可以用于基本算术操作
#两边有空格，若都没有空格则是字符串拼接
result=`expr 3 + 4`
echo $result  #7
result=$(expr 3+4)
echo $result # 3+4

#以上这些方法只能用于整数运算，而不支持浮点数
#bc是一个用于数学运算的高级工具，这个精密计算器包含了大量的选项。我们可以 借助它执行浮点数运算并应用一些高级函数

#其他参数可以置于要执行的具体操作之前，同时以分号作为定界符，通过stdin传 递给bc
echo "3 * 1.2" | bc

#设置最小精度
#参数scale=2将小数位个数设置为2
echo "scale=2;3/8"|bc   #0.37
echo 'scale=2;3/8'|bc   #0.37
#进制转换
echo "obase=2;100"|bc  #十转二 #1100100
echo "obase=10;ibase=2;1100100"|bc  #二转十 100

#计算平方以及平方根
echo "sqrt(100)" |bc  # 10
echo "10^3"|bc  #1000

