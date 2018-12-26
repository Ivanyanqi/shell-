#!/bin/bash
#read 它用于从键盘或标准输入中读取文本
#不使用回车键来读取 n 个字符
#read命令提供了一种不需要按回车键就停止
#从输入中读取n个字符并存入变量variable_name
#read -n number_of_chars variable_name

read -n 2 var
echo $var

#用无回显的方式读取密码
read -s var1
echo $var1

#显示提示信息
read -p "enter input : " var2

#在特定时限内读取输入
#read -t timeout var
#在2秒内将键入的字符串读入变量var
read -t 2 var3

#用特定的定界符作为输入行的结束
# read -d delim_char var
read -d ":" var
