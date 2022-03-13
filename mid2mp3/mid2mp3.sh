#!/bin/bash
set -o xtrace
for f in "$@" ; do
	basename=${f%.*}
	timidity -Ow -o "${basename}.wav" "$f"
	lame -h -mm -b64k "${basename}.wav" "${basename}.mp3"
	rm "${basename}.wav"
done
set +o xtrace
