## ENA FreeBSD Driver Update ##

Link: [ENA README](https://github.com/amzn/amzn-drivers/blob/master/kernel/fbsd/ena/README)

Contact: Michal Krawczyk <mk@semihalf.com>  
Contact: Maciej Bielski <mba@semihalf.com>  
Contact: Marcin Wojtas <mw@semihalf.com>  

ENA (Elastic Network Adapter) is the smart NIC available in the
virtualized environment of Amazon Web Services (AWS).  The ENA
driver supports multiple transmit and receive queues and can handle
up to 100 Gb/s of network traffic, depending on the instance type
on which it is used.

ENAv2 has been under development for FreeBSD, similar to Linux
and DPDK.  Since the last update internal review and improvements
of the patches were done, followed by validation on various AWS
instances.

Completed since the last update:
  * Verification and review of the NETMAP support
  * Mapping of the memory as WC on A1 instances in order to enable LLQ mode

Todo:
  * Upstream of NETMAP support
  * Upstream of the fix for LLQ mode on A1 instances

Sponsor: Amazon.com Inc
