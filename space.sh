#!/bin/bash
spacechecker(){
LOCATION=$i
CURRENT=$(df -kh $LOCATION | grep / | awk '{ print $5}' | sed 's/%//g')
THRESHOLD=85

if [ "$CURRENT" -gt "$THRESHOLD" ] ; then
echo -e "\e[31m`date`\e[m"
echo -e "\e[41mYour $LOCATION partition remaining free space is critically low. Please contact the system administrator ASAP. Used: $CURRENT%\e[m"
fi
}

declare -a arr=("/" "/var" "/home/<my-user-name>")
for i in "${arr[@]}"
do
#   echo "$i"
   spacechecker
done
