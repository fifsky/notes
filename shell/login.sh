#!/bin/bash

#查看用户登录日志

grep "Failed password for [root|mysql]" /var/log/secure | awk '{print $9,$11}' | sort | uniq -c | sort -nr | mo
re
