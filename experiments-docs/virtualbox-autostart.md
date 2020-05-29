# Start my OpenSuSe VirtualBox machine automatically on system start
_(preferably after reaching "runlevel 3")_

Having set up squid and BIND on the SuSe machine, I wish to use 
them as inobtrusive infrastructure service - i.e. available right 
after turning on the computer running the host system 
(Ubuntu desktop).

I use 
https://askubuntu.com/questions/404665/how-to-start-virtual-box-machines-automatically-when-booting
as a starting point. Turns out the autostart configuration file should NOT be named vbox.cfg, but autostart.cfg instead.
http://cmhramblings.blogspot.de/2015/06/virtualbox-autostart-on-boot.html
cites the above link and makes some improvements (scripts instead 
of manual editing for the configuration files.

Finally, use the following command to check running VMs:
```
vboxmanage list runningvms
```
