#!/bin/bash
# Make sure only root can run our script
if [ "$(id -un)" != "einkauf2" ]; then
   echo "This script must be run as einkauf2!" 1>&2
   exit 1
fi
umask 007

# make sure I can access /firma, ...
cd /firma
# ... and einkauf, ...
cd einkauf
# ... can remove a directory created by another einkauf user ...
rm -rf folder-einkauf1
# can append to a file created by another einkauf user...
echo "Reaktion von einkauf2 ..." >> angebot

# in firma:
cd ..
# can I append to a file in austausch?
cd austausch
echo "Bin auch fertig! (einkauf2)" >> messages
