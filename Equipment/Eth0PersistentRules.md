When making a clone of the Atom debian install note that eth0 and eth1 are captured in /etc/udev/rules.d/70-persistent-net.rules.

When the clone disk boots on the new hardware the first and second ether ports will UUID as eth2 and eth3.

The etherports can be seen by using 

lspci and looking for the Realtek ether controllers and /sbin/ifconifg -a to see if the driver are installed.

If ifconfig -a shows eth2 and eth3 then the persistent rules need to be cleaned up.

As root move the persistent rules file to /root/, mostly just to archive it, and reboot the system.

Without an existing persistent rules file the system will enumerate the first and second ether ports as eth0 and eth1.

sudo mv /etc/udev/rules.d/70-persistent-net.rules /root/
sudo vi /etc/network/interfaces <- setup eth0 to config on boot
sudo reboot

after system reboot check ports with /sbin/ifconfig -a

