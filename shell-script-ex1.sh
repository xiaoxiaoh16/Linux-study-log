#/*************************************************************************
#    > File Name: shell-script-1.sh
#    > Author: xiaoxiaoh
#    > Mail: xiaoxxhao@gmail.com 
#    > Created Time: Thu Apr  6 14:45:46 2017
# ************************************************************************/

# 1、编写一个shell脚本，完成功能：
#	1）显示文字“Waiting for a while….”
#	2）长格式显示当前目录下面的文件和目录，并输出重定向到/home/file.txt文件
#	3）定义一个变量，名为s，初始值“Hello”
#	4）使该变量输出重定向到/home/string.txt文件


#!/bash/sh
 echo "Waitint for a while....."
 ls -l >/Users/Xiaoxiaoh/Documents/WIP/file.txt
 s="Hello"
 echo $s > /Users/Xiaoxiaoh/Documents/WIP/string.txt



