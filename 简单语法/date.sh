#!/bin/bash
#在类Unix系统中，日期被存储 成一个整数，
#其大小为自世界标准时间(UTC)11970年1月1日0时0分0秒2起所流逝的秒数
#读取日期
date
#打印纪元时
date +%s
#从给定格式的日期字符串中获取对应的纪元时
#选项--date用于提供日期串作为输入。但我们可以使用任意的日期格式化选项来打 印输出。将日期串作为输入能够用来获知给定的日期是星期几
#date --date "2018年11月22日 星期四 16时37分55秒 CST" +%s
#date --date "Jan 20 2001" +%A

#用格式串结合 + 作为date命令的参数，可以按照你的选择打印出对应格式的日期
date "+%d %B %y"
#设置日期和时间 
#date -s "格式化的日期字符串"

#检查一组命令所花费的时间
start=`date +%s`
#commands
sleep 5  # 睡眠5s，模拟一系列命令操作
end=$(date +%s)
diff=$((end - start))
echo Time taken to execute commands is $diff seconds.