#!/bin/bash

#Command Substitution

result=$(ls)
test=$(cat commandsub.sh) 

echo "My files are:" $result
echo "$test"


