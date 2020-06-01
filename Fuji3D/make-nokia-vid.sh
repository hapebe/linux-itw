#!/bin/bash
# -crf is the actual quality value (0..100, where 0 is best, and 20 typically just good)
ffmpeg -i $1 \
	-vf scale=1920x1080:flags=lanczos \
	-c:v libx264 -preset slow -crf 30 -pix_fmt yuv420p \
	-c:a aac -b:a 128k -strict -2 \
	nokia.mp4
