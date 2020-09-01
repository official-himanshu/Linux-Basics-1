#!/bin/bash

echo "Enter Anything:"
read
echo "Without passing any variable $REPLY"
read -p "Enter on the same prompt:" var
read
echo "Value on same prompt: "$var
echo "again read without var: $REPLY"
