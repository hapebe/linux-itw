#!/bin/bash

# list contents of /bin,
# add line numbers,
# extract lines 50..60,
# only print some columns:

ls -l /bin | \
cat -n | \
head -n 60 | \
tail -n 11 | \
awk '{print $1 ". " $4 " " $5 " " $10}'
