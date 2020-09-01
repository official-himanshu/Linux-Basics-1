#!/bin/bash

echo "Do you know java programming"
read -p "yes/no: " val

case $val in
	yes|Yes|y|Y|YES)
		echo "Thats great "
		;;

	no|No|n|N|NO)
		echo "try to learn it"
		;;
	
	*)
		echo "wrong action"
		;;
esac
