#!/bin/bash
#script to print an element of an array with an index of 2

#declaring the array

declare -a ex_array=( "welcome" "to" "bash" )

#printing the element with index of 2
echo "result"
declare -p ex_array
echo "${ex_array[2]}" "${ex_array[1]}"

#applying for loop with arrays using @

declare -a arr=(hello everyone how are you)
for i in "${arr[@]}"; do
	echo $i	
done

#applying for loop with arrays using *

for i in ${arr[*]}; do
	echo $i
done


