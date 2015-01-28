## Network setup

Specify the following in `/etc/network/interfaces`, using the appropriate number in place of `XXX` (see the list of available static IP addresses in (./MachinesAndResources.md)):
```
# Our static-address ethernet interface
auto eth0
iface eth0 inet static
    address 10.22.72.XXX
    netmask 255.255.255.0
    gateway 10.22.72.254
```
