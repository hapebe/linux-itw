#!/bin/bash
read
# if no target variable name is given, read stores everything in $REPLY
if [ -z $REPLY ] ; then
	echo "Leere Eingabe..."
fi
echo $REPLY
