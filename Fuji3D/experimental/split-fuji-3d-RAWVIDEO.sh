#!/bin/bash
# this script generates usable input for Corel Video Studio 9 (lossless!)
# ... unfortunately not usable for Corel Video Studio X9 the same way *facepalm*
basename=${1%.*}
# ffprobe $1
ffmpeg -i $1 \
	-c:v rawvideo -pix_fmt bgr24 -vtag "RV24" -c:a copy $basename.left-audio.avi -map 0:2 -map 0:1 \
	-c:v rawvideo -pix_fmt bgr24 -vtag "RV24" -an $basename.right.avi -map 0:0
# without -pix_fmt und -vtag this results in yuvj422p with FourCC "Y42B"

# -pix_fmt bgr24 ?
# -vtag "DIB " ?
# -vtag "RV24" ?
