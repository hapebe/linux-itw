#!/bin/bash
# this script unfortunately does not produce usable input for Corel Video Studio 9
# ffprobe $1
ffmpeg -i $1 \
	-codec copy -vtag MJPG $1.left-audio.avi -map 0:2 -map 0:1 \
	-codec copy -vtag MJPG -an $1.right.avi -map 0:0
