#!/bin/bash

echo -e "请输入filename\n\n"

read -p "Input filename:" filename

if [ -z $filename ] ; then
	echo "You mast input a filename. ex> {$filename someword}"
fi

(($filename)) 2> /dev/null

if [ $? = 0 ] ; then

	rate=`df -hT | grep "/boot" | awk '{print $6}' | cut -d "%" -f1`

	if [ "$rate" -gt "$filename" ] ; then

		echo "rate is $rate"
	fi

else
	echo 'filename is not int'
fi

#判断参数为空，使用-n 如果string长度非零，则为真

if [ -z $1 ] ; then
	echo 'arg1 is empty';
fi

#判断参数个数

if [ $# -lt 3 ] ; then
	echo 'please input 3 params';
fi
