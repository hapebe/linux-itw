#!/bin/bash
# this script unfortunately does not produce usable input for Corel Video Studio 9
basename=${1%.*}
# ffprobe $1
ffmpeg -i $1 \
	-codec copy -vtag MJPG $basename.left-audio.avi -map 0:2 -map 0:1 \
	-codec copy -vtag MJPG -an $basename.right.avi -map 0:0
