#!/bin/bash

#Reading multiple inputs using an array

echo "Enter names"
read -a names
echo "The entered names are : ${names[0]}, ${names[1]}."

