#!/bin/bash
# Stores a snapshow of all /home/* folders to /tmp,
# excluding specific (large) files and some cache folders.
filename="home-$(date +'%F-%H-%M-%S').tar.gz"
tar -cvzf /tmp/${filename} -X backup-excluded /home
