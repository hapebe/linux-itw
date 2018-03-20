#!/bin/bash
# Stores a snapshot of all /home/* folders to /tmp,
# excluding specific (large) files and some cache folders.
timestamp=$(date +'%F-%H-%M-%S')
filename="home-${timestamp}.tgz"
LOG="/var/local/bak/backup-home.log"

humantime=$(date +'%A %d. %B, %k:%M')
echo "Running backup-home at ${humantime}" >> $LOG

tar -cvzf /var/local/bak/${filename} -X backup-excluded /home >> $LOG 2>&1
# chown hapebe:itw /var/local/bak/${filename}
