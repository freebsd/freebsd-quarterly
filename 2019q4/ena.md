## ENA FreeBSD Driver Update ##

Link: [ENA README](https://github.com/amzn/amzn-drivers/blob/master/kernel/fbsd/ena/README)

Contact: Michal Krawczyk <mk@semihalf.com>  
Contact: Maciej Bielski <mba@semihalf.com>  
Contact: Marcin Wojtas <mw@semihalf.com>  

ENA (Elastic Network Adapter) is the smart NIC available in the
virtualized environment of Amazon Web Services (AWS). The ENA
driver supports multiple transmit and receive queues and can handle
up to 100 Gb/s of network traffic, depending on the instance type
on which it is used.

Completed since the last update:
  * Upstream of the driver v2.1.0 version, introducing:
    * Netmap support
    * Driver structure rework (split datapath code from initialization)
    * Fix for keep-alive timeout due to prolonged reset
    * Enable LLQ mode on arm64 instances by enabling memory mapped as WC

Work in progress::
  * ENA v2.2.0 release, introducing new bug fixes, features and other improvements

Sponsor: Amazon.com Inc
