#!/bin/bash
# works well:
# tail -n5 passwd | awk -F: '{print $1 ":" $2 ":" $7 ":" $3 ":" $4 ":" $5 ":" $6}'

# also works well: spaces are replaces with : using sed...
tail -n5 passwd | awk -F: '{print $1,$2,$7,$3,$4,$5,$6}' | sed 's/  */\:/g'

# this does NOT work with cut - it does only selected the correct fields,
# but does not adjust the order of fields.
# cat passwd | cut -d':' -f1,2,7,3,4,5,6
