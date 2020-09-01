#!/bin/bash

i=0
var=false
until  $var ;
do
	echo "infinity loop;"
	if [ $i -gt 4 ];
	then
		echo "checking...."
		
	fi
	((i++))
done

