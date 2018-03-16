#!/bin/bash
echo "Namen:"
names='Horst Dieter Ina Luzie'
for i in $names
do
	echo $i
done
echo
echo "Dateien in folder:"
for filename in folder/*.txt ; do
	# avoid using the pattern itself, it there are no matches:
	[ -e $filename ] || continue

	# payload:
	echo $filename
done
