#!/bin/bash
# unfortunately did not work for me...
git rev-list --all | \
xargs -n1 -iX sh -c "git ls-tree --full-tree -r X | grep $1 && echo X"
# xargs -n1 -iX sh -c "git ls-tree --full-tree -r X"
