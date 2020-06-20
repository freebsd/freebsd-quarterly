## Not-transparent superpages ##

Link:	 [Patch](https://reviews.freebsd.org/D24652)  

Contact: Konstantin Belousov <kib@FreeBSD.org>  

FreeBSD already provides excellent support for superpages, in a
manner completely transparent to applications.  It tries to
proactively prevent fragmentation, reserves contigous runs of the
physical pages for linear allocations in managed objects, and
auto-promote runs of small pages when they form complete superpage.

The shortcomings of this approach directly follows from its strength:
some applications want to get guaranteed superpage mappings, typically
because the underlying physical memory is also offloaded into a
hardware which also has memory mapping unit.  For instance, Infiniband
RMDA adapters do memory registration and remapping, which is more
efficient with large pages.  In such cases transparent
(non-guaranteed) support cannot be used.

The extension was developed for POSIX shared memory subsystem to allow
the creator request that the shared memory object was backed by
physically contiguous pages, with runs of specified size.  The mmap(2)
syscall is aware of such objects, and if the requested mapping is
properly aligned, it will be served by superpages.

The new type of the shared memory objects are backed by modified
a physical pager, which only allocates contigous physical memory.  The
VM ensures that mappings of the objects are never split (clipped) on a
non-superpage boundary.  The fault handler is specially optimized to
be very fast by quickly installing the superpage PTE, and to avoid
touching all small pages constituing it.

Currently the required pmap support is provided for amd64 with 2M and
1G superpage sizes.

Sponsor: The FreeBSD Foundation  
