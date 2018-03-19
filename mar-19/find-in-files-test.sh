#!/bin/bash
if [ $# -lt 1 ] ; then
	echo "Usage: $0 <search string>"
	exit 1
fi
find / -type f \
! -path "/dev/*" \
! -path "/proc/*" \
! -path "/sys/*" \
2>/dev/null \
| wc -l
