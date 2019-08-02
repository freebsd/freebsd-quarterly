## Fuzzing FreeBSD with syzkaller

Contact: Mark Johnston, <markj@FreeBSD.org>  
Contact: Andrew Turner, <andrew@FreeBSD.org>  
Contact: Michael Tuexen, <tuexen@FreeBSD.org>  
Contact: Ed Maste, <emaste@FreeBSD.org>  

Link:	 [syzkaller](https://github.com/google/syzkaller)  

See the syzkaller entry in the 2019q1 quarterly report for an
introduction to syzkaller.

syzkaller continues to find FreeBSD kernel bugs.  A number of
such bugs have been fixed in the past quarter, and we continue
to investigate and fix bug reports from syzkaller.  Work to
extend syzkaller's capabilites has progressed: Andrew Turner
has implemented support for fuzzing the 32-bit compatibility
layer in amd64 kernels, helping illuminate some of the darker
corners of the kernel, and it is now possible to use bhyve as
a VM backend to syzkaller, so it is now efficient and convenient
to fuzz FreeBSD on FreeBSD.

Some planned work includes: enabling the use of ZFS as the
base filesystem for fuzzer VMs; extending the range of system
calls and ioctls covered by syzkaller; enabling LLVM sanitizers
in the kernel so as to catch more issues; and making use of
netdump(4) to capture kernel dumps for panics found by syzkaller,
making it much easier to diagnose bugs for which syzkaller was
unable to find a reproducible test case.

Sponsor: The FreeBSD Foundation
