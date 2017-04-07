#/*************************************************************************
#    > File Name: shell-script-ex9.sh
#    > Author: xiaoxiaoh
#    > Mail: xiaoxxhao@gmail.com 
#    > Created Time: Fri Apr  7 11:55:49 2017
# ************************************************************************/

# 设计一个Shell程序，在/userdata目录下建立50个目录，即user1～user50，并设置每个目录的权限，其中其他用户的权限为：读；文件所有者的权限为：读、写、执行；文件所有者所在组的权限为：读、执行

# note
# if [ -f  file ]    如果文件存在
# if [ -d ...   ]    如果目录存在
# if [ -s file  ]    如果文件存在且非空 
# if [ -r file  ]    如果文件存在且可读
# if [ -w file  ]    如果文件存在且可写
# if [ -x file  ]    如果文件存在且可执行   
# if [ -c file  ]    如果文件存在且是字符文件
# if [ -b file  ]    如果文件存在且是块文件

# -rwxr-xr--  

#!/bin/bash
i=1
if [ ! -d /userdata ]
then
	mkdir /userdata
fi
cd /userdata
while [ $i -le 50 ]
do
	mkdir user$i
	chmod 754 user$i
	i=$((i+1))
done

