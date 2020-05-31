#!/bin/bash
source ./.cred
URL=https://$USER:$PASSWD@ipv4.tunnelbroker.net/nic/update?hostname=$HOSTNAME
# echo $URL
wget -a /root/tunnelbroker.log -O /root/tunnelbroker.out -4 --no-check-certificate $URL
