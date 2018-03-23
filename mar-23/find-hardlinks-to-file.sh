#!/bin/bash
if [ -z "$1" ] ; then
	echo "Find all hard links to a given file."
	echo "Usage: $0 <filename>"
	exit 1
fi
find / -samefile $1 2>/dev/null
