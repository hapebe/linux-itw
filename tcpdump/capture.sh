#!/bin/bash
# the normal user to grant log file ownership to:
u=hapebe

if [[ $(id -u) -ne 0 ]]; then
	echo "This script must be run as root."
	exit 1
fi

n=$(ls /sys/class/net | grep enp | wc -l)
if [[ $n -ne 1 ]]; then
	echo "This computer has $n ethernet adapters. You can only use this script with exactly one such NIC."
	exit 1
fi

# we are looking for exactly one Ethernet interface:
iface=$(ls /sys/class/net | grep enp)

ip link set $iface promisc on

rm tcpdump.cap

echo "Now starting tcpdump..."
sudo tcpdump -i $iface -n -U -w tcpdump.cap &
sleep 5

pid=$(ps -e | pgrep tcpdump)

# a total time of one minute:
sleep 55

# a total time of one hour:
sleep 3540

kill -2 $pid

chown $u:$u tcpdump.cap
