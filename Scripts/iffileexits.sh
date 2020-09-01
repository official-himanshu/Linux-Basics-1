#!/bin/bash

# to check file exists or not

if [ -e ifstatement.sh ];
then
	echo "file exists"
fi

if [ -r ifstatement.sh ];
then
	echo "read premission granted"
fi

if [ -d ifstatement.sh ];
then 
	echo "it is a directory"
fi

