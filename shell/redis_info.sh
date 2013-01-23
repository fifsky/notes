#!/bin/bash

for i in 6379 6380 6381
do
	echo $i
	redis-cli -p $i info 2> /dev/null | grep $1
done
