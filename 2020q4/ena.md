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
  * MFC of the ENA v2.3.0 driver to the FreeBSD 11-STABLE
  * MFC of the ENA v2.3.0 driver to the upcoming FreeBSD 12-STABLE
  * Add feature that allows reading extra ENI (Elastic Network Interface)
    metrics about exceeding BW/pps limits.
  * Add SPDX license tag to the ENA driver files.
  * Add Rx offsets (hardware feature) support for the ENA driver.
  * Fix completion descriptors alignment for the ENA device - some of the
    on some of the platofrms ENA needs aligment to 4k.

Work in progress:
  * Introduce full kernel RSS API support.
  * Allow reconfiguration of the RSS indirection table and hash key.
  * Prototyping of the driver port to the iflib framework.

Sponsor: Amazon.com Inc
