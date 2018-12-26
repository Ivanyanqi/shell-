#!/bin/bash
#IFS是存储定界符的环境变量。它是当前shell环境使用的默认定界字符串
#例子
data="name,sex,rollno,location"
oldIFS=$IFS
IFS=,
for item in $data
do
    echo $item
done
IFS=$oldIFS

#IFS的默认值为空白字符(换行符、制表符或者空格)
#当IFS被设置为逗号时，shell将逗号视为一个定界符，因此变量$item在每次迭代中读取由逗号分隔的子串作为变量值

#以按照下面的方法巧妙地利用IFS打印出用户以及他们默认的shell
line="root:x:0:0:root:/root:/bin/bash"
oldIFS=$IFS
IFS=:
count=0
for item in $line
do 
    [ $count -eq 0 ] && user=$item
    [ $count -eq 6 ] && shell=$item
    let count++
done
IFS=$oldIFS
echo "$user's shell is $shell "
