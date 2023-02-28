#!/bin/bash

WHITE_BACK='\033[47m'
RED_BACK='\033[41m'
GREEN_BACK='\033[42m'
BLUE_BACK='\033[46m'
PURPLE_BACK='\033[45m'
BLACK_BACK='\033[40m'
WHITE_FONT='\033[37m'
RED_FONT='\033[31m'
GREEN_FONT='\033[32m'
BLUE_FONT='\033[36m'
PURPLE_FONT='\033[35m'
BLACK_FONT='\033[30m'
DEFAULT='\033[0m'

case "$1" in
1) echo -en $WHITE_BACK;;
2) echo -en $RED_BACK;;
3) echo -en $GREEN_BACK;;
4) echo -en $BLUE_BACK;;
5) echo -en $PURPLE_BACK;;
6) echo -en $BLACK_BACK;;
*) echo -en $DEFAULT;;
esac
case "$2" in
1) echo -en $WHITE_FONT;;
2) echo -en $RED_FONT;;
3) echo -en $GREEN_FONT;;
4) echo -en $BLUE_FONT;;
5) echo -en $PURPLE_FONT;;
6) echo -en $BLACK_FONT;;
*) echo -en $DEFAULT;;
esac
