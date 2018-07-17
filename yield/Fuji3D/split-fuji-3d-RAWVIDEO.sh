#!/bin/bash
# this script generates usable input for Corel Video Studio 9 (lossless!)
# ffprobe $1
ffmpeg -i $1 \
	-c:v rawvideo -pix_fmt bgr24 -vtag "DIB " -c:a copy $1.left-audio.avi -map 0:2 -map 0:1 \
	-c:v rawvideo -pix_fmt bgr24 -vtag "DIB " -an $1.right.avi -map 0:0

