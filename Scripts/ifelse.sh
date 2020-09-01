#!/bin/bash

read -p "Enter a value:" val

if [ $val -gt 100 ]; then echo "$val is greater than 100"; else echo "$val is less than 100";fi

if [ $val -lt 100 ];
then
	echo "value is less than 100"

	if [ $val -lt 50 ];
	then
		echo "value is also less than 50"
	else
		echo "value is less than 100 but greater than 50"
	fi
fi


