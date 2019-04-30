## Fuzzing FreeBSD with syzkaller

Contact: Mark Johnston, <markj@FreeBSD.org>
Contact: Andrew Turner, <andrew@FreeBSD.org>
Contact: Michael Tuexen, <tuexen@FreeBSD.org>
Contact: Ed Maste, <emaste@FreeBSD.org>

Link:	 [syzkaller](https://github.com/google/syzkaller)

syzkaller is a coverage-guided system call fuzzer originally
developed for Linux.  It generates programs consisting of
sequences of random system calls and executes them in a VM;
using feedback from a kernel code coverage facility called
kcov, it mutates these test programs in an attempt to expand
its coverage of code paths within the kernel.  Once syzkaller
manages to crash the running kernel, it attempts to generate
a minimal test case which reproduces the crash, simplifying
debugging.  syzkaller is very effective at finding kernel bugs
and has uncovered hundreds of issues in Linux.  Over the past
couple of years, syzkaller's author has added support for other
operating systems, including FreeBSD.

Of late, a number of developers have been using syzkaller to
find and fix bugs in FreeBSD.  Search the commit logs for
"syzkaller" to find examples.  syzkaller can be run on a FreeBSD
or Linux host to fuzz FreeBSD running in QEMU instances, and can
also fuzz FreeBSD running on GCE (Google Compute Engine).
Additionally, Google maintains a dedicated cluster of GCE hosts
to continuously fuzz the latest builds of several different OS
kernels.  A [FreeBSD target](https://syzkaller.appspot.com/freebsd)
was recently added.  Subscribe to the
[syzkaller-freebsd-bugs](https://groups.google.com/forum/#!forum/syzkaller-freebsd-bugs)
Google Group to receive notifications for newly discovered bugs.

Work is ongoing to improve syzkaller's coverage of FreeBSD's system
calls.  In particular, syzkaller needs to be taught about all of
the target kernel's entry points and argument types in order to be
useful.  Many of the standard POSIX system calls are already covered,
but most FreeBSD-specific system calls are not.  Similarly, many
ioctl(2) definitions are missing.

Some in-progress work aims to add support for bhyve as a VM backend
for syzkaller, making it easier to fuzz FreeBSD on FreeBSD.  Currently
that can be done using QEMU, but QEMU on FreeBSD lacks support for
hardware acceleration.

Finally, a number of bugs identified by syzkaller have yet to be
fixed.  If you are interested in helping out with any of the above,
please mail the contacts listed above.
