## Linux 常用命令
## By 小鱼刺 Email: admin@ncrna.net
1 文件操作{

## 查看
	more file.txt # 分页查看文件
		less -S file.txt # 不换行查看文件
		cat file.txt # 从前向后查看文件
		tac file.txt # 从后向前查看文件

## 创建
		touch file # 如果文件存在，则是更新文件修改的时间戳；如果文件不存在，则创建空文件
		vim file # 用vim创建文件

## 属性
		ls -ltr # 按时间倒序列出所有目录和文件
		pwd # 当前路径
		ls --color=tty # 当前文件列表,后面参数用于显色
		ls -a # 显示所有文件,包括隐藏文件
		dir --color=always # 当前文件列表,后面参数用于显色

## 拷贝/移动
		cp 源文件 目标文件 # 拷贝文件
		cp -r 源路径 目标路径 # 递归拷贝文件
		cp -r -l 源路径 目标路径 # 递归创建文件硬链接，相当于备份
		mv 源文件 目标文件 # 移动文件
		mv 源路径 目标路径 # 移动文件夹

## 格式转换
		dos2unix # windows文本转linux文本
		unix2dos # linux文本转windows文本
		cat m.pl | tr -d '\r' > n.pl # 将windows格式的脚本转换成Linux格式
		
## 校验
		md5sum in.fastq.gz # 计算文件的md5值
		
		sha1sum in.fastq.gz # 计算文件的SHA值
		
## 链接
		ln 源文件 [目标文件] # 创建硬链接，如果不指定目标文件，则目标路径默认为当前路径
		ln -s 源文件 [目标文件] # 创建软链接，如果不指定目标文件，则目标路径默认为当前路径
		ln -s 源路径 [目标路径] # 创建文件夹链接，如果不指定目标文件，则目标路径默认为当前路径
## 注意：ln命令在对文件进行链接时，必须使用绝对路径，若想用相对路径，可以先进入目标路径，再做链接
## 如：ln -s ../genome.fa .  # 将上一个目录里的genome.fa链接到当前目录
		
## 删除：
		rm -i 文件 # 删除前询问
		rm -rf 文件 # 强制删除
		rm -rf 目录名 # 递归强制删除目录及其子目录里的文件夹和文件
		rm 链接 # 删除链接文件，不管链接的是文件还是文件夹，都不要在末尾加"/"，否则删除不掉
		
## 批量删除百万个文件：
		mkdir ./tmp  # 先新建一个文件夹
		rsync --delete-before -a -H -v --progress --stats ./tmp/ ./ncrna/   # 然后使用同步命令删除./ncrna文件夹
# 选项说明：
# –delete-before 接收者在传输之前进行删除操作
# –progress 在传输时显示传输过程
# -a 归档模式，表示以递归方式传输文件，并保持所有文件属性
# -H 保持硬连接的文件
# -v 详细输出模式
# –stats 给出某些文件的传输状态
}

2 压缩与解压{

## 压缩：
	tar zcvf file.tar.gz 文件(夹)路径 # 将文件/文件夹压缩为.tar.gz格式
		tar jcvf file.tar.bz2 文件(夹)路径 # 将文件/文件夹压缩为.tar.bz2格式

##解压：
		unzip file.zip # 解压zip格式
		gzip -d file.gz # 解压gz格式
		tar zxvf file.tar.gz # 解压.tar.gz格式
		tar zxvf file.tar.gz -C 解压路径 # 指定解压路径
		tar jxvf file.tar.bz2 # 解压.tar.bz2格式
		tar jxvf file.tar.bz2 -C 解压路径 # 指定解压路径
## 压缩和解压过程中，若去掉v参数可以提高压缩、解压速度

##查看：
		tar ztvf/ztf file.tar.gz # 查看.tar.gz文件列表
		tar jtvf/jtf file.tar.bz2 # 查看.tar.bz2文件列表
## 查看压缩文件列表中，若有v参数可以查看文件详细信息，类似于ll命令
}

3 文件分割与合并{

## 分割：
	split -b 10m file.tar.gz -d part.tar.gz # 将file.tar.gz按照每份10mb分割，得到的各部分以part.tar.gz+数字命名
		split -l 2 log.txt -d log # 对log.txt按照每两行分割一次，得到的各部分以log+数字命名
## 合并：
		cat file-*.fa > out.fa # 合并多个以file-为前缀的fa文件
		paste -d'\t' a.log b.log > combined.log # 按列合并两个log文档，中间用'\t'分隔
## 合并去冗余：
		cat file-*.log | sort -u > out.log # 先将多个以file-为前缀的log合并，然后排序去冗余 
}

4 抓取文件特定行/列{

## 抓行
	awk 'NR>=10 && NR<=100' log.txt # 抓取第10到100行
		awk 'NR==1000' log.txt # 抓取第1000行
		awk 'NR<=100' log.txt #抓取前100行
		
		sed -n '10,100'p log.txt #抓取第10到100行
		sed -n '1000'p log.txt # 抓取第1000行
		sed -n '1,100' log.txt # 抓取前100行
		
		perl -ne 'print if $.>=10 && $.<=100' log.txt # 抓取第1000行
		perl -ne 'print if $.==1000' log.txt # 抓取第1000行
		perl -ne 'print if $.<=100' log.txt # 抓取前100行
		
		head -n 100 log.txt # 抓取前100行
		tail -n 100 log.txt # 抓取最后100行
		
## 抓列
		cut -d'\t' -f 3,5 log.txt # 抓取第3、5列，分隔符为'\t'
		cut -f 1-5 log.txt # 抓取文件第1-5列
		cut -f 5- log.txt # 抓取文件第5列及以后的列
		awk 'BEGIN{
			FS="\t"}{
				print $2}' # 抓取第2列信息，分隔符为'\t'
				head /etc/hosts| perl -F'\t|\s' -ane 'if ($F[3] eq "c2-3"){
					 print $F[1],"\n"}' # 分隔符为'\t'或空格，第4列为c2-3时，打印第2列
					 head /etc/hosts| awk 'BEGIN{
						 FS="[\t| ]"} END{
							 if($4="c2-3")print $2}' # 分隔符为'\t'或空格，当第4列为c2-3时，打印第2列
								 perl -ane 'print "$F[1]\t$F[2]\t$F[4]\t$F[5]\t$F[6]\t$F[7]\t$F[19]\n"' bms信息 > bms.txt # 将网页BMS信息转换成7列，用于CSAP流程
									 
									 
