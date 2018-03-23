#!/bin/bash
if [ -z $1 ] ; then
	mount 192.168.20.54:/export /media/hapebe/freigabe
else
	# assume we should unmount the share:
	umount /media/hapebe/freigabe
fi
