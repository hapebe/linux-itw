#!/bin/bash
dt=`date +"%A, %e. %B %k:%M"`
printf "Hallo $(whoami)!\nEs ist ${dt}.\n"
name=$(hostname)
ipv4=$(hostname -I | awk '{print $1}')
upstatus=$(uptime -p)
echo "Host: ${name}, IPv4-Adresse: ${ipv4}, ${upstatus}"
printf "CPU: "
cat /proc/cpuinfo | grep "model name" | cut -d: -f2 | uniq | sed -e 's/^[[:space:]]*//'
distro=$(lsb_release -d | awk '{print $2 " " $3}')
kernel=$(uname -r)
echo "${distro} mit Kernel ${kernel}"
echo "Angemeldete Benutzer:"
who
rootfree=$(df -h / | grep /dev | awk '{print $4}')
memfree=$(free -h | grep Mem | awk '{print $4}')
echo "${rootfree} freier Speicher in / und ${memfree} freies RAM."
# do we have access smartctl?
if dpkg -s smartmontools 2>/dev/null 1>&2 ; then
	printf ""
	# echo "Yeehah - we can show the SMART status..."
	# sudo smartctl -a /dev/sda
fi
echo ""
