#!/bin/bahs
PIDARR=()
for file in find . -type f -name "*.txt" 
do 
    md5sum $file &
    PIDARR+=("$!")
done
wait ${PIDARR[@]}

# Bash的操作符&，它使得shell将命令置于后台并继续执行脚本
#这意味着一旦循 环结束，脚本就会退出，而md5sum命令仍在后台运行
#避免这种情况，我们使用$!来获得进程的PID，在Bash中，$!保存着最近一个后台进程的PID。
#我们将这些PID放入数组，然后使用 wait命令等待这些进程结束