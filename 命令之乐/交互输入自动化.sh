
就编写自动化工具或测试工具而言，实现命令的交互输入自动化极其重要。
在很多情况下，我们要同一些以交互方式读取输入的命令打交道

观察实际通过键盘输入的字符，可以将上面的1、Return、hello以及Return转换为以下
字符串: "1\nhello\n"
按下回车键时会发送 \n。通过添加 \n，就可以得到发送给stdin的字符串

执行交互式脚本 bash interactive.sh
自动执行交互式脚本
echo -e "2\nworld\n" | bash interactive.sh

我们用echo -e来生成输入序列，-e表明echo会解释转义序列

expect 命令

用expect实现自动化
expect等待特定的输入提示，通过检查输入提示来发送数据
#!/usr/bin/expect
#文件名: automate_expect.sh 
spawn ./interactive.sh 
expect "Enter number:" 
send "1\n"
expect "Enter name:"
send "hello\n"
expect eof

spawn参数指定需要自动化哪一个命令;
expect参数提供需要等待的消息
send是要发送的消息
expect eof指明命令交互结束
