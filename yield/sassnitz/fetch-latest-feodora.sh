#!/bin/bash
#
# This scripts assumes that there is a ~/.ssh/config entry named "leonie",
# pointing to the correct host; and providing key-based authentication
# as well.
#
printf "Fetching latest image filename ...\n"
FILENAME=`ssh leonie \~/sassnitz/latest-feodora.sh`
printf "Downloading ${FILENAME} ...\n"
scp leonie:$FILENAME .
eog `basename $FILENAME` &
