## FreeBSD on PowerNV (ppc64) ##

Contact: Patryk Duda <pdk@semihalf.com>, Wojciech Macek <wma@FreeBSD.org>, Michal Stanek <mst@semihalf.com>, Nathan Whitehorn <nw@freebsd.org>

Semihalf is happy to announce that FreeBSD is now running on IBM POWER8. This project is a continuation of work done by Nathan Whitehorn who provided basic support for a PowerNV emulator.

The IBM POWER8 family of CPUs offers superior performance compared to previous Power series. It provides complete NUMA support with up to 192 cores in a two socket system (up to 8 threads per core). All IO communication is handled by integrated PCIe interface equipped with multiple IOMMU engines.

The support for POWER8 system running FreeBSD in Non-Virtualized environment contains:

  * Generic driver for OPAL hypervisor
  * kboot loader modifications to allow Little-Endian loader to load a Big-Endian kernel ELF
  * skiboot update for ELF-parser allowing it to understand FreeBSD kernel file format
  * Basic support for PowerNV architecture, including modes of operation, MMU, interrupt controller
  * SMP operation (tested with 128 CPU configuration)
  * PHB subsystem driver, including IOMMU mapping for external buses
  * PCIe host controller driver
  * USB-3.0 XHCI driver
  * Reworked drivers to be Big-Endian compatible:
		- Chelsio cxgbe(4) 10/25G network adapter
		- NVMe SSD drive

All work has been merged into HEAD and will be included in FreeBSD 12.0-RELEASE.

Sponsors: IBM, FreeBSD Foundation, QCM Technologies, Semihalf, Limelight Networks.

The project is kindly initiated and supported by Limelight Networks (Kevin Bowling).
