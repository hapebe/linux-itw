# Uncomment en_US.UTF-8 UTF-8 and other needed localizations in /etc/locale.gen, and generate them with:
sed -i 's/# \?de_DE.UTF-8 UTF-8/de_DE.UTF-8 UTF-8/g' /etc/locale.gen
sed -i 's/# \?en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen
locale-gen

# Set the LANG variable in locale.conf(5) accordingly, for example:
# /etc/locale.conf
echo "LANG=en_US.UTF-8" > /etc/locale.conf

# If you set the keyboard layout, make the changes persistent in vconsole.conf(5):
# /etc/vconsole.conf
echo "KEYMAP=de-latin1" > /etc/vconsole.conf

# define the hostname and hosts:
echo "arch" > /etc/hostname
echo "127.0.0.1	localhost" >>/etc/hosts
echo "::1	localhost" >>/etc/hosts
echo "127.0.0.1	arch.local	arch" >>/etc/hosts

# install NetworkManager as the component of choice
pacman -S --noconfirm networkmanager
# after booting into the new system, NetworkManager can be started
# like this:
# systemctl start NetworkManager

# set the root password:
echo "Not let's set the password for root:"
passwd

# install grub package,
pacman -S --noconfirm grub
# install grub to /dev/sda
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

