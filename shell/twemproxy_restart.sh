#!/bin/bash

pgrep nutcracker | xargs kill -9
perl -e 'sleep(0.02)'
/usr/local/twemproxy/src/nutcracker -d -o /var/log/twemproxy.log -c /usr/local/twemproxy/conf/nutcracker.yml
pgrep nutcracker
