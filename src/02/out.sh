#!/bin/bash

echo "Do you want to save your data? Y/N"
read ans
case "$ans" in
y | Y)
    filename=$(date +"%d_%m_%y_%H_%M_%S".status)
    mv txt.txt ${filename}
    echo "Successfully saved.";;
*)  rm txt.txt;;
esac
    