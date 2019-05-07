## Fuzzing FreeBSD with syzkaller

Contact: Mark Johnston, <markj@FreeBSD.org>  
Contact: Andrew Turner, <andrew@FreeBSD.org>  
Contact: Michael Tuexen, <tuexen@FreeBSD.org>  
Contact: Ed Maste, <emaste@FreeBSD.org>  

Link:	 [syzkaller](https://github.com/google/syzkaller)  

Syzkaller is a coverage-guided system call fuzzer.  It was originally
developed for Linux.  It programmatically creates programs consisting
of sequences of random system calls and executes them in a VM
(virtual machine).  Using feedback from a kernel code coverage
facility called kcov, syskaller mutates the generated test programs
in an attempt to expand the executed coverage of code paths within
the kernel.  Sometimes exercising a seldom or infrequently used
code path will crash the kernel. When syzkaller manages to crash
the running kernel in the VM, it attempts to generate a minimal
test case which reproduces the crash, simplifying debugging.
Syzkaller is very effective at finding kernel bugs and has uncovered
hundreds of issues in Linux.  Over the past couple of years,
syzkaller's author, Dmitry Vyukov, has added support for other
operating systems, including FreeBSD.

Recently, a number of FreeBSD developers have been using syzkaller
to find and fix bugs in the FreeBSD kernel.  If interested, one can
search the commit logs for "syzkaller" to find examples.  Syzkaller
can be run on a FreeBSD or Linux host to fuzz FreeBSD running in
QEMU instances.  It can also fuzz FreeBSD instances running on GCE
(Google Compute Engine).  Additionally, Google maintains a dedicated
cluster of GCE hosts to continuously fuzz the latest builds of
several different OS kernels.  A [FreeBSD
target](https://syzkaller.appspot.com/freebsd) was recently added.
Subscribe to the
[syzkaller-freebsd-bugs](https://groups.google.com/forum/#!forum/syzkaller-freebsd-bugs)
Google Group to receive notifications for newly discovered bugs.

Work is ongoing to improve syzkaller's coverage of FreeBSD's system
calls.  In particular, syzkaller needs to be taught about all of
the target kernel's entry points and argument types in order to be
useful.  Many of the standard POSIX system calls are already covered,
but most FreeBSD-specific system calls are not.  Similarly, many
ioctl(2) definitions are missing.

Some in-progress work aims to add support for bhyve as a VM backend
for syzkaller, making it easier to fuzz FreeBSD VMs hosted on
FreeBSD.  Currently that can be done using QEMU, but QEMU on FreeBSD
lacks support for hardware acceleration.  See the
[PR](https://github.com/google/syzkaller/pull/1150) for the
implementation.

Finally, a number of bugs identified by syzkaller have yet to be
fixed.  If you are interested in helping out with any of the above,
please mail the contacts listed above.

Sponsor: The FreeBSD Foundation
