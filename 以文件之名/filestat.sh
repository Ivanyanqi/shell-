#!/bin/bash

if [ $# -ne 1 ];
then 
    echo "Usage is $0 basepath"
    exit
fi

path=$1


#在脚本中声明了一个关联数组statarray，这样可以用文件类型作为数组索引，将每种文件 类型的数量存入数组
declare -A statArray

while read line;
do 
    #脚本中的ftype='file -b "$line"'使用file命令获得文件类型信息。选项 -b告诉file命令只打印文件类型(不包括文件名)
    #使用cut -d, -f1，指明以逗号作为定界符，并且只打印第一个字段
    ftype=`file -b "$line" | cut -d, -f1`
    let statArray["$ftype"]++
done < <(find $path -type f)

ehco "=========================File types and counts========================="
for ftype in "${!statArray[@]}"
do 
    echo $ftype : ${statArray["$ftype"]}
done


#done<<(find $path –type f –print);是一段很重要的代码
#它的执行逻辑如下
 #while read line;do something;done < filename
 #我们不用filename，而是用find命令的输出
 #<(find $path -type f -print)等同于文件名
 #只不过它用子进程输出来代替文件名
 #注意，第一个<用于输入重定向，第二个<用于将子进程的输出装换成文件名。在两个<之间有一个空格，避免shell将其解释为<<操作符
 #在Bash 3.x及更高的版本中，有一个新操作符<<<，可以让我们将字符串作 为输入文件。
 #利用这个新操作符，可以将loop循环的done语句改写成done <<< "`find $path –type f –print`"
 #${!statarray[@]}用于返回一个数组索引列表