## 抓特征行
									 grep pattern in.txt
									 grep -E 'pattern1|pattern2|pattern3' in.txt  # 抓取含有pattern1、pattern2或pattern3的行
}

5 文件编辑{

## 编辑器
	vi/vim # 文件编辑器

## 插入/追加/替换
		sed '1 i Hello' log.txt # 1 表示第一行,i表示insert插入，当前操作是在第一行前插入"Hello"
		sed '10 a Hello' log.txt # a表示append,当前操作是在第10行后添加一行
		sed '$ a Hello' log.txt # a表示apppend,当前操作是在log.txt行末添加一行
		sed '2 c Hello' log.txt # c表示替换,当前操作将第二行替换为"Hello"
		sed -i 's/bin/sbin/g' log.txt # 在源文件上修改，将所有bin替换成sbin
		perl -ne 'if ($.==1){
			print "Hello\n$_"}' log.txt # 在第一行前插入"Hello"
}

6 查找{

	find 路径 -name '*.gz' # 查找gz后缀的文件
		find 路径 -name '*.gz' -or -name '*.bam' # 查找gz或bam后缀的文件
		find 路径 -not -name '*.gz' # 反向查找gz后缀的文件
		find 路径 -not -name '*.gz' -and -not -name '*.bam' # 反向查找gz或bam后缀的文件
		find 路径 -not -name '*.gz' -and -not -name '*.bam' | xargs cp -r -t 目标路径 # 反向查找gz或bam后缀的文件并递归拷贝到目标路径
		find 路径 -not -name '*.gz' -and -not -name '*.bam' | xargs cp -r -t 目标路径 # 反向查找gz或bam后缀的文件并递归拷贝到目标路径
		for i in `find 路径 -size +10M`; do echo > $i; done # 查找大于10M的文件，并把它变为空文件
			locate 关键字 # 查找，通常为可执行文件
}

7 排序{

	sort -k 4,4 -k 2,2 -nk 1,1 file.txt  #先按第四列排序，再第二列，最后对第一列按数字排序
}

8 循环{

		for i in `seq 1 10`; do echo $i; done
				cat file | while read line; do echo $line; done
						while read line; do echo $line; done < file
}

9 磁盘管理{

	df . -h # 查看当前路径磁盘使用情况
		du -smh 目录或文件 # 查看目录或文件占用磁盘大小
}

查看文件完整路径：
ls abc.txt | sed "s:^:`pwd`/:g"

按修改时间顺序查看文件：
ls -ltr

使用通配符查看文件：
ls /share/*/*
			  
			  查看文件夹结构：
			  tree
			  
			  文件排序：
			  
			  
##文件列操作


判断文件是否存在：
[ -e "/home/root.log" ] && echo exist
[ $(ls /home/zhangwei9/*/*.py 2> /dev/null|wc -l) -gt 1 ] && echo yes  # 这是使用通配符查看文件是否存在的方法
						  
						  查看任务状态：
## top命令
top # 查看当前节点状态
	c # 查看详细命令行
		1 # 查看各CPU状态
		
		ps xf # 查看所有任务状态
		ps -euf
		ps -aux
		ps -a x -o user,pid,stat,command| grep monitor # 检索含有特定字符串的任务
		ps -a -o user,pid,ppid,stat,command # 自定义查看任务
		ps -eo user,uid,ppid,pid,stat,rss,size,rss,cmd|grep R+
## 任务状态说明
使用ps格式输出来查看进程状态:
ps -eo user,stat..,cmd

user 用户名
uid 用户号
pid 进程号
ppid 父进程号
size 内存大小, Kbytes字节.
vsize 总虚拟内存大小, bytes字节(包含code+data+stack)
share 总共享页数
nice 进程优先级(缺省为0, 最大为-20)
priority(pri) 内核调度优先级
pmem 进程分享的物理内存数的百分比
trs 程序执行代码驻留大小
rss 进程使用的总物理内存数, Kbytes字节
time 进程执行起到现在总的CPU暂用时间
stat 进程状态
cmd(args) 执行命令的简单格式

例子:
查看当前系统进程的uid,pid,stat,pri, 以uid号排序.
ps -eo pid,stat,pri,uid –sort uid

查看当前系统进程的user,pid,stat,rss,args, 以rss排序.
ps -eo user,pid,stat,rss,args –sort rss

qstat # 查看当前用户所有任务状态
qstat -u username # 查看指定用户的任务状态
qstat -j jobId # 查看指定任务的详细信息
qhost -j -h compute-17-47 # 查看指定节点的任务信息
qstat -r # 查看各任务内存使用情况
qstat -r -u 用户名 # 查看指定用户各任务及其资源使用情况
