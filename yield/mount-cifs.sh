#!/bin/bash
# Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root!" 1>&2
   exit 1
fi

installed=$(dpkg -l | grep cifs-utils)
if [[ -z $installed ]]; then
	sudo apt -y install cifs-utils
fi

u=hapebe
uid=$(id -u $u)
gid=$(id -g $u)
serviceurl=//lea.fritz.box/samba
mountpoint=/media/${u}/samba

if [[ -z $1 ]] ; then
	mkdir -p $mountpoint
	echo "mount -t cifs -o credentials=/home/${u}/.config/.cred,iocharset=utf8,uid=$uid,gid=$gid $serviceurl $mountpoint"
	mount -t cifs -o credentials=/home/${u}/.config/.cred,iocharset=utf8,uid=$uid,gid=$gid $serviceurl $mountpoint
	if [[ $? -eq 0 ]]; then
		echo "Mounted!"
	else
		echo "Could not mount ${serviceurl}!"
	fi
else
	# to unmount:
	umount -fl $mountpoint
	echo "Unmounted!"
fi
