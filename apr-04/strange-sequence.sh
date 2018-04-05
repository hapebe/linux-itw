#!/bin/bash
echo '1 2 3 4 5 6' | while read a b c; do
	echo result: $c $b $a;
done
