#!/bin/bash
chmod +x color.sh
COL_CONF=./color.sh
echo $($COL_CONF $1 $2) "HOSTNAME =" $($COL_CONF $3 $4) $(hostname) 
#echo $($COL_CONF $1 $2) "TIMEZONE =" $($COL_CONF $3 $4) $(timedatectl | awk '{print $3}' | head -4 | grep '/')
tzone=$(timedatectl | grep "Time zone" | awk '{print $3}')
utc=$(date +%z)
echo $($COL_CONF $1 $2) "TIMEZONE = $($COL_CONF $3 $4) $tzone UTC $utc"
echo $($COL_CONF $1 $2) "USER =" $($COL_CONF $3 $4) $(whoami)
#echo $($COL_CONF $1 $2) "OS =" $($COL_CONF $3 $4) $(cat /etc/issue | tr -s '\n' ' ' | tr -s '\r' ' ' | tr -s '\\' ' ')
echo $($COL_CONF $1 $2) "OS =" $($COL_CONF $3 $4) $(lsb_release -ds)
echo $($COL_CONF $1 $2) "DATE =" $($COL_CONF $3 $4) $(date -R | awk '{print $2, $3, $4, $5}')
echo $($COL_CONF $1 $2) "UPTIME =" $($COL_CONF $3 $4) $(uptime -p | awk '{print $2, $3}')
echo $($COL_CONF $1 $2) "UPTIME_SEC =" $($COL_CONF $3 $4) $(cat /proc/uptime | awk '{print $1, "seconds"}')
echo $($COL_CONF $1 $2) "IP =" $($COL_CONF $3 $4) $(netstat -rn | head -4 | tail +4 | awk '{print $1}')
echo $($COL_CONF $1 $2) "MASK =" $($COL_CONF $3 $4) $(netstat -rn | head -4 | tail +4 | awk '{print $3}')
echo $($COL_CONF $1 $2) "GATEWAY =" $($COL_CONF $3 $4) $(netstat -rn | head -4 | tail +4 | awk '{print $2}')
echo $($COL_CONF $1 $2) "RAM_TOTAL =" $($COL_CONF $3 $4) $(free  |  head -2 | tail +2 | awk '{printf("%.3f", $2/(1024*1024))} {print "Gb"}')
echo $($COL_CONF $1 $2) "RAM_USED =" $($COL_CONF $3 $4) $(free  |  head -2 | tail +2 | awk '{printf("%.3f", $3/(1024*1024))} {print "Gb"}')
echo $($COL_CONF $1 $2) "RAM_FREE =" $($COL_CONF $3 $4) $(free  |  head -2 | tail +2 | awk '{printf("%.3f", $4/(1024*1024))} {print "Gb"}')
echo $($COL_CONF $1 $2) "SPACE_ROOT =" $($COL_CONF $3 $4) $(df / |  head -2 | tail +2 | awk '{printf("%.2f", $2/1024)} {print "Mb"}')
echo $($COL_CONF $1 $2) "SPACE_ROOT_USED =" $($COL_CONF $3 $4) $(df / |  head -2 | tail +2 | awk '{printf("%.2f", $3/1024)} {print "Mb"}')
echo $($COL_CONF $1 $2) "SPACE_ROOT_FREE =" $($COL_CONF $3 $4) $(df / |  head -2 | tail +2 | awk '{printf("%.2f", $4/1024)} {print "Mb"}')
echo $($COL_CONF 0 0)