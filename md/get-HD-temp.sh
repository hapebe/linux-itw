#!/bin/bash
device="/dev/sda"
if [ $(id -u) -ne 0 ] ; then
	echo "This script must be run as root.";
	exit 1
fi
if [ $# -gt 0 ] ; then
	device=$1
fi
# when running from cron, /usr/sbin is not in path apparently?
/usr/sbin/smartctl -A ${device} | grep 194 | awk '{ print $10 }'
