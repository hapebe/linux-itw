#!/bin/bash
if [ $# -lt 1 ] ; then
	echo "Usage: $0 <filename>"
	exit 1
fi
if [[ ! -f $1 ]] ; then
	echo "File $1 does not exist." 1>&2
	exit 1
fi
stats=`wc $1`
lines=`echo $stats | awk '{print $1}'`
words=`echo $stats | awk '{print $2}'`
chars=`echo $stats | awk '{print $3}'`
unset stats
printf "Die Datei $1 "
printf "hat $lines Zeilen, "
printf "$words Wörter und "
echo "$chars Zeichen"
