#!/bin/bash
for x in $(hostname -I); do
	if [[ ! $x == *":"* ]] ; then
		echo IPv4 address: $x
	fi
done
