#!/bin/bash
#
# SCRIPT: check free space through file
# AUTHOR: Himanshu Chaudhary
# DATE:  02 /09/2020
# REV:    1.1.A 
#
#
# PLATFORM: Specific for bash
# 
# PURPOSE: A clear, even if required lenghty, use-case.
# REV LIST:
#    DATE        : Date of revision
#    BY          : AUTHOR OF MODIFICATION
#    MODIFICATION: Describe the chages made. What do they enhance.
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
#path to meminfo file located in /proc directory.
path="/proc/meminfo"
################################################################
################################################################
#          Define Functions here                 		#
checkMemory(){
	echo $path
	totalmemory=$(grep -i "MemTotal" $path)
	freememory=$(grep -i "MemFree" $path)
	availablememory=$(grep -i "MemAvailable" $path)
	echo $totalmemory
	echo $freememory
	echo $availablememory

}
################################################################
################################################################
#          Beginning of Main                                   #
checkMemory
################################################################
# End of script

