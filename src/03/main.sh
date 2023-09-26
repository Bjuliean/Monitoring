#!/bin/bash

chmod +x output_process.sh

function repeat {
    echo "Enter other parameters? Y/N"
    read ans
    case "$ans" in
        y | Y)  echo "Enter your parameters:"
                read p1 p2 p3 p4
                ./main.sh $p1 $p2 $p3 $p4;;
        *)      echo "Closing..."
                exit;;
    esac
}

if [ $# == 4 ]
then
    if [[ $1 == ?(-)+([0-9]) ]] && [[ $2 == ?(-)+([0-9]) ]] && [[ $3 == ?(-)+([0-9]) ]] && [[ $4 == ?(-)+([0-9]) ]]
    then
        if [ $1 != $2 ] && [ $3 != $4 ]
        then
            if [[ $1 == ?(-)+([1-6]) ]] && [[ $2 == ?(-)+([1-6]) ]] && [[ $3 == ?(-)+([1-6]) ]] && [[ $4 == ?(-)+([1-6]) ]]
            then
                ./output_process.sh $1 $2 $3 $4
            else
                echo "The value of the parameters is in the range from 1 to 6."
                repeat
            fi
        else
            echo "Parameters 1 and 2, 3 and 4 should not match."
            repeat
        fi
    else
        echo "Parameters can only be set in numeric form."
        repeat
    fi    
else
    echo "Only 4 parameters can be entered."
    repeat
fi

