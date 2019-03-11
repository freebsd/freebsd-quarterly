## ENA FreeBSD Driver Update ##

Contact: Michal Krawczyk, <mk@semihalf.com>

Link:	 [ENA README](https://github.com/amzn/amzn-drivers/blob/master/kernel/fbsd/ena/README)

ENA (Elastic Network Adapter) is the smart NIC which is used in the virtualized
environment of Amazon Web Services (AWS). It supports multiple queues and can
handle up to 25 Gb/s, depending on the instance type on which it is used.

ENAv2 has been under development for FreeBSD, similar to Linux OS and DPDK.
New changes are including:

* Upgrade of the HAL to the version supporting ENAv2
* Optimization of the logging on the Tx path
* LLQ (Low Latency Queue) feature, which is reducing latency on instances supporting ENAv2
* Optimization of the locks on hot paths by adding Tx queue management and lockless Rx queue cleanup
* Fixes on the error handling paths
* Use bitfield for tracking device states
* Add additional doorbells on Tx path
* Add queue depth setup in the runtime and allows Rx queue depth to be configured independently
* And more minor bug fixes and code reorganization

Todo:

* Internal review and validation
* Upstream of the patches

Sponsor: Amazon.com Inc.
