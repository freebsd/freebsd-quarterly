## Intel wireless and 11ac update ##

Link:	 [Initial project announcement](https://lists.freebsd.org/pipermail/freebsd-wireless/2020-April/009055.html) 
Link:  [The freebsd-wireless mailing list](https://lists.freebsd.org/mailman/listinfo/freebsd-wireless)

Contact: Bjoern A. Zeeb <bz@FreeBSD.org>  

The Intel Wireless cards are one of the most commonly used
and ask for in FreeBSD notebooks.

This project has three main goals:
 * newer Intel Wireless device support,
 * newer WiFi standards support for Intel Wireless,
 * integration of 802.11ac client support and infrastructure in FreeBSD.

The first one is needed as iwm(4) currently does not support
the latest generations of Intel Wireless cards at all.
The second is needed as in FreeBSD iwm(4) does not even support
802.11n.
The third one we want to catch up and use the improvements the
new Wifi standard offers, e.g., speed.

One of the decisions made was: rather than improving iwm(4)
this work uses the dual-licensed native Linux driver under BSD license
and the linuxkpi framework to stay as close to upstream as possible as
a first step.
This will give us several advantages, such as, the full support for all
cards, quick support for new chipsets, vendor bug fixes, but also the
ability to contribute back.

At this point the lower level hardware attachments and the firmware
loading and initialisation works.
I plan to release a patchset for testing before mid-July, you can see if
your currently supported or unsupported hardware will be detected.
This first cut will not support any wireless operation yet, which will follow
later in the year.

If you want to help testing, please watch the freebsd-wireless list.

Sponsor: The FreeBSD Foundation  
