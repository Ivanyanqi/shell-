#!/bin/bash
#if条件  if condition;then commands;fi;
#if else if condition;then commands;else if condition ;then commands ;else commands ;fi

#[ condition ] && action; # 如果condition为真，则执行action
#[ condition ] || action; # 如果condition为假，则执行action

#算数比较
#条件通常被放置在封闭的中括号内。一定要注意在[或]与操作数之间有一个空格。如果
 #忘记了这个空格，脚本就会报错
 #例如 [$var -eq 0 ] or [ $var -eq 0] or [$var -eq 0] 都会报错
 #正确如下
 var=0
 if [ $var -eq 0 ] 
 then   
    echo $var
fi

#操作符
# -eq 等于 -ne 不等于  -gt 大于  -lt 小于 -ge 大于等于 -le 小于等于
#可以结合多个条件
#[ $var1 -ne 0 -a $var2 -gt 2 ] #使用逻辑与-a
#[ $var1 -ne 0 -a $var2 -gt 2 ] #使用逻辑与-a

#文件系统相关测试
#[ -f $file-var ]  如果给定的变量包含正常的文件路径或文件名，则返回真
#[ -x $var ] 如果给定的变量包含的文件可执行，则返回真
#[ -d $var ]如果给定的变量包含的是目录，则返回真
#[ -e $var ]如果文件给定的变量包含的文件存在，则返回真
#[ -c $var ] 如果给定的变量包含的是一个字符设备文件的路径，则返回真
#[ -b $var ]如果给定的变量包含的是一个块设备文件的路径，则返回真
#[ -w $var ]如果给定的变量包含的文件可写，则返回真
#[ -r $var ]如果给定的变量包含的文件可读，则返回真
#[ -L $var ]如果给定的变量包含的是一个符号链接，则返回真
#例子 
filePath="/etc/passwd"
if [ -e $filePath ]
then    
    echo file exists
else
    echo file not exists
fi

#字符串比较
#使用字符串比较时，最好用双中括号，因为有时候采用单个中括号会产生错误，所以最 好避开它们
#[[ $str1 = $str2 ]]:当str1等于str2时，返回真。也就是说，str1和str2包含 的文本是一模一样的
#[[ $str1 == $str2 ]]:这是检查字符串是否相等的另一种写法
#[[ $str1 != $str2 ]]:如果str1和str2不相同，则返回真
#[[ $str1 > $str2 ]]:如果str1的字母序比str2大，则返回真
#[[ -z $str1 ]]:如果str1包含的是空字符串(“” 不是空白字符串)，则返回真
#[[ -n $str1 ]]:如果str1包含的是非空字符串，则返回真
#意在 = 前后各有一个空格。如果忘记加空格，那就不是比较关系了，而变成了赋值语句
#使用逻辑运算符 && 和 || 能够很容易地将多个条件组合起来
# if [[ -n $str1 ]] && [[ -z $str2 ]] ;
#     then
# commands; fi

#例子
str1="not empty"
str2=""
if [[ -n $str1 ]] && [[ -z $str2 ]]
then 
    echo str1 is nonempty and str2 is empty string
fi

# test 命令可以执行条件检测。用test 可以避免使用过多的括号。之前讲过的[]中的测试条件
# 通用可以用于test命令,字符中比较不能用test

#例如
if  test $var -eq 0 ; then echo "True"; fi
if test $var -eq 0 ;then echo $var;fi

