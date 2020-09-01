#!/bin/bash

echo(){
	builtin echo -n `date +%m-%d--%H:%M:%S`":"
	builtin echo $1
}

echo "welcome"
