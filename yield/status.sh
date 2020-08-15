#!/bin/bash
# You might want to add a call to this script to your ~/.bashrc ...?
DIR="$( cd "$( dirname $( readlink -f "${BASH_SOURCE[0]}" ) )" >/dev/null 2>&1 && pwd )"

LC_TIME=en_US.UTF-8
dt=`date +"%A, %B %e, %k:%M"`
printf "Hi $(whoami)!\nIt's ${dt}.\n"

name=$(hostname)

upsecs=$(cat /proc/uptime | cut -f1 -d" " | cut -f1 -d.)
uphours=$(expr $upsecs / 3600)
printf -v upmins "%02d" $(expr $upsecs / 60 - $uphours \* 60)
upstatus="up ${uphours}:${upmins} h"

echo -n "Host: "; printf '\033[34m\033[1m'; echo -n ${name}; printf '\033[39m \033[0m'
echo ", ${upstatus}"

printf "CPU: "
cpuinfo=$(cat /proc/cpuinfo | grep "model name" | cut -d: -f2 | uniq | sed -e 's/^[[:space:]]*//')
printf 'CPU %s ' "$cpuinfo"
# see if we can get temperature:
source /etc/os-release
if [[ "$ID" = "raspbian" ]]; then
	vcgencmd measure_temp | cut -d= -f2
fi

distro=$(lsb_release -d | awk '{print $2 " " $3}')
kernel=$(uname -r)
echo "${distro} with kernel ${kernel}"

$DIR/list-ipv4-addrs.sh

echo "Logged in users:"
who
rootfree=$(df -h / | tail -n1 | awk '{print $4}')
memfree=$(free -h | sed -n '2p' | awk '{print $4}')
memavail=$(free -h | sed -n '2p' | awk '{print $7}')
echo "${rootfree} free space in / and ${memfree} free / ${memavail} available RAM."
echo ""
