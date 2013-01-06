#/bin/bash
# shutdown all linux

sshpass -p 123456 ssh root@192.168.1.103 /sbin/shutdown -h now > /dev/null 2>&1
sshpass -p 123456 ssh root@192.168.1.105 /sbin/shutdown -h now > /dev/null 2>&1
/sbin/shutdown -h now > /dev/null 2>&1
