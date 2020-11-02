#!/bin/bash
pings=($(pidof ping))
for i in "${pings[@]}" ; do
	# echo $i
	kill -SIGQUIT $i
	sleep 0.1s
done
