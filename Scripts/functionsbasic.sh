#!/bin/bash

#first method of declraing function

myfunction(){
	echo "welcome to first bash function"
}

#second method of declaring the function

function mysecondfunction(){
	echo "my second function with other method"
}

#passing and accessing the arguments in function

function fun(){
	echo $1
	echo $2
	echo $3
	echo "No of args passed: $#"
}

myfunction
mysecondfunction
fun "hello" "everyone" "okk."
fun 1 2


