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
