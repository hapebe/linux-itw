#!/bin/bash
source ./compare-floats.sh

printf "Enter floating point number A: "
read A
printf "Enter floating point number B: "
read B

echo "A = $A, B = $B"

float_a_is_greater_than_b $A $B
if [ $? -eq 1 ]; then
	echo "A is greater than B."
else
	echo "A is not greater than B."
fi

