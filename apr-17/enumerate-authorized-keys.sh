#!/bin/bash
#
# source:
# https://security.stackexchange.com/questions/86256/how-to-view-all-ssh-authorized-keys-for-a-unix-server
#
for X in $(cut -f6 -d ':' /etc/passwd |sort |uniq); do
    if [ -s "${X}/.ssh/authorized_keys" ]; then
        echo "### ${X}: "
        cut -d" " -f1,3 < "${X}/.ssh/authorized_keys"
        echo ""
    fi
done
