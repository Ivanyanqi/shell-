#!/bin/bash

count=1
#查重当前目录袭的png和jpg文件
for img in 'find . -iname "*.png" -o -iname "*.jpg" -type f -maxdepth 1' 
do
    new=image-$count.${img##*.}
    echo "Renaming $img to $new"
    mv $img $new
    let count++
done
