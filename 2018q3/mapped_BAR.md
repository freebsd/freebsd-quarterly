## Usermode mapping of PCI BARs ##
Contact: Konstantin Belousov, <kib@freebsd.org>
Link:	 None

Modern PCI(e) devices typically define memory-mapped BARs, each of them
have a separate page-aligned boundaries.  This is enforced by the need
of hypervisors to provide the pass-through using VT-d, which operates
with memory and has granularity of page for access control.  As is, it
also means that the BARs have suitable configuration for providing
access to usermode, controlling access by the normal page tables.

Linux already gives a way for userspace mapping of BARs using sysfs.

Of course, if userspace have enough privileges, it can read BAR,
determine the physical address of the mapping as seen by CPU, and use
mem(4) AKA /dev/mem to mmap.  This is really cumbersome, and leaves
issues open, e.g. BAR might be not activated, which requires
involvement on IOMMU on some architectures.  Also this rude approach
makes it very hard to create mappings with the correct caching
attributes.

FreeBSD pci(4) driver recently got a convenient support for such
mappings, and pciconf(8) utility was extended to use it.  See pci(4)
for PCIOCBARMMAP ioctl(2) request description for details, and
pciconf(8) for the -D switch.

TODO: automatically activate the BAR on mapping, this is not done yet.
Problem there is the need to avoid the resource conflict with the
possible future attachment of the kernel driver.

The work was sponsored by The FreeBSD Foundation.
