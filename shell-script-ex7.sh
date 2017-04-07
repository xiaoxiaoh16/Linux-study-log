#/*************************************************************************
#    > File Name: shell-script-ex7.sh
#    > Author: xiaoxiaoh
#    > Mail: xiaoxxhao@gmail.com 
#    > Created Time: Fri Apr  7 10:35:49 2017
# ************************************************************************/

# 用Shell编程，判断一文件是不是字符设备文件，如果是将其拷贝到 /dev 目录下 


# note
# if [ -f  file ]    如果文件存在
# if [ -d ...   ]    如果目录存在
# if [ -s file  ]    如果文件存在且非空 
# if [ -r file  ]    如果文件存在且可读
# if [ -w file  ]    如果文件存在且可写
# if [ -x file  ]    如果文件存在且可执行
# if [ -c file  ]    如果文件存在且是字符文件
# if [ -b file  ]    如果文件存在且是块文件

#!/bin/bash
echo "Please input filename" file
read file
if [ -c $file ]
then 
	cp ${file} /dev
else
	echo "It is not charactor device"
fi
