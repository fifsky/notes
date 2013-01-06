#!/bin/bash

redis-cli -p 6381 flushdb

redis-cli -p 6381 info|grep used_memory:

for (( start = 0; start < 100000; start++ ))
do
    redis-cli -p 6381 set u:$start {"i":$start,"n":"fifsky$start","p":"asf12332e52","m":"fifsky$start@dev.pps.tv","s":"0","a":"\u6211\u662fredis\u6d4b\u8bd5","c":"\u4e0a\u6d77\u5e02","h":"\u4e0a\u6d77\u5e02","l":""} > /dev/null
done

redis-cli info|grep used_memory:
