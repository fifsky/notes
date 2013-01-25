#!/bin/sh
export PATH=$PATH:/home/httpd:/usr/local/php5_nginx/bin
export ORACLE_BASE=/home/oracle
export ORACLE_SID=pps	
export ORACLE_HOME=/home/oracle/product/10.2.0
export PATH=$PATH:$ORACLE_HOME/bin
export NLS_LANG="Simplified Chinese_china".ZHS16GBK
 	
#wget一个网址,保证是单一进程在跑.
function callurl()
{
        if ps aux |  grep -v 'grep ' | grep -q "$1" ; then
                echo fail:$1 ; 
        else
                nohup wget $1 -O /dev/null > /dev/null   2>&1 &
                echo callOK:$1
        fi
}

#wget一个网址,阻塞模式跑
function callurl2()
{
        if ps aux |  grep -v 'grep ' | grep -q "$1" ; then
                echo fail:$1 ; 
        else
                wget $1 -O /dev/null
                echo callOK:$1
        fi
}


#wget一个网址,保证是单一进程在跑.
function callact()
{
        if ps aux |  grep -v 'grep ' | grep -q "$1" ; then
                echo fail:$1 ; 
        else
                nohup $1 -O /dev/null > /dev/null   2>&1 &
                echo callOK:$1
        fi
}

#wget一个网址,保证是单一进程在跑.阻塞模式跑
function callact2()
{
        if ps aux |  grep -v 'grep ' | grep -q "$1" ; then
                echo fail:$1 ; 
        else
                $1 -O /dev/null > /dev/null 
                echo callOK:$1
        fi
}

function sysload()
{
	uptime=`uptime`
	tcp=`netstat -s -t | grep connections\ established |awk '{print $1}'`
	mem=`cat /proc/meminfo | head -2 | tail -1`
	hostname=`cat /proc/sys/kernel/hostname`
	CPUINFO=`top -b -n 1 | awk 'NR==3 {print $5}'`
	DISK=(`df -h | awk 'NR>1{print $6,$5}'`)
	DISKINFO=''
	N=0
	for VALUE in "${DISK[@]}"; do
		if [ "$N" -eq 0 ]; then
			DISKINFO=("$DISKINFO$VALUE,")
			N=1
		elif [ "$N" -eq 1 ]; then
			DISKINFO=("$DISKINFO$VALUE|")
			N=0
		fi
	done

	wget "$1/project.php?act=sysload" --post-data "disk=$DISKINFO&uptime=$uptime&tcp=$tcp&cpu=$CPUINFO&hostname=$hostname&mem=$mem" -O /dev/null 
}
