#!/bin/bash

echo "Do you want to save your data? Y/N"
read ans
if [ ans == 'Y' ] || [ ans == 'y' ]
then
    filename=$(date +"%d_%m_%y_%H_%M_%S".status)
    mv txt.txt ${filename}
    echo "Succesfully saved."
else
    rm txt.txt
fi
    