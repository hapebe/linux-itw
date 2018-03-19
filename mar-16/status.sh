#!/bin/bash
dt=`date +"%F %T"`
printf "Hallo $(whoami)!\nEs ist ${dt}.\n"
name=$(hostname)
ipv4=$(hostname -I | awk '{print $1}')
upstatus=$(uptime -p)
echo "Host: ${name}, IPv4-Adresse: ${ipv4}, ${upstatus}"
distro=$(lsb_release -d | awk '{print $2 " " $3}')
kernel=$(uname -r)
echo "${distro} mit Kernel ${kernel}"
echo "Angemeldete Benutzer:"
who
rootfree=$(df -h / | grep /sda | awk '{print $4}')
memfree=$(free -h | grep Mem | awk '{print $4}')
echo "${rootfree} freier Speicher in / und ${memfree} freies RAM."
