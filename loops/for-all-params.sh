#!/bin/bash
echo "Print all Parameters in a loop - i.e. one per line:"
for i in $@
do
	echo $i
done
