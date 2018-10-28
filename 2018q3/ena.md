## ENA FreeBSD Driver Update ##

Contact: Michał Krawczyk <mk@semihalf.com>

Link:	 [ENA README](https://github.com/amzn/amzn-drivers/blob/master/kernel/fbsd/ena/README)

ENA (Elastic Network Adapter) is the smart NIC which is used in the virtualized
environment of Amazon Web Services (AWS). It supports multiple queues and can handle up to 25 Gb/s, depending on the instance type on which it is used.

Since last report, the ENA v0.8.0 and v0.8.1 were released, which introduced
many bug fixes, new features, optimization, stability and error recovery
improvements. The last is especially important on the AWS, where the instances
have to be reliable as they may be running very sensitive functions and the
down time of the VM should be reduced to minimum.

The v0.8.0 and v0.8.1 release patches included:

  * Upgrade of the HAL to version v1.1.4.3
  * Improvement to the reset routine - the driver is now triggering reset from
     more fault points and is passing the reset reason to the device, which can
    perform the reset adequately to the encountered error.
  * The device statistics (like global Tx and Rx) are not read from the device,
    anymore. The only exception are Rx drops, which are read using the AENQ
    descriptor.
  * The RX Out Of Order completion feature was added, which enabled to cleanup the
    RX descriptors out of order by keeping trace of all free descriptors.
  * RX ring is now being monitored, to prevent the ring from stalling.
  * Error handling paths were reworked and fixed.
  * Driver was covered with branch prediction statements, to use the most of this
    CPU feature in the hot paths.
  * Fix handling of the DF flag in the IP packets.
  * Add dynamic logging and reduce number of messages being printed by the driver.
  * MTU configuration now is being verified using the device capabilities instead
    of constant value.
  * Do not pass packet header length hint to the device, because for the chained
    mbufs it may be problematic to determine header length, if the header is split
    into multiple segments.

Sponsor: Amazon.com Inc.
