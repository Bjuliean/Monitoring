#!/bin/bash

chmod +x output.sh
if [ $# == 1 ]
then
    if [ -d $1 ]
    then
        str="$1"
        if [ "${str:${#str}-1:1}" == '/' ]
        then
            ./output.sh $1
        else
            echo "The path to the directory must end with the character '/'."
        fi
    else
        echo "Unknown directory."
    fi
else
    echo "You should enter 1 parameter which means the path to the directory."
fi