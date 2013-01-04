#!/bin/bash 
cur=`date +%H%M%S` 
becur=`date -d "1 minute ago" +%H%M%S` 
badip=`tail -n 10000 /home/wwwlogs/www.fm520.me.log | egrep -v "\.(gif|jpg|jpeg|png|css|js)" | awk  -v a="$becu
r" -v b="$cur" -F [' ':] '{t=$5$6$7;if (t>=a && t<=b) print $1}' | sort | uniq -c | awk '{if ($1>=20) print $2}
'` 
if [ ! -z $badip ];then 
for ip in $badip; 
do 
if test -z "`/sbin/iptables -nL | grep $ip`";then 
/sbin/iptables -I INPUT -s $ip -j DROP 
fi 
done 
fi 
badip2=`tail -n 10000 /home/wwwlogs/www.chibaole.com.log | egrep -v "\.(gif|jpg|jpeg|png|css|js)" | awk  -v a="
$becur" -v b="$cur" -F [' ':] '{t=$5$6$7;if (t>=a && t<=b) print $1}' | sort | uniq -c | awk '{if ($1>=20) prin
t $2}'` 
if [ ! -z $badip2 ];then 
for ip in $badip2; 
do 
if test -z "`/sbin/iptables -nL | grep $ip`";then 
/sbin/iptables -I INPUT -s $ip -j DROP 
fi 
done 
fi 
