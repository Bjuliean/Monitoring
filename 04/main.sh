#!/bin/bash

if [ $# == 0 ]
then
    source config.txt
    export p1=$column1_background
    export p2=$column1_font_color
    export p3=$column2_background
    export p4=$column2_font_color
    d1=0
    d2=0
    d3=0
    d4=0
else
    echo "You must set the parameters using the configuration file."
    exit
fi
if [ -z ${p1} ]
then
    p1=6
    d1=1
fi
if [ -z ${p2} ]
then
    p2=1
    d2=1
fi
if [ -z ${p3} ]
then
    p3=6
    d3=1
fi
if [ -z ${p4} ]
then
    p4=1
    d4=1
fi

if [[ $p1 == ?(-)+([0-9]) ]] && [[ $p2 == ?(-)+([0-9]) ]] && [[ $p3 == ?(-)+([0-9]) ]] && [[ $p4 == ?(-)+([0-9]) ]]
    then
        if [ $p1 != $p2 ] && [ $p3 != $p4 ]
        then
            if [[ $p1 -gt 0 && $p1 -lt 7 ]] && [[ $p2 -gt 0 && $p2 -lt 7 ]] && [[ $p3 -gt 0 && $p3 -lt 7 ]] && [[ $p4 -gt 0 && $p4 -lt 7 ]]
            then
                chmod +x output_process.sh
                chmod +x config_info.sh
                ./output_process.sh $p1 $p2 $p3 $p4
                if [ $d1 -eq 0 ]
                then
                    ./config_info.sh 1 $p1 0
                else
                    ./config_info.sh 1 $p1 1
                fi
                if [ $d2 -eq 0 ]
                then
                    ./config_info.sh 2 $p2 0
                else
                    ./config_info.sh 2 $p2 1
                fi
                if [ $d3 -eq 0 ]
                then
                    ./config_info.sh 3 $p3 0
                else
                    ./config_info.sh 3 $p3 1
                fi
                if [ $d4 -eq 0 ]
                then
                    ./config_info.sh 4 $p4 0
                else
                    ./config_info.sh 4 $p4 1
                fi
            else
                echo "The value of the parameters is in the range from 1 to 6."
            fi
        else
            echo "The background color and the text color should not match."
            echo "(The default configuration using black backgrounds and white text.)" 
        fi
    else
        echo "Parameters can only be set in numeric form."
fi    