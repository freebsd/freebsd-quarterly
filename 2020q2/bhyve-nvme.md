## bhyve - NVMe emulation improvements ##

Link:	 [bhyve NVMe reviews](https://reviews.freebsd.org/search/query/xvbcF20W__Km/)  

Contact: Chuck Tuffli <chuck@freebsd.org>  

The University of New Hampshire InterOperability Laboratory
(a.k.a. UNH IOL) develops a suite of tests to determine if an
NVMe device conforms to the specification and is interoperable
with other NVMe products. This quarter, I undertook getting
bhyve's emulated NVMe device to pass the mandatory tests. Changes
include:
 - implement Flush command
 - implement Format NVM command
 - implement AER support
 - implement Namespace Identification Descriptor
 - fix Active Namespace list
 - fix queue creation and deletion
 - validate Deallocate range values
 - handle zero length DSM ranges
 - fix Get Log Page command
 - implement SMART data I/O statistics
 - validate the LBA start and count
 - add basic Firmware Commit support
 - add more compliant Get/Set Features
 - add Feature, Interrupt Vector Config
 - fix Get Features, Predictable Latency

This was also a good opportunity to restructure parts of the code
to make it more modular and easier to enhance. This includes
 - convert logging statements to parameterized macros
 - refactor I/O command handling
 - add locks around queue accesses
 - consolidate CQ update
 - base pci_nvme_ioreq size on advertised MDTS

You can help by testing and/or commenting on the code reviews
(see link at top).
