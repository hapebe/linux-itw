#!/bin/bash
echo "Name of the current executable (\$0): $0"
echo "Return value of the last command (\$?): $?"
echo "Current script's PID (\$$): $$"
echo "Parameter count (\$#): $#"
if [ $# -gt 0 ] ; then
	echo "Wir haben mindestens einen Parameter!"
	echo "Liste aller Parameter (\$@): $@"
else
	echo "Wir haben keine Parameter..."
	exit 0
fi

# example usage of case:
case $1 in
	eins)
		echo "1"
		;;
	zwei)
		echo "2"
		;;
	drei)
		echo "3"
		;;
	*)
		echo "Der erste Parameter ist irgendwas unerwartetes: $1"
esac
