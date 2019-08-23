## FreeBSD SDIO and Broadcom FullMAC WiFi Support ##

Contact: Bjoern Zeeb, <bz@FreeBSD.ORG>

Link:    [FreeBSD Wiki SDIO page](https://wiki.freebsd.org/SDIO)

SDIO is an interface designed as an extension to SD Cards
to allow attachments of various other peripherals, e.g.,
WiFi or Bluetooth.

Work has been ongoing by Ilya Bakulin on the MMCCAM stack
to provide the infrastructure to be able to have SD cards
and SDIO devices attached side-by-side facilitating
FreeBSD's CAM framework.
Based on this excellent work over the last years,
SDIO support was finished earlier this year and committed
to FreeBSD HEAD with the intention to merge to 12 at a
later time.

Facilitating the newly available SDIO bus, work started to
port Broadcom's FullMAC WiFi driver.  This work is still
in progress and expected to complete later this year.
With this WiFi support for the Raspberry Pi and other
embedded boards will become available.
Likewise drivers for other SDIO devices can be developed
now.

Sponsor: The FreeBSD Foundation
