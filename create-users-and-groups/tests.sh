#!/bin/bash
# Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root!" 1>&2
   exit 1
fi

# create a "clean" /firma fs and user structure:
source ./cleanup.sh
source ./create.sh
clear
echo "Tests für die Infrastruktur von \"firma\":"

# create text variables for pass/fail messages:
pass="    PASS     "
fail="*** FAIL *** "

# make sure einkauf1 can and create dirs and files as desired:
sudo -u einkauf1 tests/einkauf1-create.sh
# check as root:
if [ ! -d "/firma/einkauf/folder-einkauf1" ]; then
	echo "${fail} Der Ordner \"folder-einkauf1\" konnte von User einkauf1 nicht angelegt werden." 1>&2
else
	echo "${pass} User einkauf1 kann Ordner in einkauf anlegen."
fi
if [ ! -f "/firma/einkauf/folder-einkauf1/nachrichten" ]; then
	echo "${fail} Die Datei \"nachrichten\" konnte von User einkauf1 nicht angelegt werden." 1>&2
else
	echo "${pass} Die Datei \"nachrichten\" konnte von User einkauf1 angelegt werden."
fi
if [ ! -f "/firma/einkauf/angebot" ]; then
	echo "${fail} Die Datei \"angebot\" konnte von User einkauf1 nicht angelegt werden." 1>&2
else
	echo "${pass} Die Datei \"angebot\" konnte von User einkauf1 angelegt werden."
fi
if [ ! -f "/firma/austausch/messages" ]; then
	echo "${fail} Die Datei \"messages\" in austausch konnte von User einkauf1 nicht angelegt werden." 1>&2
else
	echo "${pass} Die Datei \"messages\" in austausch konnte von User einkauf1 angelegt werden."
fi

# make sure einkauf2 can act on files by other einkauf users:
sudo -u einkauf2 tests/einkauf2-create.sh
# check as root:
if [ -d "/firma/einkauf/folder-einkauf1" ]; then
	echo "${fail} Der Ordner \"folder-einkauf1\" konnte von User einkauf2 nicht gelöscht werden." 1>&2
else
	echo "${pass} User einkauf2 kann \"fremde\" Ordner in einkauf löschen."
fi
if grep -q einkauf2 /firma/einkauf/angebot; then
	echo "${pass} User einkauf2 kann an eine Datei eines Kollegen anhängen."
else
	echo "${fail} User einkauf2 kann nicht an eine Datei eines Kollegen anhängen." 1>&2
fi
if grep -q einkauf2 /firma/austausch/messages; then
	echo "${pass} User einkauf2 kann an eine fremde Datei in austausch anhängen."
else
	echo "${fail} User einkauf2 kann nicht an eine fremde Datei in austausch anhängen." 1>&2
fi
