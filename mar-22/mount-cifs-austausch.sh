#!/bin/bash
# Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root!" 1>&2
   exit 1
fi
# before you can mount CIFS shares, you have to run (Ubuntu...):
#  sudo apt-get install cifs-utils
if [[ -z $1 ]] ; then
	# mount for hapebe:itw (1000:1001)
	mount -t cifs -o credentials=/home/hapebe/.config/.cred-austausch,iocharset=utf8,uid=1000,gid=1001 //192.168.20.250/austausch /media/hapebe/austausch
	echo "Mounted!"
else
	# to unmount:
	umount /media/hapebe/austausch
	echo "Unmounted!"
fi
