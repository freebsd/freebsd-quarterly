## FreeBSD/RISC-V Project ##

Link:	 [Wiki](https://wiki.freebsd.org/riscv)  

Contact: Mitchell Horne <mhorne@FreeBSD.org>  
Contact: [freebsd-riscv Mailing List](https://lists.FreeBSD.org/mailman/listinfo/freebsd-riscv)  
Contact: IRC #freebsd-riscv on freenode  

The _FreeBSD/RISC-V_ project is providing support for running FreeBSD on the
[RISC-V Instruction Set Architecture](https://riscv.org/).

This quarter saw several important bug fixes. A number of hangs in the system
were identified and addressed, and a bug in QEMU's implementation of the
Platform Level Interrupt Controller was fixed. This fix is included in the new
`devel/qemu50` and `devel/qemu-devel` ports.

The end result of these fixes is that the test suite can now be reliably run to
completion in QEMU. The entire run takes several hours, so CI has been
configured to run the job once a day. There is active effort into reducing the
time it takes to run the entire test suite.

A new u-boot port was created: `sysutils/u-boot-qemu-riscv64`. This variant can
be used as a secondary bootloader alongside OpenSBI to load and launch FreeBSD's
`loader(8)` from an EFI System Partition.

Next quarter will likely bring further fixes to address some of the failing test
cases.
