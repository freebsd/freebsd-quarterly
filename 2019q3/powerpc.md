FreeBSD/powerpc Project

Contact: Mark Linimon (ports) <linimon@FreeBSD.org>  
Contact: Justin Hibbits (src) <jhibbits@FreeBSD.org>  
Contact: Piotr Kubaj (ports) <pkubaj@FreeBSD.org>  

Link:	[Status of FreeBSD ports on PowerPC](https://wiki.freebsd.org/powerpc/ports)
Link:	[Status of FreeBSD ports on PowerPC built using gcc](https://wiki.freebsd.org/powerpc/ports/PortsOnGcc)
Link:	[Status of FreeBSD ports on PowerPC built using clang](https://wiki.freebsd.org/powerpc/ports/PortsOnClang)
Link:	[Bringing LLVM to PowerPC64 target, using OpenPower ELF v2 ABI](https://wiki.freebsd.org/powerpc/llvm-elfv2)

The FreeBSD/powerpc project continues to make great strides.  However,
as we discovered at BSDCan 2019, we have not done a great job of letting
people know.

Key points:

 - powerpc64 src has been production-quality for over a year now.

 - powerpc64 ports has been developer-quality for over 18 months now.

The main targeted platforms:

 - powerpc64 on IBM Power8 and Power9 chips (the most recent available).
   This is the primary focus going forward.  FreeBSD 12 is required;
   FreeBSD 13 is recommended.

 - powerpc64 on older Apple Power Macs, on a continuing but secondary
   basis.  Any FreeBSD version should work.

 - powerpc32 on x5000.  However, this is still developer-only quality.
   FreeBSD 13 is recommended.

The software status:

 - powerpc64/12 and earlier still remain on the antiquated gcc4.2.1 in
   base.

 - powerpc64/13 will soon be switched to llvm90 in base.  A great deal
   of work has been undertaken to ensure as few regressions as possible.
   Once that switch has occurred (see llvm-elfv2 link above), powerpc64/13
   support on gcc4.2.1 will no longer be a priority.

 - FreeBSD.org package sets are available for powerpc64/12 (quarterly)
   and powerpc64/13 (default) through the usual method.

 - As of the most recent package build on powerpc64/13 (still gcc4.2.1),
   the following statistics apply:

   | Queued | Built | Failed | Skipped | Ignored | Remaining |
   |--------|-------|--------|---------|---------|-----------|
   | 33298  | 30361 | 259    | 1812    | 866     | 0         |

 - More ports fixes are being committed every day.

The team would like to thank IBM for the loan of two Power8 machines,
and Oregon State University (OSU) for providing the hosting.  As well,
we would like to thank the clusteradm team for keeping the Tyan Power8
machines online that are hosted at [NYI](https://www.nyi.net).
