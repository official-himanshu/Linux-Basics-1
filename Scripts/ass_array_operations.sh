#!/bin/bash

declare -A ass_array
ass_array=( [a]=A [b]=B [z]=Z [x]=X )

echo ${ass_array[a]}
echo ${ass_array[z]}

#accessing keys from the associative array

declare -A ass
ass=( 
[fruit]=apple
[mouse]=prodot
[keyboard]=inbuilt
[laptop]=hp
)

echo "${!ass[@]}"

#accessing keys using direct method and using for loop

for keys in ${!ass[*]}; do
	echo $keys
done


# accessing keys and value all together with the help of loop

echo "Using associative array please enter keys and values as prompted"
declare -A array
read -p "Enter number of keys:" n
for((i=1;i<=$n;i++)); do
	read -p "Enter key:" key
	read -p "Enter value:" value

	array+=( [$key]=$value )
done

for keys in "${!array[@]}"; do
	echo "$keys=>${array[$keys]}"
done

# to print the array lenght
echo "Array Lenght is:"
echo "${#array[@]}"

#deleting an array element from the array


echo "Deleting the array elements"
read -p "enter the key to delete:" k
echo "array before deleting: ${array[@]}"
unset array[$k]
echo "Array after deleting the key $k : ${array[@]}"

#try to accessing a deleted value of a key

if [ ${array[$k]+_}]; then echo "Found"; else echo "not found"; fi

# delete an array completely
unset array
echo "${array[@]}"
