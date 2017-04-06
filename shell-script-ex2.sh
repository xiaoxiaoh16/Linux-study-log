#/*************************************************************************
#    > File Name: shell-script-1.sh
#    > Author: xiaoxiaoh
#    > Mail: xiaoxxhao@gmail.com 
#    > Created Time: Thu Apr  6 14:45:46 2017
# ************************************************************************/

# 2、编写一个shell脚本，它把第二个位置参数及其以后的各个参数指定的文件复制到第一个位置参数指定的目录中。

#!/bash/sh
 dir=$1
 shift
 while [ $1 ]
 do 
 	file=$1
	cp $1 $dir
shift
done
ls $dir


