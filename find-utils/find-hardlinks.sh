#!/bin/bash
if [[ $# -lt 1 ]]; then
	echo "Usage: $0 directory"
	exit 0
fi
find $1 -type f -links +1 2>/dev/null -exec ls -i {} ';' | sort
