## FreeBSD support for the forthcoming Arm Morello CPU, SoC, and board ##

Contact: Robert Watson <rwatson@FreeBSD.org>  
Contact: Andrew Turner <andrew@FreeBSD.org>  
Contact: Brooks Davis <brooks@FreeBSD.org>  

In September 2019, Arm announced Morello, an experimental multicore superscalar
ARMv8-A CPU, SoC, and prototype board extended to implement the CHERI
protection model.  Morello will become available in 2021.  More details can be
found in
[Arm's blog](https://www.arm.com/blogs/blueprint/digital-security-by-design), a
[Light Blue Touchpaper blog](https://www.lightbluetouchpaper.org/2019/10/18/ukri-digital-security-by-design-a-190m-research-programme-around-arms-morello-an-experimental-armv8-a-cpu-soc-and-board-with-cheri-support/),
and the main
[CHERI website](https://www.cl.cam.ac.uk/research/security/ctsrd/cheri/).

We have updated CheriBSD, a CHERI-adapted version of FreeBSD originally
targeted at the MIPS-based SRI/Cambridge CHERI processor prototype, to support
the current draft architecture.  This includes full userspace spatial and
referential memory safety
([CheriABI](https://www.cl.cam.ac.uk/research/security/ctsrd/pdfs/201904-asplos-cheriabi.pdf)),
as well as backwards compatibility to support running existing ARMv8-A
userspace binaries.

We will continue to update CheriBSD/Morello as the ISA is finalised.  Will also
closely track the public CheriBSD/MIPS trunk, picking up new software features
utilizing CHERI as they mature, as well as to pick up changes from the baseline
FreeBSD development trunk.

We currently anticipate releasing CheriBSD/Morello as open source once the ISA
and toolchain are published in 2020.

Sponsors: DARPA, AFRL
