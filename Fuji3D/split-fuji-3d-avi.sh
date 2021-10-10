#!/bin/bash
# this script generates usable input for CorelVideo Studio X9 (!)
# ffprobe $1
basename=${1%.*}
ffmpeg -i $1 \
	-c:v mpeg4 -vtag xvid \
	-qscale:v 3 -ar 48000 -c:a libmp3lame -b:a 128k $basename.left-audio.avi -map 0:2 -map 0:1 \
	-qscale:v 3 -an $basename.right.avi -map 0:0
# ffmpeg -i $1 \
#	-ar 48000 -acodec mp3 left-audio.mp4 -map 0:2 -map 0:1 \
#	-an right.mp4 -map 0:0 \
#	 -c:v libx264 -profile:v high -crf 10 -pix_fmt yuv420p
