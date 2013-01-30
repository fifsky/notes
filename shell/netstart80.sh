#/bin/bash

#查看80端口连接数

netstat -nat | grep -i "80" | wc -l

#查看httpd协议连接数
ps -ef | grep httpd | wc -l

#统计已经连接上，状态为TIME_WAIT的连接数
netstat -nat | grep TIME_WAIT | wc -l

#统计80端口的 TIME_WAIT连接数
netstat -nat | grep -i "80" | grep TIME_WAIT | wc -l

#查询那个IP地址连接数最多
netstat -na|grep ESTABLISHED | awk '{print $5}' |awk -F: '{print $1}'|sort|uniq -c|sort -r

#查询80端口连接数最多的TIME_WAIT IP
netstat -na| grep -i "80" |grep TIME_WAIT | awk '{print $5}' | awk -F : '{print $4}' | sort | uniq -c | sort -r | more


