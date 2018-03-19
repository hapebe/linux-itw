#!/bin/bash
# yes, for this syntax you actually use "<" and no $ in
# front of the variable name!
for ((i=0; i<5; i++)) ; do
	echo $i
done
