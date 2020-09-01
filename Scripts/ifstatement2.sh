#!/bin/bash

if [ 10 -gt 3 ] && [ 20 -lt 23 ];
then
	echo "10 > 3 and 23 > 20"
fi

if [ 100 -eq 100 ] || [ 20 -gt 18 ];
then 
	echo "one condition is true"
fi

if [[ 89 -gt 99 && 90 -lt 99 ]];
then 
	echo "condition is true"
fi

var="hello"
var1=

if [ -n var ];
then
	echo "lenght greater than 0"
fi

if [ -n var1 ];
then
	echo "length is 0"
fi


