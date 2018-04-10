#!/bin/bash
#
# When piping find output containing spaces into xargs, 
# there are corresponding options to produce and consume
# 0-terminated strings:
#
find ~ -name "*.sh" -print0 | xargs -0 ls -l
