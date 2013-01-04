#!/bin/bash

#如果用户输入的不等于yes和YES则循环下去
while [ "$yn" != "yes" -a "$yn" != "YES" ]
do
	read -p "Please input yes/YES to stop this program:" yn
done

echo "OK"


#1加到100
s=0
i=0
while [ "$i" != "100" ]
do 
	i=$(($i+1))
	s=$(($s+$i))
done

echo "The result of '1+2+3...+100' is ===> $s"


#for循环输出
for var in "aa" "bb" "cc"
do 
	echo $var
done


#输出所有账号的名称 
users=$(cut -d ':' -f1 /etc/passwd)
for username in $users
do
	id $username
	finger $username
done

#for连续
for i in $(seq 1 100)
do 
	echo $i
done

#for循环
s=0;
for (( i=1; i<=100; i=i+1 ))
do 
	s=$(($s+$i)) 
done


#检查shell脚本语法错误 sh -n loop.sh
#将shell执行过程输出到屏幕 sh -x loop.sh 可以清晰看到shell的每一步执行过程，有助于分析错误
echo "this is total:$s"




