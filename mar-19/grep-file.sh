#!/bin/bash
# expects two parameters:
# $1 = <pattern>
# $2 = <filename>
if grep -q $1 "$2" ; then
	echo "#### $2"
	# this adds line numbers to the file before searching (and printing matches)
	cat -n $2 | grep $1
fi
