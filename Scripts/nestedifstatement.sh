#!/bin/bash

# nested if statement

if [ 10 -lt 50 ];
then
	echo "number is less than zero"

	if (( 4%2 == 0 ));
	then
		echo "and it is even"
	fi
fi

