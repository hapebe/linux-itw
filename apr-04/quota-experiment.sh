#!/bin/bash
#
# dependencies:
# apt-get install quota quotatool
# also, I needed to call:
# sudo quotaon /dev/sda8
#
# Requires one parameter
if [ $# -lt 1 ] ; then
	echo "Usage: $0 create | cleanup"
	exit 1
fi
# Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
	echo "This script must be run as root!" 1>&2
	exit 1
fi

# setup:
if [ "$1" = "create" ] ; then
	adduser --ingroup itw limitiert < adduser-input
	ID=`id -u limitiert`
	quotatool -u $ID -bq 95M -l 100M /dev/sda8
	quotacheck -mavugf
	quota -su limitiert
fi

# cleanup:
if [ "$1" = "cleanup" ] ; then
	ID=`id -u limitiert`
	quotatool -u $ID -bq 0 -l 0 /dev/sda8
	quotacheck -mavugf
	quota -su limitiert
	deluser --remove-home limitiert
fi
