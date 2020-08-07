#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

logfile=$DIR/HDD-temp.log
dt=$(date +"%Y-%m-%d %H:%M")

probe=$DIR/get-HD-temp.sh
tempA=$($probe /dev/sda)
tempB=$($probe /dev/sdb)
tempC=$($probe /dev/sdc)
tempD=$($probe /dev/sdd)
tempE=$($probe /dev/sde)

if [ ! -f $logfile ] ; then
	echo "DateTime,sda °C,sdb °C,sdc °C,sdd °C,sde °C" > $logfile
fi
printf "%s,%d,%d,%d,%d,%d\n" "$dt" $tempA $tempB $tempC $tempD $tempE >> $logfile
