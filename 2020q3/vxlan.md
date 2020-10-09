## Stateless hardware offloads for VXLANs ##

Link:	 [r365867](https://svnweb.freebsd.org/base?view=revision&revision=r365867)  
Link:	 [r365868](https://svnweb.freebsd.org/base?view=revision&revision=r365868)  
Link:	 [r365869](https://svnweb.freebsd.org/base?view=revision&revision=r365869)  
Link:	 [r365870](https://svnweb.freebsd.org/base?view=revision&revision=r365870)  
Link:	 [r365871](https://svnweb.freebsd.org/base?view=revision&revision=r365871)  
Link:	 [RFC6935](https://tools.ietf.org/html/rfc6935)  

Contact: Navdeep Parhar <np@FreeBSD.org>  

VXLAN (Virtual eXtensible LAN) is a tunneling protocol in which Layer 2
traffic for a virtual LAN is encapsulated in UDP and transferred over
Layer 3 networks between VTEPs (VXLAN Tunnel End Points).  Traffic on
the wire has two sets of networking headers: the headers for the
encapsulation and the headers of the traffic being encapsulated.  VXLANs
are supported by if_vxlan(4) on FreeBSD.

~~~
Ethernet | IP/IPv6 | UDP | VXLAN | Ethernet | L3 hdr | L4 hdr | payload
<------- outer headers --------> | <---- inner headers ----->
~~~

Modern NICs commonly support header checksum insertion and verification,
TSO (TCP Segmentation Offload) on transmit, and RSS for load
distribution on receive.  But the default is to operate on the outermost
headers.  Some NICs can operate on the inner encapsulated frames as
well.  The commits listed above allow if_vxlan(4) to take advantage of
such NICs.

r365867 and r365868 add new mbuf checksum flags and ifnet capabilities.
r365870 implements the kernel parts of the new capabilities and updates
if_vxlan(4) to make use of them.  r365871 implements driver support for
the new capabilities in cxgbe(4).

VXLAN and other tunneling protocols that use UDP explicitly allow zero
checksum in the outer UDP header, even with IPv6.  r365869 adds support
for configuring one UDP/IPv6 port where zero checksums are allowed.

This work was sponsored by Chelsio Communications and was implemented
and tested using T6 (Terminator 6) NICs supported by cxgbe(4).  It is
available in 13.0-CURRENT (head) right now and will be available in
12-STABLE in the future.

VXLANs can be created as usual and will automatically have checksum and
TSO capabilities if the underlying physical interface supports VXLAN
stateless offloads.  Use ifconfig to list, disable, and enable checksum
capabilities on the VXLAN interface.  Use https://bugs.freebsd.org/bugzilla/
to report bugs.

Future work:
  * Direct call into a vxlan input routine from the driver's receive routine.
  * LRO support in if_vxlan(4).
  * GENEVE support.

Sponsor: Chelsio Communications
