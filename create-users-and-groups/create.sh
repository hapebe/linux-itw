#!/bin/bash
# Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root!" 1>&2
   exit 1
fi

# create groups, if necessary:
addgroup firma
addgroup einkauf
addgroup verkauf

# create users:
# read interactive input from file "adduser-input" instead from console!
adduser --ingroup firma einkauf1 < adduser-input
adduser --ingroup firma einkauf2 < adduser-input
adduser --ingroup firma verkauf1 < adduser-input
adduser --ingroup firma verkauf2 < adduser-input
# modify the standard umask for the new users (in their personal .profile files):
sed -i -- 's/#umask 022/umask 007/g' /home/einkauf1/.profile
sed -i -- 's/#umask 022/umask 007/g' /home/einkauf2/.profile
sed -i -- 's/#umask 022/umask 007/g' /home/verkauf1/.profile
sed -i -- 's/#umask 022/umask 007/g' /home/verkauf2/.profile

# add users to additional groups:
usermod -aG einkauf einkauf1
usermod -aG einkauf einkauf2
usermod -aG verkauf verkauf1
usermod -aG verkauf verkauf2

# create file system tree:
mkdir -p /firma/einkauf
mkdir -p /firma/verkauf
mkdir -p /firma/austausch

# create ownership and file access modes:
chown -R root:firma /firma
chmod -R 770 /firma
chmod 750 /firma
# set set-GUID-bit for the sub-folders:
chmod g+s /firma/austausch
chmod g+s /firma/einkauf
chmod g+s /firma/verkauf

# change group association of the special folders:
chgrp einkauf /firma/einkauf
chgrp verkauf /firma/verkauf

# create symbolic links for firma users
ln -s /firma /home/einkauf1/firma
chown einkauf1:firma /home/einkauf1/firma
ln -s /firma /home/einkauf2/firma
chown einkauf2:firma /home/einkauf2/firma
ln -s /firma /home/verkauf1/firma
chown verkauf1:firma /home/verkauf1/firma
ln -s /firma /home/verkauf2/firma
chown verkauf2:firma /home/verkauf2/firma
