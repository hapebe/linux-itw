#!/bin/bash
mdadm --create --verbose /dev/md0 --auto=yes --level=5 \
	--raid-devices=3 /dev/sdb1 /dev/sdc1 /dev/sdd1
