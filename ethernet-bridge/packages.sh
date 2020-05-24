#!/bin/bash
if [[ $(id -u) -ne 0 ]]; then
	echo "You must be root to run this script!"
	exit 1
fi

apt -o Acquire::ForceIPv4=true install bridge-utils ebtables wireshark iptraf-ng
