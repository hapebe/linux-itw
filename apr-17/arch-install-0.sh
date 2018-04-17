#!/bin/bash
#
# This is a script to automate install of an ArchLinux system on
# a fresh HDD.
# It follows the recommendations given in "install.txt" on the
# ArchLinux distribution CD.
#
loadkeys de-latin1
timedatectl set-ntp true

# partition the primary HDD: GPT, /dev/sda1 becomes the root partition
sfdisk /dev/sda < ./arch-sda.sfdisk
mkfs.ext4 /dev/sda1
mkswap /dev/sda4
swapon /dev/sda4
mount /dev/sda1 /mnt

# install the base package(s):
pacstrap /mnt base
# generate the basic fstab:
genfstab -U /mnt >> /mnt/etc/fstab

# chroot into the new system:
arch-chroot /mnt

# further time/date adjustments:
ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
hwclock --systohc
