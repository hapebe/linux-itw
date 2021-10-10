#!/bin/bash
# this script generates usable input for Corel Video Studio 9 (lossless!)
basename=${1%.*}
# ffprobe $1
ffmpeg -i $1 \
	-c:v huffyuv -c:a copy $basename.left-audio.avi -map 0:2 -map 0:1 \
	-c:v huffyuv -an $basename.right.avi -map 0:0
# both files -vtag "HFYU" ?
