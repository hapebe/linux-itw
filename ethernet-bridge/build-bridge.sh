#!/bin/bash
if [[ $(id -u) -ne 0 ]]; then
	echo "You must be root to build the Ethernet bridge!"
	exit 1
fi

# I had to use two identical (including MAC address!) USB network
# adapters, so they did after all NOT have predictable interface
# names. You can probably skip this guessing game if you have better
# equipment.
#
# determine both interface names:
IF0=enx00e04c534458
IF1=enx00e04c534459
if [[ $(ip l | grep rename3) ]]; then
	IF0=rename3
	IF1=enx00e04c534458
elif [[ $(ip l | grep rename4) ]]; then
	IF0=enx00e04c534458
	IF1=rename4
fi

ip link set $IF0 down
ip link set $IF1 down

# set the second (MAC-identical!) USB network adapter's HW addr:
ip link set $IF1 address 00:e0:4c:53:44:59

brctl addbr br0
brctl addif br0 $IF0 $IF1
ip link set $IF0 up
ip link set $IF1 up
ip link set br0 up
