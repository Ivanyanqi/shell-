#!/bin/bash
word=$1
grep '^$1$' /usr/share/dict/british-english -q
if [ $? -eq 0 ] 
then 
    echo "$word is a dictionary word";
else 
    echo "$word is not a ditionary word";
fi
#在grep中，^ 标记着单词的开始，$ 标记着单词的结束. -q 禁止产生任何出书

#列出文件中以特定单词起头的所有单词
#look word filepath 或者 grep "^word" filepath,
#在默认情况下，如果没有给出文件参数，look命令会使用默认词典(/usr/share/dict/words) 并返回输出