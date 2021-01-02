## Thunderbolt3/USB4 stack ##

Contact: Scott Long <scottl@freebsd.org>  

This project implements a driver stack for Thunderbolt3 and USB4.  These
technologies differ radically from USB3 and prior, and require completely new
drivers for the host interface adapter and topology as well as configuration
management layers.  At their most fundamental level, a TBT3/USB4 topology
appears as PCI bridges and buses, and attached devices appear as either PCI
devices, USB3 devices, or DisplayPort devices.  Early TBT3 controllers don't
even appear in the system topology unless a TBT3 device is plugged in.  These
early TBT3 systems also implement a security policy meant to protect against
unauthorised or malicious devices, though that scheme has been proven to not
be effective and has been removed from later TBT3 and USB4 implementations.
Besides security control, the TBT3/USB4 stack controls power management and
topology hotplug.

The FreeBSD driver currently supports Alpine Ridge and Ice Lake TBT3
controllers, and can perform basic security validation and topology awareness. 
USB4 support as well as full connection manager and power management support is
still being worked on.  The current driver will be committed to FreeBSD in
early January 2021.

Though this work is not sponsored, it has been done with the encouragement and
support of the FreeBSD Foundation and Netgate.
