## ACPI NVDIMM driver ##
Contact: Konstantin Belousov, <kib@freebsd.org>
Link:	 None

NV-DIMM is the technology which provides non-volatile memory with the
access parameters similar to the regular DRAM, in the normal memory
address space of the host.  ACPI and UEFI specifications define
platform-independed way to detect and enumerate presence of NVDIMM and
get most of the data needed for correct applications use of it.

FreeBSD driver parses the ACPI NFIT table which lists NV-DIMMs, their
operational characteristics, and physical address spaces where the
NVDIMM memory is accessible.  Driver presents each address region as
two devices, one allows userspace to open(2) devfs node, which can be
read/written/mapped from the application, the mapping is zero-copy.
Another device is actually geom disk(9), which makes it possible to
use NVDIMM for normal FreeBSD filesystem, like UFS/ZFS/msdosfs.  Note
that buffer cache/mapping of files from a filesystem created over
NVDIMM causes unneeded double-buffering.

Apparently, on typical modern hardware, NVDIMM regions are located far
from the regular memory in the address space, and have attributes not
compatible with the regular DRAM.  This makes it unfeasible to extend
the direct map to provide kernel mappings.  New pmap KPI was designed,
pmap_large_map(9), which allows efficient mapping of very large
physical regions into KVA.  Also it have some optimizations to the
cache flush over the mapped regions, needed to efficiently support bio
flushes from the filesystems.  NVDIMM driver uses the KPI, it might be
also useful for the NTB driver.

The work was sponsored by The FreeBSD Foundation.

TODO:

Intel currently works on extending the driver with the support for
UEFI namespaces.

DAX-capable filesystem is needed, which solves the issue of
double-buffering.  Our tmpfs already provides VM facilities which
allows it to avoid double-buffering for mmap, which can be reused
there.
