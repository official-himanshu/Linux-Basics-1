#!/bin/bash
#
# SCRIPT: Usage of trap
# AUTHOR: Himanshu Chaudhary
# DATE:   31/08/2020
# REV:    1.1.A
#
#
# PLATFORM: specific for bash scripting
# 
# PURPOSE: demo of trap 
# REV LIST:
#    DATE        : None
#    BY          : None
#    MODIFICATION: None
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
trap cleanup 1 2 3 6
################################################################
################################################################
#          Define Functions here                               #
cleanup()
{                       
  echo "Caught Signal ... cleaning up."
  rm -rf /tmp/temp_*.$$
  echo "Done cleanup ... quitting."
  exit 1
}

################################################################
################################################################
#          Beginning of Main                                   #
for i in *
do
  sed s/FOO/BAR/g $i > /tmp/temp_${i}.$$ && mv /tmp/temp_${i}.$$ $i
  sleep 2s
done
################################################################
# End of script                     






