#/*************************************************************************
#    > File Name: shell-script-3.sh
#    > Author: xiaoxiaoh
#    > Mail: xiaoxxhao@gmail.com 
#    > Created Time: Thu Apr  6 14:45:46 2017
# ************************************************************************/
 
# 3、编写一个shell脚本，利用for循环将当前目录下的.c文件移动到指定的目录，并按文件大小显示出移动后指定的目录的内容。

#!/bash/sh
for file in *.c
do
	cp ${file} ${1}
done
#ls ${1} | lS
ls -l $1 | sort -n



