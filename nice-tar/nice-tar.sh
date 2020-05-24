#!/bin/bash
# depends on packages stress or stress-ng

if [[ $(id -u) -ne 0 ]]; then
	echo "You must be root to run this experiment."
	exit 1
fi
if [[ $# -eq 0 ]]; then
	echo "Please supply a parameter for the target (file or dir) to be stored."
	exit 1
fi
TARGET=$1

( time ./nice-wrap.sh 19 $TARGET ) 2> p19.log &
( time ./nice-wrap.sh 10 $TARGET ) 2> p10.log &
( time ./nice-wrap.sh 0 $TARGET ) 2> 0.log &
( time ./nice-wrap.sh -10 $TARGET ) 2> m10.log &
stress --cpu 1 --timeout 300 &
