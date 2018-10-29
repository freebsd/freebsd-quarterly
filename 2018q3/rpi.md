## RPI Firmware/DTB/U-Boot Update

Contact: Emmanuel Vadot <manu@FreeBSD.org>, U-Boot mailing list: <uboot@freebsd.org>

The RaspberryPi firmware loads the DTB from the fat partition based on
the model. U-Boot now uses this DTB and pass it to the FreeBSD loader/kernel
instead of using the one it embed.
This allow us to use the RaspberryPi Foundation provided DTB overlays to enable
HATs.
The Overlays can be obtained by installing the rpi-firmware package.

A new u-boot port for the W variant of the RPI0 was commited as u-boot-rpi-0-w.
Some experiments started by trasz@ show that we could maybe produce a generic
image for all armv6 RPI (RPI-B, RPI0 and RPI0W).
