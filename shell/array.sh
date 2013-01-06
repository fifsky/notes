#!/bin/bash

arr=(a abc c d e)

#输出数组所有元素
echo ${arr[*]}

#输出数组第一个元素长度
echo ${#arr}

#输出数组第二个元素
echo ${arr[1]}

#输出数组第二个元素的长度
echo ${#arr[2]}

#输出数组有多少个元素
echo ${#arr[*]}

