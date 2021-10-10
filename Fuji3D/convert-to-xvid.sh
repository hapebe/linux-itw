#!/bin/bash
basename=${1%.*}
ffmpeg -i $1 \
	-c:v mpeg4 -vtag xvid -qscale:v 3 \
	-c:a libmp3lame -b:a 128k  \
	$basename.xvid.avi
