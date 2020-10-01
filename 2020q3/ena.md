## ENA FreeBSD Driver Update ##

Link: [ENA README](https://github.com/amzn/amzn-drivers/blob/master/kernel/fbsd/ena/README)

Contact: Michal Krawczyk <mk@semihalf.com>  
Contact: Artur Rojek <ar@semihalf.com>  
Contact: Marcin Wojtas <mw@semihalf.com>  

ENA (Elastic Network Adapter) is the smart NIC available in the
virtualized environment of Amazon Web Services (AWS). The ENA
driver supports multiple transmit and receive queues and can handle
up to 100 Gb/s of network traffic, depending on the instance type
on which it is used.

Completed since the last update:
  * Fix ENA compilation in case it is integrated into the kernel binary.
  * MFC of the ENA v2.2.0 driver to the FreeBSD 12.2.

Work in progress:
  * Add feature that allows reading extra ENI (Elastic Network Interface)
    metrics about exceeding BW/pps limits.
  * Introduce full kernel RSS API support.
  * Allow reconfiguration of the RSS indirection table and hash key.
  * Evaluation and prototyping of the driver port to the iflib framework.

Sponsor: Amazon.com Inc
