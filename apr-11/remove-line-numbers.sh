#!/bin/bash
if [ -z $1 ] ; then
	echo "Usage: $0 <source file (text)>"
	exit 1;
fi
# works:
# cut -c 8- $1
# also works, because nl apparently sets a tab stop 
# after the line numbers:
cut -f2 $1
