#!/bin/bash
#
# put CPU (or also RAM, VMem, I/O) under stress for measurements / experiments
#
if [[ $(dpkg -l | grep stress-ng) ]]; then
	: # NOP
else
	sudo apt install stress-ng
fi

NCPU=$(lscpu | grep ^CPU\(s\)\: | rev | cut -d" " -f1 | rev)
NCPU2=$(lscpu -p | grep -v \# | wc -l)
if [[ $NCPU -ne $NCPU2 ]]; then
	echo "Failed to find number of processor cores ($NCPU vs. $NCPU2), exiting..."
	exit 1
fi
stress-ng --cpu $NCPU --timeout 60s --metrics-brief
