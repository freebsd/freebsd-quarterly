## ENA FreeBSD Driver Update ##

Contact: Michal Krawczyk <mk@semihalf.com>, Marcin Wojtas <mw@semihalf.com>  

Link:	 [ENA README](https://github.com/amzn/amzn-drivers/blob/master/kernel/fbsd/ena/README)  

ENA (Elastic Network Adapter) is the smart NIC available in the
virtualized environment of Amazon Web Services (AWS).  The ENA
driver supports multiple transmit and receive queues and can handle
up to 100 Gb/s of network traffic, depending on the instance type
on which it is used.

ENAv2 has been under development for FreeBSD, similar to Linux
and DPDK.  Since the last update internal review and improvements
of the patches were done, followed by validation on various AWS
instances.

To do:

* Upstream of the ENAv2 patches

Recently, AWS released the A1 instances which are arm64 instances.
The FreeBSD kernel was fixed, so the ENA can be used on those
instances with no issues. There were changes required in resource
activation in the ENA driver
[r345371](https://svnweb.freebsd.org/base?view=revision&revision=345371)
and the addition of a missing bus release method to the nexus module
for aarch64
[r345373](https://svnweb.freebsd.org/base?view=revision&revision=345373).
With these changes, the ENA driver can run on A1 instances without
any known issues.

Sponsor: Amazon.com Inc.  

