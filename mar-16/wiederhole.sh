#!/bin/bash
if [ $# -lt 2 ] ; then
	echo "Usage: $0 <repeat count> <text to repeat>"
	exit 1
fi
re='^[0-9]+$'
if ! [[ $1 =~ $re ]] ; then
	echo "Error: Parameter 1 ($1) is not a number." >&2
	exit 1
fi

# everythings looks okay:
i=1
while [ $i -le $1 ]
do
	echo $i. $2
	let i=$i+1
done
