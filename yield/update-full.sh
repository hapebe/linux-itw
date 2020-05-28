#!/bin/bash
if [ $(id -u) -ne 0 ] ; then
	echo "This script must be run as root.";
	exit 1
fi
apt-get update; apt-get -y dist-upgrade; apt-get autoremove; apt-get autoclean
