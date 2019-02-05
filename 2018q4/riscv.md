## FreeBSD/RISC-V update

Contact: Ruslan Bukin <br@freebsd.org>

Contact: Mark Johnston <markj@freebsd.org>

FreeBSD/RISC-V is getting mature during last quarter.

We have optimizied RISC-V copyin(9)/copyout(9) routines. They now supports word-sized copies where possible to dramatically increase speed of copying data between kernel and userspace.

We made a series of improvements and bug fixes to pmap support (machine-dependent portion of virtual memory subsystem). This part was almost not touched during last years and now gets attention.

RISC-V GENERIC kernel gets support for witness(4) (The FreeBSD lock validation facility).

The british company Embecosm has reported that they were able to boot FreeBSD on a real hardware -- SiFive Unleashed board. The support is limited to a single core only. We are expecting patches from them.
