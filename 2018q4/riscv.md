## FreeBSD/RISC-V update

Contact: Ruslan Bukin, <br@freebsd.org>
Contact: Mark Johnston, <markj@freebsd.org>

FreeBSD/RISC-V is getting more mature during last quarter.

We have optimizied RISC-V copyin(9)/copyout(9) routines. They now support word-sized copies where possible to dramatically increase speed of copying data between kernel and userspace.

We made a series of improvements and bug fixes to pmap support (machine-dependent portion of virtual memory subsystem). This part was not touched during the last years, and is now getting attention.

RISC-V GENERIC kernel gets support for witness(4) (The FreeBSD lock validation facility).

The British company [Embecosm](https://www.embecosm.com/) has reported that they were able to boot FreeBSD on real hardware -- a SiFive Unleashed board. The support is limited to a single core only. We are expecting patches from them.
