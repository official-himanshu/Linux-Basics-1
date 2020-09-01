#!/bin/bash

#local vs global scope in funtion

v1='A'
v2='B'

my_var(){
	local v1='C'
	v2='D'

	echo "inside function"
	echo "v1 is : $v1"
	echo "v2 is : $v2"
}

echo "Before executing the function"
echo "v1 is : $v1"
echo "v2 is : $v2"

my_var

echo "After executing the function"
echo "v1 is : $v1"
echo "v2 is : $v2"

