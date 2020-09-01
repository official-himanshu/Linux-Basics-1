#!/bin/bash

init_array=(1 2 3 4)
declare -a arr
arr=( [1]=1 [2]=2 [3]=3 [10]=4)

echo ${init_array[0]}
declare -p init_array
declare -p arr
echo ${arr[3]}
echo ${arr[10]}
for i in ${arr[*]}; do
	echo $i
done

for((i=0;i<=10;i++)); do
	echo "${arr[i]}"
done
