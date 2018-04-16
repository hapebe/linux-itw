#!/bin/bash
#
# this is intended to complement an entry in /etc/aliases:
# processor:      "|/home/hapebe/linux-grundlagen/apr-13/mail-proc.sh"
#
# remember to run "newaliases" after modyfying that config file!
# newaliases was originally part of sendmail, but postfix (and 
# probably other MTAs) provides a compatibility layer for this.
#

LOGFILE=/home/hapebe/linux-grundlagen/apr-13/mail-proc.log
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
