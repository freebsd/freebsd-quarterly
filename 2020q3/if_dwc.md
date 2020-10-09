## DesignWare Ethernet adapter driver improvements ##

Link:    [WIP branch](https://github.com/gonzoua/freebsd/tree/rk_eth)

Contact: Oleksandr Tymoshenko <gonzo@FreeBSD.org>  

DesignWare Ethernet adapter IP is used in Rockchip and Allwinner SoCs.
The driver was updated with following fixes:
 
  * Initialize clocks instead of relying on u-boot to do the right thing.
  * Sense media type and adjust controller configuration accordingly.
  * Add support for RMII PHY mode.

Yet uncommitted changes include performance optimisation by adding
support for multi-segment mbuf transmission. The next step is to
try to get more performance boost by using interrupt coalescence.
