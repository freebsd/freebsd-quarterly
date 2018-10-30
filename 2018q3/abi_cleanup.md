## 32-bit compatibility and other ABI cleanups ##

Contact: Brooks Davis, <brooks@FreeBSD.org>

As part of maintaining an external ABI (application binary interface)
compatibility layer, I've been improving FreeBSD infrastructure,
primarily the 32-bit compatibility layer. One of FreeBSD's strengths is
that we can easily support many ABIs. This includes support for a.out
format executables (vs the standard ELF), support for i386 on amd64, the
Linux emulation layer, etc.

This infrastructure has existed for decades and not every design
decision has stood the test of time.  Support has also been incomplete
in a number of areas (e.g. network management under 32-bit emulation).

Committed improvements include:
 
 * Improved `ioctl` and `sysctl` support to allow `ifconfig` and
   `netstat` to work in 32-bit compat mode.

 * Migration from a model of translating `ioctl` commands and data
   structures at the kernel boundary to translating where the commands
   are processed.  This is a correctness improvement (`ioctl` commands
   have not meaning outside the specific file descriptor in question)
   and improves code reusability (my out-of-tree work will soon include
   a 64-bit compatibility layer.)

 * Simplifications of the generic ELF process execution path by Ed
   Maste, John Baldwin, and myself.  A number of simplifications including
   minor speedups have been committed.

Portions of this work were developed by SRI International and the
University of Cambridge Computer Laboratory (Department of Computer
Science and Technology) under DARPA/AFRL contract FA8750-10-C-0237
("CTSRD"), as part of the DARPA CRASH research programme and under DARPA
contract HR0011-18-C-0016 ("ECATS"), as part of the DARPA SSITH research
programme.

Work in progress includes cleanups to the APIs used by the kernel when
creating processes and continued `ioctl` improvements.  Works is also
underway to generate the 32-bit system call list from the "default"
list.

The remaining `ioctl` commands handled in
[sys/compat/freebsd32/freebsd32_ioctl.c](https://svnweb.freebsd.org/base/head/sys/compat/freebsd32/freebsd32_ioctl.c?view=log)
need to be migrated to the point of implementation. Help with the latter
would be appreciated.
