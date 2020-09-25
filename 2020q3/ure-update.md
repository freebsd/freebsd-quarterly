## ure - USB 3.0 Gigabit Ethernet Driver update ##

Link:	 [svn commit: r365648](https://svnweb.freebsd.org/changeset/base/365648)
Link:	 [FreeBSD-SA-20:27.ure](https://www.freebsd.org/security/advisories/FreeBSD-SA-20:27.ure.asc)
Link:	 [D25809 major update to if_ure](https://reviews.freebsd.org/D25809)

Contact: John-Mark Gurney <jmg@FreeBSD.org>  

The ure is a driver for handling the RealTek ethernet adapters,
including the RTL8153 USB 3.0 Gigabit ethernet adapters.  It is used
in many ethernet dongles and docking stations.

Previous to this update, the driver was limited in speed.  In my
testing, I was only able to get ~910Mbps.  This limit was due to one
packet per USB transfer.  USB has a limit of 8000 transfers per
second (1500 bytes/pkt * 8000 pkts/sec * 8bits/byte == 96 Mbps).
This was acceptable for fast ethernet (RTL8152, 100Mbps), but with
the additional support for Gigabit ethernet, it became a bottleneck.

The updates add sending and receiving multiple packets in a single
USB transfer, VLAN hardware tagging, and enables TCP and UDP
checksum offloading.  This increased the speed on gigabit ethernet
to ~940 Mbps.

In doing this work, a security vulnerability was discovered in the
driver.  Due to improper setting of a device register, on some
devices, it caused packets to be fragmented when they shouldn't be
and the driver was unable to handle them correctly.  This allowed an
attacker, who could generate large frames (say, ping packets, or
large TCP transfers), to inject arbitrary packets into the network
stack.  This could allow the attacker to spoof traffic from other
machines, and bypass VLAN protections.  See the SA for more
information.

As part of this work, a script was created to run tests to
validate that basic functionality of the driver (w/o options) work
properly, and then iterate over each option to make sure that they
function properly.  This will be release at some point in the
future.

If you're interested in helping out, or testing it, let me know.
