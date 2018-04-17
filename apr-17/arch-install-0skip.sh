#!/bin/bash
#
# This script should be run instead of the full "0" script,
# if the latter has already been completed once, but you have
# rebooted since
#
loadkeys de-latin1
mount /dev/sda1 /mnt
arch-chroot /mnt
