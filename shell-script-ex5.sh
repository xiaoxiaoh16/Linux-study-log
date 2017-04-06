#/*************************************************************************
#    > File Name: shell-script-ex5.sh
#    > Author: xiaoxiaoh
#    > Mail: xiaoxxhao@gmail.com 
#    > Created Time: Thu Apr  6 16:07:12 2017
# ************************************************************************/

# 求1+2+3+...+100的和

#!/bash/sh
sum=0
for ((i=1; i<=100; i++))
do
	sum=$((sum+i))
done
echo "The sum of 1+2+3+......+100 is" $sum
