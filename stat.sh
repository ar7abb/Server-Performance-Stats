#!/bin/bash

echo "Server Stats Script"
echo "-------------------"
echo "Hello from Linux"
echo
echo OS VERSION :
echo =============
grep PRETTY_NAME /etc/os-release | cut -d= -f2 | tr '"' -d
echo

echo Runtime :
echo =============
uptime -p
echo

echo Load avg :
echo =============
uptime | awk -F'load average:' '{print $2}'
echo

echo CPU use :
echo =============
top -bn1  | grep "Cpu(s)" | awk '{print "Used: " 100 - $8 "%" }'
echo

echo RAM use :
echo =============
free -m | awk 'NR==2 {
    print "Used: " $3 " MB / " $2 " MB"
    print "Free: " $4 " MB"
    print "Usage: " $3*100/$2 "%"
}'
echo

echo Disk use :
echo ==============
df -h / | awk 'NR==2 {
print "Used: " $3 " / " $2
print "Free : " $4
print "Usage : " $5 
}'
echo
echo Top 5 cpu ps :
echo ==============
ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 6
echo

echo Top 5 ram ps :
echo ==============
ps -eo pid,%cpu,%mem --sort=-%mem | head -n 6
echo
