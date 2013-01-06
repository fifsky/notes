#!/bin/bash
# This script run at 00:00
# 00 00 * * * /bin/bash /home/shell/cut_nginx_log.sh
# cut yesterday log and gzip the day before yesterday log files.
# yesterday logs to awstats

# The Nginx logs path
logs_path="/home/wwwlogs/"
date_dir=${logs_path}$(date -d "yesterday" +"%Y-%m-%d")/
#删除前一个礼拜的数据
old_date_dir=${logs_path}$(date -d "-7 day" +"%Y-%m-%d")/
#gzip_date_dir=${logs_path}$(date -d "-2 day" +"%Y")/$(date -d "-2 day" +"%m")/$(date -d "-2 day" +"%d")/

mkdir -p $date_dir
mv ${logs_path}*.log $date_dir
/usr/local/nginx/sbin/nginx -s reopen
/usr/bin/gzip -f ${date_dir}*.log
rm -rf $old_date_dir
