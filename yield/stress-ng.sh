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
stress-ng --cpu $NCPU --timeout 60s --metrics-brief
