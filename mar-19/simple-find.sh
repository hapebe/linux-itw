#!/bin/bash
echo search files with three l in their names:
find / -name \*lll\* 2>/dev/null
echo where are there files called "mount"?
find / -name mount 2>/dev/null
echo files larger than 20MByte:
find / -size +20M 2>/dev/null
