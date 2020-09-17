# CheriBSD 2020 Q3

Link:    http://www.cheri-cpu.org
Link:    https://fett.darpa.mil
Link:    https://www.morello-project.org

Contact: Alex Richardson <arichardson@FreeBSD.org>
Contact: Andrew Turner <andrew@FreeBSD.org>
Contact: Brooks Davis <brooks@FreeBSD.org>
Contact: Edward Tomasz Napierala <trasz@FreeBSD.org>
Contact: George Neville-Neil <gnn@FreeBSD.org>
Contact: Jessica Clarke <jrtc27@FreeBSD.org>
Contact: John Baldwin <jhb@FreeBSD.org>
Contact: Robert Watson <rwatson@FreeBSD.org>
Contact: Ruslan Bukin <br@FreeBSD.org>

CheriBSD extends FreeBSD to implement memory protection and software
compartmentalization features supported by the CHERI instruction-set
extensions.  There are three architectural implementations of the
CHERI protection model: CHERI-MIPS, CHERI-RISC-V, and Arm's forthcoming
experimental Morello processor (due late 2021).  CheriBSD is a research
operating system with a stable baseline implementation into which
various new research features have been, or are currently being, merged:

- Kernel spatial memory safety (pure-capability kernel)

- Userspace heap temporal memory safety (Cornucopia)

- Arm Morello - We are preparing to open source our adaptation of
CheriBSD to Arm's Morello architecture.  The Morello branch is being
updated to the most recent CheriBSD baseline, and patches are in review
for upstreaming to our open-source repository.  CheriBSD currently boots
and runs statically linked CheriABI binaries on the Morello simulator,
and dynamic linking support is in progress, with OS and toolchain bugs
being worked on.  We aim to make a first CheriBSD/Morello snapshot
available alongside other open-source Morello software in mid-October
2020\.  However, our target for a more mature and usable implementation
is December 2020.

- Co-process support (XXX possibly?)

- CHERI documentation and exercises (XXX possibly?)

- Baseline FreeBSD improvements - We are upstreaming (to FreeBSD) our
completed port of bhyve to AAarch64, various bug fixes and tweaks for PCIe
support, and support for the System MMU (SMMU) that will be present on the
N1SDP and Morello SoCs.  We are also upstreaming support for cross-building
FreeBSD from macOS and Linux (with some limitations; see separate report on
cheribuild).