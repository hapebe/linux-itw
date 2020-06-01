#!/bin/bash
ffmpeg -framerate 24 -i hapebe-intro%03d.png -c:v libx264 -profile:v high -crf 10 -pix_fmt yuv420p hapebe-intro.mp4
