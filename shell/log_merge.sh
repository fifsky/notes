#!/bin/bash

#获取上一个小时的开始时间
prev_hour=`date -d '-1 hour' +"%Y-%m-%d %H:00:00"`;
#获取时间戳格式
prev_hour_unix=`date -d "${prev_hour}" +%s`;

log_dir='/home/wwwlogs';

mkdir "${prev_hour}"
cd "${prev_hour}"

for i in $(seq 0 5)
do
    file="${log_dir}/l.pps.tv-access_log.$((${prev_hour_unix} + ${i}*600)).tar.gz"
    echo ${file}
    tar zxvf ${file} > /dev/null 2>&1
    #cat l.pps.tv-* >> l.pps.tv-access_log.${prev_hour}.log
    #tar zxvf "${log_dir}/l.pps.tv-access_log.$((${prev_hour_unix} + ${i}*800)).tar.gz"
done

cat l.pps.tv-* >> l.pps.tv-access_all.log

cd ..

#rm -rf "${prev_hour}"

#ls /home/wwwlogs/l.pps.tv-access_log.135933* | awk '{print "tar zxvf " $1}' | /bin/sh
#//tar zxvf l.pps.tv-access_log.1359331800.tar.gz
