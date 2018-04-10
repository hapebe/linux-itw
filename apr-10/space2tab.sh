#!/bin/bash
unexpand -t8 text-with-spaces > text-with-tabs
#
# The resulting text file can be inspected using:
#   cat -T text-with-tabs
#
echo "Resulting file:"
cat -T text-with-tabs
