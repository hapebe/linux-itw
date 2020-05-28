Soft RAID using mdadm
=====================

* Install package:
sudo apt-get install mdadm

* Verify the corresponding kernel module is active:
lsmod | grep md_mod
(if not active, use insmode or modprobe)

* Prepare the disks:
Create a single primary partition of type 0xFD ('Linux RAID')

* Create the RAID device:
mdadm --create --verbose /dev/md0 --auto=yes --level=5 --raid-devices=4 /dev/sdb1 /dev/sdc1 /dev/sdd1 /dev/sde1

* Configuration file(s):
/etc/mdadm/mdadm.conf
Regenerate: (?)
mdadm --detail --scan >> /etc/mdadm/mdadm.conf

* Create a filesystem on the RAID device:
mkfs.ext4 /dev/md0

* Mount the RAID fs:
mkdir /raid5
mount -t ext4 /dev/md0 /raid5
(umount /raid5)

* Some tests:
cat /proc/mdstat
df -h /dev/md0
mdadm --detail /dev/md0

* Add a record to /etc/fstab
/dev/md0 /raid5 ext4 defaults 0 0
