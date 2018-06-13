#!/bin/bash
sudo nmap -sU --script nbstat.nse -p137 $1
