#!/bin/bash
sudo nmap -p 80 192.168.20.0/24 -oG - | grep -E '(filtered|open)'
