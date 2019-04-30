## ENA FreeBSD Driver Update ##

Contact: Michal Krawczyk <mk@semihalf.com>

Link:	 [ENA README](https://github.com/amzn/amzn-drivers/blob/master/kernel/fbsd/ena/README)

ENA (Elastic Network Adapter) is the smart NIC which is used in the virtualized
environment of Amazon Web Services (AWS). It supports multiple queues and can
handle up to 100 Gb/s, depending on the instance type on which it is used.

ENAv2 has been under development for FreeBSD, similar to Linux OS and DPDK.
Since the last update internal review and improvements of the patches were
done, followed by validation on various AWS instances.

To do:

* Upstream of the ENAv2 patches

Recently, AWS released the A1 instances which are arm64 instances. Kernel was
fixed, so the ENA can be used on those instances without any issues. Changes
required adjustments in resource activation in the ENA driver (r345371) and
adding missing bus release method to the nexus module for aarch64 (r345373).
With those changes, the ENA driver should be able to run on A1 instances without
any issues.

Sponsor: Amazon.com Inc.

