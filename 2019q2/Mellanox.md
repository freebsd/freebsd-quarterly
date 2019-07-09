## Mellanox Drivers Update ##

Contact: Slava Shwartsman, Hans Petter Selasky, Konstantin Belousov, <freebsd-drivers@mellanox.com>

Link:	 [Mellanox OFED for FreeBSD Documentation](http://www.mellanox.com/page/products_dyn?product_family=193&mtag=freebsd_driver)  

The mlx5 driver provides support for ConnectX-4 [Lx], ConnectX-5 [Ex] and
ConnectX-6 [Dx] adapter cards. The mlx5en driver provides support for Ethernet
adapter cards, whereas mlx5ib driver provides support for InfiniBand adapters
and RDMA over Converged Ethernet (RoCE).

### Following updates done in mlx5 drivers: ###

  * **200Gb/s ConnectX-6 Ethernet**:  
    Added support for [Mellanox Socket Direct Adapters](http://www.mellanox.com/page/products_dyn?product_family=285&mtag=socketdc)
    which allows, among the rest of the capabilities, to run up to 200Gb/s on a
    PCIe Gen 3.0 on a LAG interface.
  * **Support for "BlueField" - Multicore System On A Chip**:  
    Added support for RShim driver for [BlueField Multicore System On A Chip(SOC)](http://www.mellanox.com/products/bluefield-overview/).
    The RShim driver provides access to the RShim resources on the BlueField
    target accessible from an external host machine. The current RShim version
    provides device files for boot image push and virtual console access. It
    also creates virtual network interface to connect to the BlueField target
    and provides access to internal RShim registers.
  * **Firmware Burning and Diagnostics Tools**:
    Added MSTFLINT to ports, this package contains a burning and diagnostic
    tools for Mellanox NICs.
    This package contains following tools:
    mstflint - Tools which allows to query and burn firmware.
    mstconfig - This tool queries and sets non-volatile configurable options for
    Mellanox HCAs.
    mstregdump - This utility dumps hardware registers from Mellanox hardware.
    mstmcra - This debug utility reads/writes a to/from the device
    configuration register space.
    mstvpd - This utility dumps the on-card VPD.
    and more.
  * **OFED-FreeBSD-v3.5.1 Upstream**:  
    Pushed upstream and MFCed OFED-FreeBSD-v3.5.1 driver - more details
    on the content of this update can be found in [Mellanox OFED for FreeBSD documentation](http://www.mellanox.com/page/products_dyn?product_family=193&mtag=freebsd_driver) page.

### General updates: ###
  * Submitted papers for EuroBSDcon for a joint talk with Netflix titled
    "Kernel TLS and TLS Hardware Offload". The papers were accepted.
  * Mellanox is intensively working to improve its cooperation with the FreeBSD
    community. As part of this effort, FreeBSD users are invited to propose
    features and enhancements to further develop and enrich the end-user
    experience. In addition, Mellanox continues to identify and present the
    right solutions to meet customers' needs.

Sponsor: Mellanox Technologies  
