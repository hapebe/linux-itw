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
	mount -t cifs -o credentials=/home/hapebe/.config/.cred-T29476,iocharset=utf8,uid=1000,gid=1001 //172.16.0.150/T29476$ /media/hapebe/T29476
	echo "Mounted!"
else
	# to unmount:
	umount /media/hapebe/T29476
	echo "Unmounted!"
fi
