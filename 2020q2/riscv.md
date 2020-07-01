## FreeBSD/RISC-V Project ##

Link:	 [Wiki](https://wiki.freebsd.org/riscv)  

Contact: Mitchell Horne <mhorne@FreeBSD.org>  
Contact: [freebsd-riscv Mailing List](https://lists.FreeBSD.org/mailman/listinfo/freebsd-riscv)  
Contact: IRC #freebsd-riscv channel on freenode  

The _FreeBSD/RISC-V_ project is providing support for running FreeBSD on the
[RISC-V Instruction Set Architecture](https://riscv.org/). Since RISC-V is still
a young and evolving platform, one of our goals is to have FreeBSD be a
well-supported option for users as RISC-V hardware increases in availability.

This quarter saw a number of improvements to the boot process. 

The `physmem` interface used by arm and arm64 to enumerate physical memory
resources was moved to machine-independent code and adopted on RISC-V. As a
result, the kernel is now able to detect and exclude physical memory reserved by
devices or firmware. A bug that prevented the kernel from using physical memory
below its load address was fixed. This typically did not manifest in much waste,
as the kernel is loaded 2MB after the start of physical memory by default. In
future boot configurations, the impact would have been much larger.

Our port for OpenSBI was updated to v0.8, bringing several new features and
fixes. In particular, it brought the Hardware State Management (HSM) extension,
which can be used to start and stop CPUs. FreeBSD will now use this extension
whenever it detects that it is available.

There has also been a lot of work done to port FreeBSD's standard bootloader,
`loader(8)`, to RISC-V. This has big advantages in terms of boot flexibility,
and brings us closer to what's needed to produce official FreeBSD/RISC-V release
images. By leveraging EFI support from
[u-boot](https://www.denx.de/wiki/U-Boot/), `loader.efi` can be used in a manner
similar to arm and arm64. Next quarter will likely bring u-boot ports for RISC-V
targets, pending the v2020.07 release. Booting the kernel directly via SBI
firmware will continue to be supported.
