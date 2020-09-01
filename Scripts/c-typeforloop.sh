#!/bin/sh

#c-type for loop with three exp
a=10
for((i=0;i<$a;i++))
do
	echo $i
done

#for loop with break statement

for i in {1..10}
do
	if [ $i -lt 5 ];
	then
		echo $i
	else
		break
	fi
done

#for loop continue statement

for i in {1..20}
do
	if [ $i -gt 10 ]; then
		echo $i
	else
		continue
	fi
done

