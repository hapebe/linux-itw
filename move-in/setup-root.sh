#!/bin/bash
if [[ $(id -u) -ne 0 ]]; then
	echo "This script must be run as root."
	exit 1
fi

# The script assumes that "my" username is: hapebe
u=hapebe

apt update
apt -y install \
	tasksel \
	htop iotop ranger net-tools hardlink smartmontools inxi \
	openssh-server \
	tilix mutt whois \
	gnome-calculator libreoffice-wiki-publisher \
	gnome-tweak-tool gnome-tweaks \
	jpeginfo jp2a \
	ffmpeg mplayer vlc \
	lilypond frescobaldi timidity \
	git meld \
	dkms build-essential apt-file stress-ng \
	cifs-utils samba \
	zenmap wireshark \
	sgt-puzzles bsdgames gnome-chess quadrapassel \
	oneko cmatrix cowsay fortune sl

apt-file update

# TODO Arc Menu etc.

echo "Consider Atom ..."
echo "Think about freeciv, freecol, wesnoth, nethack-x11 ..."

mkdir -p /var/local/backup/${u}
chown -R $u:$u /var/local/backup/${u}
