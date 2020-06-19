## PCI passthrough with bhyve on Intel and for OpenBSD guests

Link:	 [bhyve Intel bug report](https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=229852)  
Link:	 [bhyve OpenBSD bug report](https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=245392)  
Link:	 [PCI passthrough with bhyve (FreeBSD wiki article)](https://wiki.freebsd.org/bhyve/pci_passthru)  

Contact: Anatoli <me@anatoli.ws>  
Contact: Callum <callum@aitchison.org>  
Contact: Peter Grehan <grehan@freebsd.org>  

bhyve(8) is a hypervisor that supports running a variety of guest
operating systems in virtual machines. bhyve(8) includes support for PCI
devices passthru, a technique to pass host PCI devices to a virtual
machine for its exclusive control and use.

For some years, PCI passthrough (ppt) in bhyve was not working on some
Intel systems and for OpenBSD guests due to two bugs. The first one was
crashing FreeBSD host when bhyve was started with ppt on Intel
processors with two VT-d translation units (IOMMU), included in most
Skylake and newer Intel processors.

The second bug was preventing correct interrupts handling for OpenBSD
guests. As a result, OpenBSD guests running on bhyve were not able to
use any PCI devices passed through to them from the host.

During the last 2 months the second bug was identified and fixed and
they both were backported to 12.1-RELEASE (p7). So now it's possible to
fully take advantage of PCI passthrough with bhyve in a production-ready
RELEASE version.

The most typical case for ppt is to pass to the guest network adapters
for its complete control, but you can also pass through USB devices
(including external HDDs). Note though, passthrough of VGA and GPU
devices is not supported yet (for more details see the 3rd link).

A particularly interesting case for ppt is to use OpenBSD guest as a
firewall and a router for a FreeBSD server. OpenBSD is considered by
many to be the most secure OS and it's frequently used in network
appliances as a firewall/router.

With ppt you can achieve this all inside a single server. You could pass
to the OpenBSD guest a network adapter connected to the internet and it
would take a complete control of it. After filtering the traffic, it
could pass good packets via virtual network interfaces to other guests
or to the host.

Once a network adapter is passed through, a FreeBSD host not only
doesn't see it and hence doesn't handle the network traffic, it doesn't
even have to initialize the adapter (e.g. in case of a WiFi card, it's
the guest that loads the firmware).

In simple terms the host only passes the device interrupts to the guest
as they come from the hardware. Everything related to the device
management happens inside the guest so there's no danger that some
network traffic exloits some issue in the host's network stack and
causes the host to crash or misbehave in other ways.
