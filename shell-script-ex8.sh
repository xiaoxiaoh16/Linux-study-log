#/*************************************************************************
#    > File Name: shell-script-ex8.sh
#    > Author: xiaoxiaoh
#    > Mail: xiaoxxhao@gmail.com 
#    > Created Time: Fri Apr  7 10:55:49 2017
# ************************************************************************/

# 编写shell程序，实现自动删除50个账号的功能。账号名为stud1至stud50 

#!/bin/bash
i=1
while [ $i -le 50 ]
do
	if [ -n "cat /etc/passwd |grep stud$i" ]
	then
		userdel -r stud$i
	else
		echo "No user account stud$i"
	i=$(($i+1))
	fi
done

