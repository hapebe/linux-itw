#!/bin/bash
if [[ $(id -u) -ne 0 ]]; then
	echo "You must be root to remove the Ethernet bridge!"
	exit 1
fi

ip link set br0 down
brctl delbr br0
