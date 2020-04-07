## arm64 LSE atomic instructions ##

Contact: Mark Johnston <markj@FreeBSD.org>

An investigation of some performance oddities on EC2 Graviton 2
instances resulted in support for the use of Large System Extension
(LSE) atomic instructions in the FreeBSD kernel.

LSE is an mandatory ISA extension specified in ARMv8.1.  It consists of
a number of new atomic instructions, superseding the
Load-Linked/Store-Conditional (LL/SC) instruction pairs use when LSE is
not implemented.  The extension is present in a number of ARMv8 server
platforms, including the Cavium ThunderX2 and AWS Graviton 2.  The new
instructions provide significantly better scalability.

A recent set of patches modified the FreeBSD kernel to detect support
for the LSE and dynamically select an atomic(9) implementation based on
the new instructions when all CPUs implement the extension.  The initial
atomic(9) implementations were provided by Ali Saidi.  Some benchmarking
on a 64-vCPU Graviton 2 instance shows a ~4% reduction in wall clock
time for a kernel build, and a ~15% reduction in system CPU time.

Some ARMv8 multi-processor systems implement a heterogenous CPU
architecture, referred to as big.LITTLE, in which multiple processor
types are used.  Surprisingly, such systems may implement the LSE on
only a subset of its CPUs, in which case LSE instructions cannot be used
by the kernel.  As a result, FreeBSD currently waits until all
processors are online before selecting the atomic(9) implementation,
which precludes the use of ifuncs to provide dynamic selection.

Currently atomic(9)'s use of LSE is limited to the kernel.  A future
project would extend this to userspace, so that FreeBSD system libraries
can leverage the LSE instructions when they are available.

Sponsor:	The FreeBSD Foundation
Sponsor:	Amazon
