#!/bin/bash
# You might want to add a call to this script to your ~/.bashrc ...?
LC_TIME=en_US.UTF-8
dt=`date +"%A, %B %e, %k:%M"`
printf "Hi $(whoami)!\nIt's ${dt}.\n"

name=$(hostname)
ipv4=$(hostname -I | awk '{print $1}')

upsecs=$(cat /proc/uptime | cut -f1 -d" " | cut -f1 -d.)
uphours=$(expr $upsecs / 3600)
upmins=$(expr $upsecs / 60 - $uphours \* 60)
upstatus = "up ${uphours}:${upmins} h"

echo "Host: ${name}, IPv4 address: ${ipv4}, ${upstatus}"

printf "CPU: "
cat /proc/cpuinfo | grep "model name" | cut -d: -f2 | uniq | sed -e 's/^[[:space:]]*//'
distro=$(lsb_release -d | awk '{print $2 " " $3}')
kernel=$(uname -r)
echo "${distro} with kernel ${kernel}"
echo "Logged in users:"
who
rootfree=$(df -h / | tail -n1 | awk '{print $4}')
memfree=$(free -h | sed -n '2p' | awk '{print $4}')
memavail=$(free -h | sed -n '2p' | awk '{print $7}')
echo "${rootfree} free space in / and ${memfree} free / ${memavail} available RAM."
echo ""
