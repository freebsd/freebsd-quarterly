## Armada 38x FreeBSD support ##

Contact: Marcin Wojtas <mw@semihalf.com>, Patryk Duda <pdk@semihalf.com>, Rafał Kozik <rk@semihalf.com>

Link:	 [PRODUCT BRIEF](https://www.marvell.com/documents/egrkpyqzpoebxblyeept/)

The Marvell Armada 38x is a very poplular ARMv7-based dual core SoC.
Thanks to the multiple low and high speed interfaces
the platform is used in a wide range of products, such
as Network-Attached Storage (NAS), Wi-Fi Access Point (WAP) and others.

Since last report, remaining Armada 38x support was integrated to HEAD, which can now compile with the armv7
GENERIC config and use unmodified sys/gnu/dts device trees. The details are as follows:

* GENERIC config
    - Introduce a vast rework of the sys/arm/mv directory for arm and armv7 platforms.
    - Enable PLATFORM support for Marvell ARMv7 SoCs, which can now can boot with GENERIC kernel.
    - Base on dynamic detection of SoC type and device tree instead of using ifdefs
      and enable more flexible environment for maintaining Marvell platforms.
* sys/gnu/dts device trees
    - Improve platform code and the drivers (e.g. CESA, PCIE, GPIO) to properly work with original
      Linux device trees.
* GPIO
    - Add multiple fixes and improvements to the sys/arm/mv/gpio.c
    - Rework driver to properly integrate with HEAD GPIO frameworks (main and gpioled)
    - Enable support for both old and Linux GPIO device tree bindings, so that multiple controllers
      can be used.

Sponsors: Stormshield, Semihalf
