#!/bin/bash
cd $1
START=$(date +%s.%N)
p1=$(find -type d | wc -l)
#p1=$((p1-1))
echo "Total number of folders (including all nested ones) = $p1"

echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
total=$(du -h $1 | sort -h -r | head -5 | wc -l)
for ((i = 1; i <= $total; i++))
do
    path=$(du -h $1 | sort -h -r | head -$i | tail +$i | awk '{print $2}')
    weight=$(du -h $1 | sort -h -r | head -$i | tail +$i | awk '{print $1"b"}')
    echo "$i - $path, $weight"
done
echo "etc up to 5"

echo "Number of: "
conf=$(find $1 -name "*.conf" | wc -l)
echo "Configuration files (with the .conf extension) = $conf"
txt=$(find $1 -name "*.txt" | wc -l)
echo "Text files = $txt"
exec=$(find $1 -type f -executable | wc -l)
echo "Executable files = $exec"
log=$(find $1 -name "*.log" | wc -l)
echo "Log files (with the extension .log) = $log"
arc=$(find $1 -name "*.tar" -o -name "*.zip" -o -name "*.gz" -o -name "*.rar" -o -name "*.7z" | wc -l)
echo "Archive files = $arc"
syml=$(find $1 -type l | wc -l)
echo "Symbolic links = $syml"

echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
total=$(find ./ -xdev -type f -exec du -sh {} ';' | sort -rh | head -10 | wc -l)
for ((i = 1; i <= $total; i++))
do
    path=$(find ./ -xdev -type f -exec du -sh {} ';' | sort -rh | head -$i | tail +$i | awk '{print $2}')
    weight=$(find ./ -xdev -type f -exec du -sh {} ';' | sort -rh | head -$i | tail +$i | awk '{print $1"b"}')
    echo "$i - $path, $weight, ${path##*.}"
done
echo "etc up to 10"

echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file)" 
total=$(find $1 -type f -executable | sort -rh | head -10 | wc -l)
for ((i = 1; i <= $total; i++))
do
    path=$(find $1 -type f -exec du -sh {} ';' | sort -rh | head -$i | tail +$i | awk '{print $2}')
    weight=$(find $1 -type f -executable -exec du -sh {} ';' | awk '{print $1"b"}' | sort -rh | head -$i | tail +$i)
    hash=$(md5sum $path | awk '{print $1}')
    echo "$i - $path, $weight, $hash"
done
echo "etc up to 10"

END=$(date +%s.%N)
echo "Script execution time (in seconds) = " `echo "$END $START" | awk '{printf "%.3lf", $1-$2}'`

#find ./ -type f -executable -exec du -sh {} ';' | awk '{print $1"b"}' | sort -rh | head -$i | tail +$i 