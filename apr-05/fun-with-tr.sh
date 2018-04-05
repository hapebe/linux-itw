#!/bin/bash
echo "Heute ist ein wunderschöner Tag, aber die Sonne scheint nicht mehr!" \
	| tr ö "oe" | tr [A-Z] [a-z] | tr aeiou trfsb | tr rnstl aeiou \
	| tr -s [a-z]

echo "Heute ist ein wunderschöner Tag, aber die Sonne scheint nicht mehr!" \
	| tr ö "oe" | tr [A-Z] [a-z] \
	| tr abcdefghijklmnopqrstuvwxyz zyxwvutsrqponmlkjihgfedcba
