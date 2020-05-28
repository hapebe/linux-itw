#!/bin/bash
# Make sure only root can run our script
if [ "$(id -un)" != "einkauf1" ]; then
   echo "This script must be run as einkauf1!" 1>&2
   exit 1
fi
umask 007

# make sure I can access /firma, ...
cd /firma
# ... and einkauf, ...
cd einkauf
# ... can create a directory ...
mkdir folder-einkauf1
# ... containing a file, ...
cd folder-einkauf1
echo "Text von einkauf1" > nachrichten
# ... and can also create a file in einkauf:
cd ..
echo "Angebotstext (einkauf1)" > angebot

# in firma:
cd ..
# can we write to a file in austausch?
cd austausch
echo "So, bin fertig! (einkauf1)" > messages
