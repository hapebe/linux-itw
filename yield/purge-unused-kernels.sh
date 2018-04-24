#!/bin/bash
# source:
# https://askubuntu.com/questions/2793/how-do-i-remove-old-kernel-versions-to-clean-up-the-boot-menu
#
echo "The following packages will be purged:"
dpkg --list | grep linux-image | awk '{ print $2 }' \
	| sort -V | sed -n '/'`uname -r`'/q;p'

if [ $(id -u) -ne 0 ] ; then
	echo "In order to actually remove kernels, this script must be run as root."
	exit 1
fi

read -p "Are you sure you want to do that? (y/N) " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
	dpkg --list | grep linux-image | awk '{ print $2 }' \
	| sort -V | sed -n '/'`uname -r`'/q;p' \
	| xargs sudo apt-get -y purge
fi
