#!/bin/bash
if [ $# -lt 3 ] ; then
	echo "Usage: $0 <folder name> <file name> <text>"
	exit 1
fi

if [ ! -d $1 ]; then mkdir $1; fi
echo $3 >> $1/$2

echo "Inhalt von $1/$2:"
cat $1/$2
wcoutput=`wc -l $1/$2`
# split fields of string into $1, $2, $3 ...
set -- $wcoutput
echo "Das sind $1 Zeilen."
