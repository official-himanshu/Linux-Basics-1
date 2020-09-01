#!/bin/bash

#setting up a return statement

my_fun(){
	echo hello $1
	return 5
}

my_fun2(){
	echo hello $1
}

my_fun3(){
	local var="hello value returned"
	echo $var
}

my_fun him
echo the previous function return the value $?
my_fun2 10
echo the previous function return the value $?
var=$(my_fun3)
echo $var
