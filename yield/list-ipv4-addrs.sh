#!/bin/bash
for x in $(hostname -I); do
	echo IPv4 address: $x
done

