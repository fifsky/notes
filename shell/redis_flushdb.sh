#!/bin/bash

for i in 6379 6380 6381
do
	redis-cli -p $i flushDB
done
