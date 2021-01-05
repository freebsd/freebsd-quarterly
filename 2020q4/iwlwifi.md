## Intel wireless update ##

Link:  [The freebsd-wireless mailing list](https://lists.freebsd.org/mailman/listinfo/freebsd-wireless)

Contact: Bjoern A. Zeeb <bz@FreeBSD.org>  

### Newer Intel Wireless device support ###

The Intel Wireless driver update project aims to bring support for
newer chipsets and also get station side to 11ac in a first step.

During the last months connection code between net80211 and the
Linux driver KPI was implemented and scanning is working.
Currently the focus is on sending and driving one state machine
from the other and syncing state between net80211 and the
Linux compat code.

In addition the driver and firmware was updated from upstream sources
to include support for the AX210 hardware generation, which was already
tested to attach.

The hope is that by the time the status report gets published
authentication and association are working and basic data packet passing
will work soon.

Sponsor: The FreeBSD Foundation
