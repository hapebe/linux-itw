#!/bin/bash
echo "Hallo $(whoami)!"
dt=`date +"%F %T"`
echo "Datum und Zeit: $dt, Rechner ist $(uptime -p)"
echo "Hostname: $(hostname)"
echo "IPv4-Adresse: $(hostname -I)" 
echo "Angemeldete Benutzer:"
who
echo "Speicher-Status:"
df -h / | grep /dev/
