#!/bin/bash
if [ $# -lt 1 ] ; then
	echo "Usage: $0 <search string>"
	exit 1
fi
find / -type f \
! -path "/dev/*" \
! -path "/proc/*" \
! -path "/sys/*" \
! -path "/mnt/*" \
! -path "/var/log/*" \
! -path "/run/user/*/gvfs/*" \
! -path "*/.cache/*" \
! -name "*.iso" \
! -name "*.vdi" \
-exec ./grep-file.sh $1 {} ';' \
2>/dev/null
