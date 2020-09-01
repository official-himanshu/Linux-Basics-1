#!/bin/bash

#Array declartion

# for-in loop to read an array

arr=( "welcome" "to" "bash" "scripting." )

for i in ${arr[@]}
do
	echo "$i"
done

# for-in loop to read white spaces in string
echo

str="hello everyone
how are you?"

for i in $str
do
	echo $i
done

echo

# for-in loop to read a line from string

str="hello guys
hope you
doing well."

for i in "$str";
do
	echo "$i"
done

