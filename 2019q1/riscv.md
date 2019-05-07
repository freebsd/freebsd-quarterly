## FreeBSD/RISC-V Update ##

Contact: Ruslan Bukin, <br@FreeBSD.org>  
Contact: Mitchell Horne, <mhorne@FreeBSD.org>  
Contact: Mark Johnston, <markj@FreeBSD.org>  

Work has continued on RISC-V port in the past quarter.

Support for transparent superpage promotion was added to the RISC-V
port, meaning that applications will now automatically use large
page mappings when possible.  Per-CPU pmap activation tracking was
added, reducing the overhead of various pmap operations.  This
noticeably improves the responsiveness of FreeBSD when running in
a multi-CPU virtual machine.

A RISC-V implementation of minidumps was completed.  Support for
debugging RISC-V kernel dumps will land in devel/gdb after the
next GDB release.

It is now possible to compile the in-tree LLVM's RISC-V target by
setting WITH_LLVM_TARGET_RISCV=YES in /etc/src.conf.  The use of
LLVM to compile the RISC-V port is currently experimental and
further investigation is ongoing.

Work is ongoing to bring up FreeBSD on SiFive's HiFive Unleashed
development board now that one has been obtained by a FreeBSD
developer.  We also expect to work on support for a new version
of the SBI specification.

Sponsor: The FreeBSD Foundation  
Sponsor: DARPA, AFRL  
