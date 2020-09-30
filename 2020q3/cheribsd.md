## CheriBSD 2020 Q3 ##

Link:    http://www.cheri-cpu.org
Link:    https://fett.darpa.mil
Link:    https://www.morello-project.org
Link:    https://developer.arm.com/architectures/cpu-architecture/a-profile/morello

Contact: Alex Richardson <arichardson@FreeBSD.org>
Contact: Andrew Turner <andrew@FreeBSD.org>
Contact: Brooks Davis <brooks@FreeBSD.org>
Contact: Edward Tomasz Napierala <trasz@FreeBSD.org>
Contact: George Neville-Neil <gnn@FreeBSD.org>
Contact: Jessica Clarke <jrtc27@FreeBSD.org>
Contact: John Baldwin <jhb@FreeBSD.org>
Contact: Robert Watson <rwatson@FreeBSD.org>
Contact: Ruslan Bukin <br@FreeBSD.org>

### CheriBSD Status ###

CheriBSD extends FreeBSD to implement memory protection and software
compartmentalization features supported by the CHERI instruction-set
extensions.  There are three architectural implementations of the
CHERI protection model: CHERI-MIPS, CHERI-RISC-V, and Arm's forthcoming
experimental Morello processor (due late 2021).  CheriBSD is a research
operating system with a stable baseline implementation into which
various new research features have been, or are currently being, merged:

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

- Kernel spatial memory safety (pure-capability kernel) - The current
CheriBSD kernel is a hybrid C program where only pointers to userspace
are CHERI capabilities. This ensures that the kernel follows the
intent of the application runtime and cannot be used to defeat
bounds on application pointers. We have developed and will soon
merge a pure-capability kernel where all pointers in the kernel are
appropriately bounded capabilities. This vastly reduces the opportunity
for buffer overflows. This spatial memory safety lays the
groundwork for future work such as device driver compartmentalization
and kernel temporal safety.

- Userspace heap temporal memory safety (Cornucopia) - CHERI
capabilities provide the necessary features to enable
robust and efficient revocation of freed pointers.  With
[Cornucopia](https://www.cl.cam.ac.uk/research/security/ctsrd/pdfs/2020oakland-cornucopia.pdf)
we have implemented a light weight revocation framework providing
protection from use-after-reallocation bugs with an average cost below
2%.  We aim to bring these overheads down further over the next year and
merge this functionality into the mainline CheriBSD.

- Baseline FreeBSD improvements - We are upstreaming (to FreeBSD) our
completed port of bhyve to AArch64, various bug fixes and tweaks for PCIe
support, and support for the System MMU (SMMU) that will be present on the
N1SDP and Morello SoCs.  We have upstreamed support for cross-building
FreeBSD from macOS and Linux (with some limitations; see separate report on
crossbuilding).  We have also fixed implementation bugs in the RISC-V ABI.

### CHERI Documentation and Exercises ###

- We have released [Capability Hardware Enhanced RISC Instructions: CHERI
Instruction-Set Architecture (Version
8)](https://www.cl.cam.ac.uk/techreports/UCAM-CL-TR-951.pdf).
Notable changes include promotion of CHERI-RISC-V to non-experimental
and discussion of Arm's Morello prototype.

- We have developed a set of [Adversarial CHERI Exercises and
Missions](https://ctsrd-cheri.github.io/cheri-exercises/#adversarial-cheri-exercises-and-missions)
to introduce security researchers to CHERI protections.
