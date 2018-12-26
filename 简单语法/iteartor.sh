#!/bin/bash
#对一系列值进行迭代，循环非常有用，bash提供了多种类型的循环
#for 循环
#for var in list
#do 
#    commands 使用变量$var
#done
#list可以是一个字符串，也可以是一个序列
#我们可以轻松地生成不同的序列
#echo {1..50}能够生成一个从1~50的数字列表
echo {1..50}
#生成字母序列
echo {a..z}
echo {A..Z}
echo {A..z}

#for循环也可以采用C语言中for循环的格式。例如:
##  for((i=0;i<10;i++))
  {
#  commands; #使用变量$i 
#}

#while循环
#  while condition
#  do
#      commands;
#  done
#用true作为循环条件能够产生无限循环。

#在Bash中还可以使用一个特殊的循环until。它会一直执行循环，直到给定的条件为真
x=0;
until [ $x -eq 9 ]; #条件是[$x -eq 9 ] 
do
    let x++; echo $x;
done