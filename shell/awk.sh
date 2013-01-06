#!/bin/bash

#按:分隔输出第一段
awk -F: '{ print $1 }' /etc/passwd

#按:分隔输出第一段和第五段
awk -F: '{ print $1,$5 }' /etc/passwd

#按:分隔输出第一段和最后一段
awk -F: '{ print $1,$NF }' /etc/passwd

#打印非空行
awk 'NF >0'

#执行分隔符,需要设置OFS变量
awk -F: -v 'OFS=---' '{ print $1,$5 }' /etc/passwd

#
