# ENA FreeBSD Driver Update ##

Contact: Michal Krawczyk, <mk@semihalf.com>
Contact: Maciej Bielski, <mba@semihalf.com>
Contact: Marcin Wojtas, <mw@semihalf.com>

Link: [ENA README](https://github.com/amzn/amzn-drivers/blob/master/kernel/fbsd/ena/README)

ENA (Elastic Network Adapter) is the smart NIC available in the
virtualized environment of Amazon Web Services (AWS).  The ENA
driver supports multiple transmit and receive queues and can handle
up to 100 Gb/s of network traffic, depending on the instance type
on which it is used.

ENAv2 has been under development for FreeBSD, similar to Linux
and DPDK.  Since the last update internal review and improvements
of the patches were done, followed by validation on various AWS
instances.

* Completed since the last update:
  * Upstream of the ENAv2 patches - revisions [r348383](https://svnweb.freebsd.org/base?view=revision&revision=348383) - [r348416](https://svnweb.freebsd.org/base?view=revision&revision=348416)
    introduce a major driver upgrade to version v2.0.0. Along with various fixes
    and improvements, the most significant features are LLQ (Low Latency Queues)
    and independent queues reconfiguration using sysctl commands.
  * Implement NETMAP support for ENA

* Todo:
  * Internal review and upstream of NETMAP support

Sponsor: Amazon.com Inc

