## FreeBSD/RISC-V Project ##

Link:	 [Wiki](https://wiki.freebsd.org/riscv)  

Contact: Ruslan Bukin <br@FreeBSD.org>  
Contact: Mitchell Horne <mhorne@FreeBSD.org>  
Contact: John Baldwin <jhb@FreeBSD.org>  
Contact: Kristof Provost <kp@FreeBSD.org>  
Contact: Philip Paeps <philip@FreeBSD.org>  

It has been a year since the RISC-V project's last status report. In that time,
the RISC-V port has benefited from increased attention, and received
improvements of all kinds.

The RISC-V project has brought in two new src committers. We'd like to welcome
Jessica Clarke (jrtc27@), who is a member of CheriBSD, and Nick O'Brien (nick@)
of Axiado to the team.

Some highlights from last year:
 - Bring-up on SiFive's Hifive Unleashed board
 - Support for the OpenSBI firmware and version 0.2 of the SBI specification
 - Addition of the UART, SPI, and PRCI device drivers for the HiFive Unleashed

Last quarter, the default compiler and linker was switched to clang/lld. This
required a small number of integration changes on our side, but was mainly
enabled by the upstream improvements to the RISC-V LLVM back-end. LLVM's RISC-V
support became "official" with LLVM 9 [1], and LLVM 10 has brought further
improvements. The LLVM back-end is expected to continue to mature, as there are
now many parties actively involved in its development. GCC remains supported as
an external toolchain for RISC-V.

Some progress has been made on supporting the ports framework on RISC-V, which
was mostly untested until recently. First,
`emulators/qemu-user-static-devel` received an update adding support for the
RISC-V 64-bit ABI, allowing ports to be cross-compiled via `poudiere(8)`.
Second, improvements were made to the detection of the soft-float ABI,
riscv64sf. Systems running either of the hard-float or soft-float ABIs can now
compile and run ports natively. At the moment a small subset of ports can be
built successfully, and in the coming months we will look to improve that to
include a base set of crucial ports (e.g. python or perl).

The CheriBSD project saw an initial port to RISC-V this quarter. Preliminary
support for the CHERI ISA has been added to the Spike and QEMU emulators, as
well as the necessary changes on the CheriBSD side. Currently, the CheriBSD
RISC-V kernel boots, and most statically compiled CHERI binaries run without
issue.

Although real RISC-V hardware is still scarce, any users with an interest
trying out or contributing to the RISC-V port are encouraged to do so. Please
visit the recently updated wiki page for information on getting set up, or check
out "Getting Started with FreeBSD/RISC-V" in the January/February edition of The
FreeBSD Journal.

Sponsor: DARPA, AFRL, Axiado

[1] https://lists.llvm.org/pipermail/llvm-dev/2019-September/135304.html
