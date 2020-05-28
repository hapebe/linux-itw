#!/bin/bash
host=192.168.178.30
if [[ $# -gt 0 ]]; then
	host=$1
fi

tcpdump -n -r tcpdump.cap ip | grep $host > one-host-ipv4.log
