#!/bin/bash
#有两种运行脚本的方式。一种是将脚本作为bash的命令行参数，另一种是授予脚本执行权限，将其变为可执行文件
#如果将脚本作为bash的命令行参数来运行，那么就用不着脚本中的shebang了
#可执行方式执行 内核会读取脚本的首行并注意到shebang为#!/bin/bash。它识别出/bin/bash并在内部像这样执行该脚本 /bin/bash *.sh
#每个命令或是命令序列是通过使用分号或换行符来分隔的

#默认情况下，echo在每次调用后会添加换行符
echo 'welcome to bash !'
echo welcome to bash
echo "welcome to bash !"
#使用没有引号的echo时，不能在所显示的文本中使用分号,分号是界定符
#echo welcome to bash ; hello

#printf 和c语言中的printf用法一样，没有换行符
printf "hello world\n"
printf  "%-5s %-10s %-4s\n" No Name  Mark
printf  "%-5s %-10s %-4.2f\n" 1 Sarath 80.3456
printf  "%-5s %-10s %-4.2f\n" 2 James 90.9989
printf  "%-5s %-10s %-4.2f\n" 3 Jeff 77.564

#%s、%c、%d和%f都是格式替换符(format substitution character)，其所对应的参数可以置于带引号的格式字符串之后
#%-5s指明了一个格式为左对齐且宽度为5的字符串替换(-表示左对齐)。如果不用-指定对 齐方式，字符串就采用右对齐形式。
#宽度指定了保留给某个变量的字符数。对Name而言，保留 宽度是10。因此，任何Name字段的内容都会被显示在10字符宽的保留区域内，
#如果内容不足10 个字符，余下的则以空格符填充
#%-4.2f，其中.2指定保留2个小数位

#打印彩色终端的输出
#重置=0，黑色=30，红色=31，绿色=32，黄色=33，蓝 色=34，洋红=35，青色=36，白色=37
echo -e "\e[1;31m This is red text \e[0m"
#\e[1;31将颜色设为红色，\e[0m将颜色重新置回。只需要将31替换成想要的颜色码就可以了
#要设置彩色背景，经常使用的颜色码是:重置=0，黑色=40，红色=41，绿色=42，黄色=43，蓝色=44，洋红=45，青色=46，白色=47
echo -e "\e[1;42m Green Background \e[0m"
