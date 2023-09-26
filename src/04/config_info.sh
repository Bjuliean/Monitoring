#!/bin/bash

num_code="$2"
if [ $1 -eq 1 ]
then
    pos="Column 1 background = "
fi
if [ $1 -eq 2 ]
then
    pos="Column 1 font color = "
fi
if [ $1 -eq 3 ]
then
    pos="Column 2 background = "
fi
if [ $1 -eq 4 ]
then
    pos="Column 2 font color = "
fi

if [ $2 -eq 1 ]
then 
    col="(white)"
fi
if [ $2 -eq 2 ]
then 
    col="(red)"
fi
if [ $2 -eq 3 ]
then 
    col="(green)"
fi
if [ $2 -eq 4 ]
then 
    col="(blue)"
fi
if [ $2 -eq 5 ]
then 
    col="(purple)"
fi
if [ $2 -eq 6 ]
then 
    col="(black)"
fi

if [ $3 -eq 1 ]
then
    num_code="default"
    if [ $1 -eq 1 ] || [ $1 -eq 3 ]
    then
        col="(black)"
    fi
    if [ $1 -eq 2 ] || [ $1 -eq 4 ]
    then
        col="(white)"
    fi
fi

echo "$pos $num_code $col"

