#!/bin/bash
cd ~

if [[ 0 -eq 1 ]]; then
mkdir ~/bin
mkdir ~/Projects
cd ~/Projects

if [[ ! -d ./linux-itw ]]; then
	git clone https://github.com/hapebe/linux-itw.git
else
	cd linux-itw
	git pull
	cd ..
fi

fi

ln -s ~/Projects/linux-itw/find-utils/find-in-files.sh ~/bin/find-in-files
ln -s ~/Projects/linux-itw/yield/update-full.sh ~/bin/update-full
ln -s ~/Projects/linux-itw/yield/purge-unused-kernels.sh ~/bin/purge-unused-kernels
ln -s ~/Projects/linux-itw/yield/status.sh ~/bin/status
ln -s ~/Projects/linux-itw/yield/list-ipv4-addrs.sh ~/bin/list-ipv4-addrs.sh

# call status script at the end of .bashrc:
present=$(grep \~/bin/status ~/.bashrc)
if [[ -z $present ]]; then
	echo "#Print computer identity and memory status:" >> ~/.bashrc
	echo "~/bin/status" >> ~/.bashrc
fi
