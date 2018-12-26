#!/bin/bash

#在Bash中，每一个变量的值都是字符串。 无论你给变量赋值时有没有使用引号，值都会以字符串的形式存储。
#有一些特殊的变量会被shell 环境和操作系统环境用来存储一些特别的值，这类变量就被称为环境变量

#对于进程来说，其运行时的环境变量可以使用下面的命令 来查看,其中，将PID设置成相关进程的进程ID
#cat /proc/$PID/environ

#假设有一个叫做gedit的应用程序正在运行。我们可以使用pgrep命令获得gedit的进程ID
#pgrep gedit
#cat /proc/12501/environ  | tr '\0' '\n'
#如果你将\0替换成\n，那么就可以将输出重新格式 化，使得每一行显示一组“变量=值”。替换可以使用tr命令来实现

#变量赋值
var=value
#var是变量名，value是赋给变量的值。如果value不包含任何空白字符(例如空格)，
#那么它就不需要使用引号进行引用，否则必须使用单引号或双引号
#注意，var = value不同于var=value。把var=value写成var = value是一个常见的错误， 但前者是赋值操作，后者则是相等操作
echo $var
#或者
echo ${var}
#单引号引用不了变量值
echo 'welcome ${var} ,$var have'
echo "welcome ${var},$var have"

var=12312321312dasd
#获取字符串的长度
echo ${#var}

#识别当前所使用的shell
echo $SHELL 
#或者 
echo $0
#在脚本里，$0取值为脚本名称

#检查是否为超级用户
#UID是一个重要的环境变量，可以用于检查当前脚本是以超级用户还是以普通用户的身份运行的
#中括号和变量之间必须有空格
#root用户的UID是0
if [ $UID -ne 0 ];then
    echo non root user ,please run as root
else
    echo root user
fi

#使用函数添加环境变量
prepend(){ [ -d $2 ] && eval $1=\"$2':'\$$1\" && export $1; }
prepend PATH /usr/local/yanqi/bin
#工作原理
#我们定义了名为prepend()的函数，它首先检查该函数第二个参数所指定的目录是否存在
#如果存在，eval表达式将第一个参数所指定的变量值设置成第二个参数的值加上“:”(路径分隔 符)，随后再跟上首个参数的原始值
#不过，有一点需要留意。在进行添加时，如果变量为空，则会在末尾留下一个“:”。要解决 这个问题，可以将该函数再进行一些修改
prepend() { [ -d "$2" ] && eval $1=\"$2\$\{$1:+':'\$$1\}\" && export $1 ; }
#${parameter:+expression}
#如果parameter有值且不为空，则使用expression的值