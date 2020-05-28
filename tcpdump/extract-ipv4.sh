#!/bin/bash
# source address:
FIELDNO=3
if [ $# -gt 0 ]; then
	FIELDNO=$1
fi
tcpdump -n -r tcpdump.cap ip > tcpdump-ipv4.log
cut -d" " -f${FIELDNO} tcpdump-ipv4.log | sort -n | uniq > ipv4-with-port.log
cut -d. -f1,2,3,4 ipv4-with-port.log | sort -n | uniq | tee ipv4-unique.log
cut -d. -f5 ipv4-with-port.log | sort -n | uniq > ipv4-ports-unique.log
