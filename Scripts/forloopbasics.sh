#!/bin/bash

# Basic for-in loop example

str="hello welcome to bash scripting."

for str in $str
do
	echo $str
done

# Another for in loop example using range 

for i in {1..10}
do
	echo $i
done

# for-in loop example using range with iteration number

for i in {0..10..2}
do 
	echo $i
done

# for-in loop example using range with reverse iteration

for i in {10..1..3}
do
	echo $i
done

for i in {1..-10..-1}
do 
	echo $i
done

echo "Performing for loop with user range"
a=10
for i in $(seq 1 ${a}); do
	echo $i
done

echo "performing with c-style loop"
a=1
b=10

for((i="${a}";i<"${b}";i++));
do echo $i;
done

