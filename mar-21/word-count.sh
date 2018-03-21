#!/bin/bash
if [ $# -lt 1 ] ; then
	echo "Usage: $0 <filename>"
	exit 1
fi
if [[ ! -f $1 ]] ; then
	echo "File $1 does not exist." 1>&2
	exit 1
fi
lines=$(wc -l $1 | awk '{print $1}')
words=$(wc -w $1 | awk '{print $1}')
chars=$(wc -m $1 | awk '{print $1}')
echo "Die Datei $1"
echo " hat $lines Zeilen"
echo " hat $words Wörter"
echo " hat $chars Zeichen"
