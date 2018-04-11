#!/bin/bash
if [ -z $1 ] ; then
	echo "Usage: $0 <source file (text)>"
	exit 1;
fi
nl $1 > text-with-line-numbers
