# CheriBSD 2020 Q2

Link:    http://www.cheri-cpu.org
Link:    https://fett.darpa.mil

Contact: Alex Richardson <arichardson@FreeBSD.org>
Contact: Andrew Turner <andrew@FreeBSD.org>
Contact: Brooks Davis <brooks@FreeBSD.org>
Contact: Edward Tomasz Napierala <trasz@FreeBSD.org>
Contact: Jessica Clarke <jrtc27@FreeBSD.org>
Contact: John Baldwin <jhb@FreeBSD.org>
Contact: Robert Watson <rwatson@FreeBSD.org>
Contact: Ruslan Bukin <br@FreeBSD.org>

CheriBSD extends FreeBSD to implement memory protection and software
compartmentalization features supported by the CHERI instruction set
extensions.

Support for CHERI-RISC-V in CheriBSD has continued to mature this
quarter in tandem with refinements to the CHERI-RISC-V architecture.
We have recently made CheriBSD's "pure capability" (CheriABI) process
environment the default ABI rather than a compatibility layer. It has
grown support for:

- dynamically linked binaries (previously only statically-linked binaries were supported)
- C++ including exceptions
- sealed return address and function pointer capabilities ("sentries") which provide additional CFI protection
- initial MMU protections for loading and storing tags

At this point, CHERI-RISC-V support in CheriBSD is generally on par with
support for CHERI-MIPS.

Much of this effort has been focused on preparing CheriBSD on
CHERI-RISC-V for inclusion as a demonstrator system in DARPA's Finding
Exploits to Thwart Tampering ([FETT](https://fett.darpa.mil)) Bug Bounty
program.

In addition, work has begun this quarter on porting CheriBSD to Arm's
Morello SoC.  Morello is a prototype demonstrator board which adds CHERI
extensions to ARMv8-A.

We've recently switched to a dev-branch model where active work takes
place on the `dev` branch and we periodically merge to `master` with
synchronization between CheriBSD and dependencies like CHERI-LLVM.

For those interested in what it's like to program for CHERI, we've
recently released a [CHERI C/C++ Programming
Guide](https://www.cl.cam.ac.uk/techreports/UCAM-CL-TR-947.pdf).
