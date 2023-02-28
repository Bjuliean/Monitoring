#!/bin/bash
if [ -n "$1" ] && (($# == 1))
then
    if [[ $1 =~ ^[0-9+\.+\,]+$ ]]
    then
        echo "Incorrect argument."
    else
        echo $1
    fi
else
    echo "Incorrect argument."
fi