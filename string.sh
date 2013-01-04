#!/bin/bash

str="this is fifsky"

#输出变量
echo $str

#从第N个字符开始输出

echo ${str:2}

#从第N个字符开始输出M长度个字符

echo ${str:2:6}

#替换字符

echo ${str/is/IS}

#全局替换

echo ${str//i/I}

