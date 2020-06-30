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
  * Fixes for Rx refill to improve stability on low memory conditions (also
    released as an errata notice for FreeBSD-12.1)
  * Upstream of the v2.2.0 driver, introducing:
    * Add driver support for the upcoming HW features (reporting Tx drops,
      disabling meta caching)
    * Add sysctl tuneables for IO queue number
    * Create IO queues with optional size backoff
    * Rework the way of configration of drbr and Rx ring size to be more robust
      and stable
    * New HAL version
    * Driver is now marked as epoch ready
    * Default RSS key is created using RNG to improve security
    * Other minor fixes and improvements
  * MFC of the ENA v2.2.0 driver to the FreeBSD 11.4

Sponsor: Amazon.com Inc
