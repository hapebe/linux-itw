#!/bin/bash
if [ $# -lt 1 ] ; then
	echo "Usage: $0 [directory] <search string>"
	exit 1
fi
if [ $# -eq 1 ] ; then
	TOPDIR=$(pwd -P)
	SEARCH=$1
fi
if [ $# -eq 2 ] ; then
	TOPDIR=$1
	SEARCH=$2
fi
if [ ! -d $TOPDIR ] ; then
	echo "Error: $TOPDIR is not directory or cannot be accessed."
	exit 1
fi
MYPATH=$(dirname $0)
echo "Searching for \"$SEARCH\" in directory $TOPDIR ..."
find $TOPDIR -type f \
! -path "/dev/*" \
! -path "/proc/*" \
! -path "/sys/*" \
! -path "/mnt/*" \
! -path "/var/log/*" \
! -path "/run/user/*/gvfs/*" \
! -path "*/.cache/*" \
! -name "*.iso" \
! -name "*.vdi" \
-exec $MYPATH/grep-file.sh "$SEARCH" {} ';' \
2>/dev/null
