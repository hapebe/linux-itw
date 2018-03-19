#!/bin/bash
echo "Users with UIDs starting at 1000, up to 1999:"
grep -e 1[0-9][0-9][0-9] /etc/passwd 2>/dev/null | cut -d: -f1 
