#!/bin/bash

#定义变量类型使用declare 参数如下
# -r 只读 与 readonly var2 完全一样
# -i 整形
# -a 数组
# -f 函数
# -x export

#eg:

declare -r var1=fifsky

var1=fifsky2

echo $var1
