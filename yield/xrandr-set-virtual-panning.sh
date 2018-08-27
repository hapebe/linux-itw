#!/bin/bash
if [ $# -eq 0 ] ; then
	echo "usage:"
	echo "$0 <virtual resolution>"
	printf "\te.g. $0 2560x1440\n"
	echo "or:"
	echo "$0 off"
	echo ""
	echo "This script assumes that there is a single display connected."
	exit 0
fi
CURRENT_OUTPUT=`xrandr -q | grep " connected" | cut -d" " -f1`
CURRENT_MODE=`xvidtune -show | cut -d" " -f1 | tr -d \"`
if [ $1 = "off" ] ; then
	xrandr --output $CURRENT_OUTPUT --rate 60 --mode $CURRENT_MODE --fb $CURRENT_MODE --panning $CURRENT_MODE --scale 1x1
else
	xrandr --output $CURRENT_OUTPUT --rate 60 --mode $CURRENT_MODE --fb $1 --panning $1
fi
