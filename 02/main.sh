#!/bin/bash

echo "HOSTNAME =" $(hostname) >> txt.txt
echo "TIMEZONE =" $(timedatectl | awk '{print $3}' | head -4 | grep '/') >> txt.txt
echo "USER =" $(whoami) >> txt.txt
echo "OS =" $(cat /etc/issue | tr -s '\\l\n' ' ') >> txt.txt
echo "DATE =" $(date -R | awk '{print $2, $3, $4, $5}') >> txt.txt
echo "UPTIME =" $(uptime -p | awk '{print $2, $3}') >> txt.txt
echo "UPTIME_SEC =" $(cat /proc/uptime | awk '{print $1, "seconds"}') >> txt.txt
echo "IP =" $(netstat -rn | head -4 | tail +4 | awk '{print $1}') >> txt.txt #$(hostname -I | awk '{print $1}')
echo "MASK =" $(netstat -rn | head -4 | tail +4 | awk '{print $3}') >> txt.txt
echo "GATEWAY =" $(netstat -rn | head -4 | tail +4 | awk '{print $2}') >> txt.txt
echo "RAM_TOTAL ="  $(free  |  head -2 | tail +2 | awk '{printf("%.3f", $2/(1024*1024))} {print "Gb"}') >> txt.txt
echo "RAM_USED =" $(free  |  head -2 | tail +2 | awk '{printf("%.3f", $3/(1024*1024))} {print "Gb"}') >> txt.txt
echo "RAM_FREE =" $(free  |  head -2 | tail +2 | awk '{printf("%.3f", $4/(1024*1024))} {print "Gb"}') >> txt.txt
echo "SPACE_ROOT =" $(df / |  head -2 | tail +2 | awk '{printf("%.2f", $2/1024)} {print "Mb"}') >> txt.txt
echo "SPACE_ROOT_USED =" $(df / |  head -2 | tail +2 | awk '{printf("%.2f", $3/1024)} {print "Mb"}') >> txt.txt
echo "SPACE_ROOT_FREE =" $(df / |  head -2 | tail +2 | awk '{printf("%.2f", $4/1024)} {print "Mb"}') >> txt.txt
cat txt.txt
sh out.sh
# date +"%d_%m_%y_%H_%M_%S"  DD_MM_YY_HH_MM_SS.status