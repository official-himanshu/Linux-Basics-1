#!/bin/bash

#bash untill loop

a=1
b=1
max=1

until [[ $a -gt $max || $b -gt $max ]];
do
	echo "print"
	((a++))
	((b++))
done

: ' Real life example
of untill loop '

until git pull &> /dev/null
do
	echo "waiting for git host ..."
	sleep 2s

done

echo -e "\nThe git repo is pulled ..."
