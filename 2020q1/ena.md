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
  * Upstream of the driver v2.1.1 version, introducing:
    * Bug fix for LLQ mode which was causing race when multiple IO queues were
      used

Work in progress:
  * Last touches for ENA v2.2.0 release, introducing:
    * Add driver support for the upcoming HW features (like Rx offsets,
      reporting Tx drops)
    * Add sysctl tuneables for IO queue number
    * Create IO queues with optional size backoff
    * Rework the way of configration of drbr and Rx ring size to be more robust
      and stable
    * New HAL version
    * Other minor fixes and improvements

Sponsor: Amazon.com Inc
