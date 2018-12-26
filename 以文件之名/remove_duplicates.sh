#!/bin/bash
#文件名：remove_duplicates.sh
#用途:查找并删除重复文件，每一个文件只保留一份

#ls -lS对当前目录下的所有文件按照文件大小进行排序，并列出文件的详细信息
#--time-style=long-iso 时间的格式
#awk读取 ls -lS的输出，对行列进行比较，找出重复文件
#我们将文件依据大小排序并列出，这样大小接近的文件就会排列在一起。
#识别大小相同 的文件是我们查找重复文件的第一步
#接下来，计算这些文件的校验和。如果校验和相 同，那么这些文件就是重复文件，将被删除
#在从文件中读取文本行之前，首先要执行awk的BEGIN{}语句块
#读取文本行的工作在{} 语句块中进行，读取并处理完所有的行之后，执行END{}语句块
#第1行输出告诉我们文件数量，这个信息在本例中没什么用处。
#我们用getline读取第1行，然后丢弃。
#由于需要对每一行及其下一行来比对文件大小，因此用getline读取长文件列表的第一行，并存储文件名和大小(它们分别是第8列和第5列)。
#这样我们就先得到了一行。接下来，awk进入{}语句块(在这个语句块中读取余下的文本行)，读取到的每一行文本都会执行该语句块。
#它将当前行中读取到的文件大小与之前存储在变量size中的值进行比较。
#如果相等，那就意味着两个文件至少在大小上是相同的，随后再用md5sum执行进一步的检查
#我们在给出的解决方法中使用了一些技巧
#在awk中，外部命令的输出可以用下面的方法读取 "cmd"| getline
#随后就可以在$0中获取命令的输出，在$1,$2,...$n中获取命令输出中的每一列。
#我们将文件的md5sum保存在变量csum1和csum2中。变量name1和name2保存文件列表中位置连续的文件名。
#如果两个文件的校验和相同，那它们肯定是重复文件，其文件名会被打印出来
ls -lS --time-style=long-iso | awk 'BEGIN {
    getline;getline;
    name1=$8;size=$5;
}
{
    name2=$8;
    if(size==$5)
    {
        "md5sum "name1 | getline; csum1=$1;
        "md5sum "name2 | getline; csum2=$1;
        if(csum1==csum2)
        {
            print name1 ; print name2
        } 
    };
    size=$5;name1=name2;
}' | sort -u > duplicate_files

#我们需要从每组重复文件中找出一个文件，这样就可以删除其他副本了。
#计算重复文件的 md5sum，从每一组重复文件中打印出其中一个。
#这是通过-w 32比较每一行的md5sum(md5sum输出中的前32个字符，md5sum的输出通常由32个字符的散列值和文件名组成)，
#然后找出那些不相同的行。这样，每组重复文件中的一个采样就被写入duplicate_sample
cat duplicate_files | xargs -I {} md5sum {} |sort |uniq -w 32 | awk '{print "^"$2"$"}'|sort -u > duplicate_sample
echo "Removing...."
#现在需要将duplicate_files中列出的、且未包含在duplicate_sample之内的全部文件删除。
#这些文件由comm命令负责打印出来。我们可以使用差集操作来实现
comm duplicate_files duplicate_sample -2 -3 |tee /dev/stderr | xargs rm 
echo "Removed duplicates files successfully."

#tee命令在这里有一个妙用:它在将文件名传递给rm命令的同时，也起到了print的作用。 
#tee将来自stdin的行写入文件，同时将其发送到stdout。我们也可以将文本重定向到stderr 来实现终端打印功能。
#/dev/stderr是对应于stderr(标准错误)的设备。通过重定向到stderr 设备文件，来自stdin的文本将会以标准错误的形式出现在终端中

