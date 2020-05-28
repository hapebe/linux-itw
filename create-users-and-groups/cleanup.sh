#!/bin/bash
# Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root!" 1>&2
   exit 1
fi

# delete the file tree:
rm -rf /firma

# delete the users:
deluser --remove-home einkauf1
deluser --remove-home einkauf2
deluser --remove-home verkauf1
deluser --remove-home verkauf2

# delete the groups:
delgroup einkauf
delgroup verkauf
delgroup firma
