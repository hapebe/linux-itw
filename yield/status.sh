#!/bin/bash
# You might want to add a call to this script to your ~/.bashrc ...?
dt=`date +"%A, %e. %B %k:%M"`
printf "Hi $(whoami)!\nIt's ${dt}.\n"
name=$(hostname)
ipv4=$(hostname -I | awk '{print $1}')
upstatus=$(uptime -p)
echo "Host: ${name}, IPv4 address: ${ipv4}, ${upstatus}"
printf "CPU: "
cat /proc/cpuinfo | grep "model name" | cut -d: -f2 | uniq | sed -e 's/^[[:space:]]*//'
distro=$(lsb_release -d | awk '{print $2 " " $3}')
kernel=$(uname -r)
echo "${distro} with kernel ${kernel}"
echo "Logged in users:"
who
rootfree=$(df -h / | tail -n1 | awk '{print $4}')
memfree=$(free -h | grep Mem | awk '{print $4}')
memavail=$(free -h | grep Mem | awk '{print $7}')
echo "${rootfree} free space in / and ${memfree} free / ${memavail} available RAM."
echo ""
