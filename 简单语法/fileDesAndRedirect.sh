#!/bin/bash
#文件描述符以及重定向
#文件描述符是与文件输入、输出相关联的整数
#它们用来跟踪已打开的文件。最常见的文件 描述符是stdin、stdout和stderr。
#我们甚至可以将某个文件描述符的内容重定向到另一个文 件描述符中。
#下面给出一些对文件描述符进行操作和重定向的例子
# 0 - stdin(标准输入) 1-stdout(标准输出) 2 - stderr（标准错误）
#将输出文本重定向保存到另一文件中
echo "this is a simple text 1" > temp.txt
#这种方法通过截断文件的方式，将输出文本存储到文件temp.txt中，
#也就是说在把 echo命令的输出写入文件之前，temp.txt中的内容首先会被清空
#追加写
echo "this is a simple text 1" >> temp.txt;echo "this is a simple text 2" >> temp.txt
#标准错误以及对他重定向
#成功和不成功的命令
#当一个命令发生错误并退回时，它会返回一个非0的退出状态; 
#而当命令成功完成后，它会返回数字0。
#退出状态可以从特殊变量$?中获得(在命令执行之后立刻运行echo $?，就可以打印出退出状态)
#ls + > out.txt  将stderr文本打印到屏幕上，而不是文件中 (而且因为并没有stdout 的输出，所以out.txt没有内容)
#下面的命令中，我们将stderr重定向到out.txt
#ls + 2>out.txt
#可以将stderr单独重定向到一个文件，将stdout重定向到另一个文件
# command 2>stderr.txt 1>stdout.txt
#还可以利用下面这个更好的方法将stderr转换成stdout，使得stderr和stdout 都被重定向到同一个文件中
#command 2>&1 out.txt 或者 cmd &> output.txt

#tee 命令 -a追加
#cat a* | tee -a out.txt | cat -n
#tee命令接收到来自stdin的数据。它将stdout的一份副本写入 文件out.txt，
#同时将另一份副本作为后续命令的stdin。命令cat -n将从stdin中接 收到的每一行数据前加上行号并写入stdout:

#当使用重定向操作符时，输出内容不会在终端打印，而是被导向文件。
#重定向操作符默认使 用标准输出。如果想使用特定的文件描述符，你必须将描述符编号置于操作符之前

#将文件重定向到命令,借助重定向，我们可以像使用stdin那样从文件中读取数据:
# cmd < file
#将脚本内部的文本块进行重定向
#在cat<<EOF>log.txt与下一个EOF行之间的所有文本行都会被当做stdin数据
cat<<EOF>log.txt
log file header 
this is log file
EOF

#自定义文件描述符
#文件描述符是一种用于访问文件的抽象指示器(abstract indicator)。存取文件离不开被称为“文件描述符”的特殊数字
#使用exec命令创建自己的文件描述符
# exec 4<log.txt
# cat <&4 

