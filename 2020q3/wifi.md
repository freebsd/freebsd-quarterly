## Wireless updates ##

Link:  [The freebsd-wireless mailing list](https://lists.freebsd.org/mailman/listinfo/freebsd-wireless)
Link:  [athp github repository](https://github.com/erikarn/athp)

Contact: Adrian Chadd <adrian@FreeBSD.org>  
Contact: Bjoern A. Zeeb <bz@FreeBSD.org>  

### net80211 and infrastructure, driver updates, and upcoming 12.2 Release ###

The following works happened in FreeBSD HEAD (some already in Q2) and were
merged for 12.2-BETA2 and include net80211 and driver updates for better 11n
and upcoming 11ac support.

In more detail, this includes an ath(4) update, some run(4) 11n support, 11n for otus(4),
A-MPDU, A-MSDU, A-MPDU+A-MSDU and Fast frames options, scanning fixes,
enhanced PRIV checks for jails, restored parent device name printing,
improvements for upcoming VHT support, lots of under-the-hood infrastructure
improvements, new device IDs, and debug tools updates.

If you have a chance please test before the release.

### Atheros 11ac driver athp ###

In the last three months the athp(4) port of the ath10k driver has progressed
well.  Adrian reports the following important changes:
  * Per-node transmit buffering was implemented, required for correct hostap
  and QCA6174 behaviour.
  * Issues with ignoring sending some management frames got fixed; null-data
  frames were being filtered out and this caused undesirable hostap behaviour.
  * Transmit path refactoring reduced code duplication.
  * A fix on firmware start / VAP running tracking no longer stops
  the first VAP from coming active after VAP creation / ifconfig up.
  * Correcting hostap mode PHY configuration now allows non-VHT stations to
  associate and correctly exchange data with a VHT AP.
  * Addition of a crypto key configuration cache in the driver ensures the
  ieee80211_key details are available after the key is deleted; net80211
  would reuse or free the state before the driver task would finish the
  firmware command.

### Newer Intel Wireless device support ###

Initial work was done to integrate net80211 support in the LinuxKPI compat
layer to get the wireless parts going.
In addition, upstreaming code changes and working through problems and review
started on two sides.  One was trying to get mostly compile time changes
upstreamed to the iwlwifi driver.  The other is sorting out conflicting
LinuxKPI changes to not break the DRM graphics drivers.
Bjoern hopes that with some of that sorted out, he can soon go back to focus
on the wireless parts and produce a new snapshot.

### rtw88 and brcmfmac ###

As the Intel driver port and LinuxKPI advance, both the rtw88, and to a lower
degree the brcmfmac, ports benefit from that.
Bjoern lately also got a brcmfmac PCIe card and started to port support for
that.
This for the moment remains a free-time project.

Work by Bjoern was sponsored by:
Sponsor: Rubicon Communications, LLC (d/b/a "Netgate")
Sponsor: The FreeBSD Foundation
