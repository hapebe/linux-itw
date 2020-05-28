#!/bin/bash
if [ $# -lt 2 ] ; then
	echo "Please provide at least two parameters for this script!"
	exit 1
fi

echo "The first two parameters are \$1 and \$2:"

echo "\$1: $1"
echo "\$2: $2"

echo "Now with shift:"

echo "\$1: $1"
shift
echo "\$1: $1"
