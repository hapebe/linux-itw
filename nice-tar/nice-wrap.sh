#!/bin/bash
# echo $# $0 $1
if [[ $# -lt 2 ]]; then
	echo "Usage nice-wrap.sh {niceness} {target}."
	exit 1
fi
niceness=$1
TARGET=$2

nice -n $niceness tar -cJf /tmp/nice-tar-$niceness.tar.xz $TARGET
