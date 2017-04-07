#/*************************************************************************
#    > File Name: shell-script-ex5.sh
#    > Author: xiaoxiaoh
#    > Mail: xiaoxxhao@gmail.com 
#    > Created Time: Fri Apr  7 15:36:56 2017
# ************************************************************************/

# 设计一个shell程序，添加一个新组为class1，然后添加属于这个组的30个用户，用户名的形式为stdxx，其中xx从01到30。


#!/bin/bash
#groupadd class1
#i=1
#while [ $i -le 30 ]
#do
#	if [ $i -le 9 ]
#	then
#		username=stud0$i
#	else
#		username=stud$i
#	fi
#	i=$((i+1))
#	useradd -g class1 $username
#done


#!/bin/bash
sudo groupadd class1
i=1
while [ $i -le 30 ]
do
	if [ $i -le 9]
	then
		username=stud0$i
	else
		username=stud$i
	fi
	i=$((i+1))
	sudo useradd $username
	sudo mkdir /home/username
	sudo chown -R $username /home/$username
	sudo chgrp -R class1 /home/$username
done
