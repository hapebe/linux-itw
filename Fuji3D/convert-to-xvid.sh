#!/bin/bash
ffmpeg -i $1 \
	-c:v mpeg4 -vtag xvid -qscale:v 3 \
	-c:a libmp3lame -b:a 128k  \
	$1.xvid.avi
