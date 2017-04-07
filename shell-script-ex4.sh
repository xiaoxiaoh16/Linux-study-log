#/*************************************************************************
#    > File Name: shell-script-4.sh
#    > Author: xiaoxiaoh
#    > Mail: xiaoxxhao@gmail.com 
#    > Created Time: Thu Apr  6 14:45:46 2017
# ************************************************************************/
 
# 4、利用数组形式存放10个城市的名字，然后利用for循环把它们打印出来。

#!/bash/sh
cities=(NewYork NewJersey Chicago WashingtonDC Boston SanFrancisco Miami Houston LosAngeles Austin )
for city in ${cities[*]}
do
	echo $city
done

