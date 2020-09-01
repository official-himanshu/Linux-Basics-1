#!/bin/bash

#this is simple array declaration

declare -a simple_array
simple_array[0]=10
simple_array[1]=20
simple_array[2]=$((simple_array[0]+simple_array[1]))
simple_array[3]=$(( simple_array[0]-simple_array[1]))

declare -p simple_array
echo
echo ${simple_array[0]} ${simple_array[1]} ${simple_array[2]} ${simple_array[3]}


