#!/bin/bash
#
# SCRIPT: Check free space in system
# AUTHOR: Himanshu Chaudhary
# DATE:   31/08/2020
# REV:    1.1.A
#
#
# PLATFORM: specific to bash supported platform
# 
# PURPOSE: It can check free space available in your system
# REV LIST: change in grep command used
#    DATE        : 1/09/2020
#    BY          : Himanshu Chaudhary
#    MODIFICATION: Grep command changed for more see main
# 
# set -n   # Uncomment to check script syntax, without execution.
#          # NOTE: Do forget comment it back as it won't allow the 
#          # the script to execute.
#
# set +x   # Uncomment this for debugging this shell script.
#
#
################################################################
#          Define Files and Variables here                     #
# default value to use if none specified
PERCENT=30
################################################################
################################################################
#          Define Functions here                               #
################################################################
################################################################
#          Beginning of Main                                   #
# test for command line arguement is present
if [[ $# -le 0 ]]
then
    printf "Using default value for threshold!\n"
# test if argument is an integer
# if it is, use that as percent, if not use default
else
    if [[ $1 =~ ^-?[0-9]+([0-9]+)?$ ]]
    then
        PERCENT=$1
    fi
fi

let "PERCENT += 0"
printf "Threshold = %d\n" $PERCENT

#df -h | grep 'sda2' | awk '{ print $5,$1 }' | while read data;
df -h | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $1}' | while read data;
do
    used=$(echo $data | awk '{print $1}' | sed s/%//g)
    p=$(echo $data | awk '{print $2}')
    if [ $used -ge $PERCENT ]
    then
        echo "WARNING: The partition \"$p\" has used $used% of total available space - Date: $(date)"
    fi
done
################################################################
# End of script





 
