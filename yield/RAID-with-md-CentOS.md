Experiments with RAID (mdadm) in a CentOS virtual machine
=========================================================

* Created 3 VDI disks, each 4 GByte of size
* On each of the disks: create a primary partition, type FD (linux RAID auto)
* create the actual multi-disk device - see create-md0.sh
* create a file system on the RAID device: mkfs.ext4 /dev/md0
* ... and mount it: mount -t ext4 /dev/md0 /mnt/raid5
* show status of the RAID device: mdadm --detail /dev/md0

## Expand the RAID onto another disk
* Create another VDI, prepare with the same partition setup
* sudo mdadm --add /dev/md0 /dev/sdf1
* after this, the new disk is integrated as *spare disk* only!
* sudo mdadm --grow --raid-devices=4 /dev/md0
* this starts reshaping, which takes a while - status of the operation can
  be checked: cat /proc/mdstat
* finally, the filesystem also has to be adjusted:
* sudo resize2fs /dev/md0

## Simulate a drive failure
* sudo mdadm --manage /dev/md0 --fail /dev/sdd1
* ... and remove the faulty drive from the RAID config:
* sudo mdadm --remove /dev/md0 /dev/sdd1

## Simulate drive failures beyond tolerance...
* status turns to FAILED.
* small file on the RAID remains readable!
* managed to write another ~ 110 MByte to the drive, then an error occured: filesystem is read-only.
* set one of the remaining two drives to failed: nothing changed (small file is still accessible

## Stop & remove the RAID device
* sudo umount /dev/md0 (or umount /mnt/raid5)
* sudo mdadm --stop /dev/md0
* sudo mdadm --zero-superblock /dev/sdb1 [ .. /dev/sdg1 , i.e. for all pieces of the RAID compound ]

## Summary
* Normally, added disks become hot spare disks, but if the RAID is in a degraded state, they immediately become part of the active disks.
* TODO: How can notifications be sent when a disk fails?
* TODO: Is there any link to S.M.A.R.T?
* TODO: Can different disk sizes be handled?
