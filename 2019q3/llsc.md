## Casueword(9) livelock ##

Contact: Konstantin Belousov, <kib@FreeBSD.org>

The Compare-And-Swap (CAS) is one of the fundamental building blocks
for hardware-assisted atomic read/modify/write operations.  Some
architectures support it directly, for instance x86 and sparc.  Other
provide a different building blocks, usually the pair of Load
Linked/Store Conditional instructions (ll/sc) which allow to construct
CAS or other atomic operations like Fetch-And-Add or any of atomic
arithmetic ops using plain arithmetic instructions.  Example are LDXR.

The ll/sc operation is performed by first using the load linked
instruction to load a value from memory and simultaneously mark the
cache line for exclusive access.  The value is then updated by the
store conditional instruction, but only if there were no any writes to
the marked cache line.  Any write by other CPUs make the store
instruction fail.  So typically atomic primitives on ll/sc
architectures retry the whole operation if only store failed, because
it just means that this CPU either lost a race, or even the failure
was spurious.  This is so called strong version of CAS and atomics.
If primitive returns failure instead, the CAS variant is called weak
by C standard.

For FreeBSD threading library locks implementation, in case fast path
mode in userspace was not possible, kernel often needs to do a CAS
operation on user memory location.  In addition to all guarantees of
normal CAS, it also must ensure the safety and tolerance to paging.
In FreeBSD, the casueword32(9) primitive provides CAS on usermode
32bit words for kernel.  Casueword32(9) was implemented as strong CAS,
similarly to the mode of operation of hardware CAS instructions on
x86.

Using the strong implementation for casueword is apparently dangerous,
since the same address is potentially accessible to other, potentially
malicious, threads in the same process or even to other process.  If
such thread constantly dirties the cache line used by ll/sc loop, it
practically could make the kernel-mode thread to stuck in the loop
forever.  Since the loop is tight, and it does not check for signals,
the thread cannot be stopped or killed.

Solution is to make casueword implementation weak, which means that
the interface of the primitive must be changed to allow to notify
caller about spurious failures.  Also, it is the caller responsibility
now to retry as appropriate.

The change to casueword was made for all architectures.  Even on x86,
the PSL.ZF value after the CMPXCHG instruction was returned directly
for the new casueword.  All two dozens uses of the primitive, all
located in kern_umtx.c, were inspected and retry added as needed.

As somewhat related note, in-kernel atomic_cmpset(9) operations are
strong, while atomic_fcmpset(9) should be weak, unless broken by
specific architecture.  General attitude seems to be that retry is the
duty of the primitive caller.

Sponsor: The FreeBSD Foundation
