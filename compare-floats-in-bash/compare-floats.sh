#!/bin/bash
float_a_is_greater_than_b() {
	a=$1
	b=$2
	if (( $(echo "$a > $b" | bc -l) )); then
		return 1
	fi
	return 0
}
