#!/bin/bash
if [ $# -lt 1 ] ; then
	echo "Usage: $0 <search string>"
	exit 1
fi
find / -type f \
! -path "/dev/*" \
! -path "/proc/*" \
! -path "/var/log/*" \
! -path "/sys/*" \
! -path "*/.cache/*" \
! -path "/run/user/*/gvfs/*" \
! -name "*.iso" \
! -name "*.vdi" \
-exec ./grep-file.sh $1 {} ';' \
2>/dev/null
