#!/bin/bash
#
# this is intended to complement an entry in /etc/aliases:
# "myprocessor:      |/home/hapebe/...../mail-proc.sh"
#
# remember to run "newaliases" after modyfying that config file!
# newaliases was originally part of sendmail, but postfix (and
# probably other MTAs) provides a compatibility layer for this.
#

SCRIPT=$(readlink -f $0)
SCRIPTPATH=`dirname $SCRIPT`

LOGFILE=${SCRIPTPATH}/mail-proc.log
echo "This script ($0) has been called with $# parameters." >> $LOGFILE
for param in $@ ; do
	echo "Parameter: $param" >> $LOGFILE
done
echo "--- end of params" >> $LOGFILE
echo "" >> $LOGFILE
echo "STDIN:" >> $LOGFILE
while read line ; do
	echo $line >> $LOGFILE
done
echo "--- end of STDIN" >> $LOGFILE
echo "" >> $LOGFILE
