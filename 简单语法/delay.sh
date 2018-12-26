#!/bin/bash
#在脚本中生成延时 ,输出 1-20
echo -n count : #-n 不换行输出
count=0
# while true;
# do 
#     if [ $count -lt 20 ];then
#         let count++;
#         echo -n $count
#     else
#         exit 0;
#     fi
# done

#使用tput和sleep从0开始计数到40
tput sc #存储光标位置
while true 
do 
    if [ $count -lt 20 ];then
        let count++;
        sleep 1;
        tput rc  #恢复光标位置
        tput ed  #清除从当前光标位置到行尾之间的所有内容
        echo -n $count #使得旧的count值可以被清除并写入新值
    else 
        exit 0;
    fi
done

