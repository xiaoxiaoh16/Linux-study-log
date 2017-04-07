#/*************************************************************************
#    > File Name: shell-script-ex6.sh
#    > Author: xiaoxiaoh
#    > Mail: xiaoxxhao@gmail.com 
#    > Created Time: Thu Apr  6 16:07:12 2017
# ************************************************************************/

# 在指定目录下创建四个文件m1.txt，m2.txt，m3.txt，m4.txt，用Shell编程，实现自动创建m1,m2,m3,m4四个目录，并将m1.txt ，m2.txt，m3.txt，m4.txt 四个文件分别拷贝到各自相应的目录下

#!/bin/bash
dir=$1
cd $dir
touch m1.txt m2.txt m3.txt m4.txt
i=1
while [ $i -le 4 ]
do
	mkdir m$i
	cp m$i.txt m$i
	i=$((i+1))
done

