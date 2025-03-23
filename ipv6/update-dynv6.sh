#!/bin/bash
# 2025-03-23 for RaspberryPi Tina via LAN:
set -o allexport
source .env
set +o allexport
./dynv6.sh hapebe.dynv6.net eth0
