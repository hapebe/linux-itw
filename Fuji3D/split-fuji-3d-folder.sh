#!/bin/bash
if [ $# -lt 1 ] ; then
	echo "usage $0 <folder containing Fuji 3D source AVI files>"
	exit 1
fi

find $1 -iname "*.avi" -type f -exec ./split-fuji-3d-avi.sh {} \;
