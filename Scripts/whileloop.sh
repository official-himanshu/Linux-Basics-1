#!/bin/bash

# while loop with single condition

read -p "Enter start number: " snum
read -p "Enter end number: " enum

while [ $snum -lt $enum ];
do
	echo $snum
	((snum++))
done

echo "This is while loop"

#while loop with multiple condition

read -p "Enter a starting number: " snumber
read -p "Enter a ending number: " enumber

while [[ $snumber -lt $enumber || $snumber == $enumber && $snumber -gt 20 ]];
do
	echo $snumber
	((++snumber))
done


