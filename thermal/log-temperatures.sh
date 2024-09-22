#!/bin/bash

day=$(date -u +"%Y-%m-%d")
time=$(date -u +"%H:%M:%S")
# time=$(date -u +"%H:%M:%S%z")
echo -ne "${day}\t${time}"

sources=/sys/class/thermal/thermal_zone*
for entry in $sources ; do
	type=$(cat $entry/type)
	temp1000=$(cat $entry/temp)
	temp=$(printf %.1f "$((temp1000 / 1000))")
	echo -ne "\t${type}\t${temp}"
done
echo -ne "\n"
