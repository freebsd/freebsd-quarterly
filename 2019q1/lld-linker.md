## LLVM's lld as the FreeBSD system linker ##

Contact: Ed Maste, <emaste@freebsd.org>  

Link:    [LLD on the FreeBSD Wiki](https://wiki.freebsd.org/LLD)  
Link:    [lld exp-run](https://bugs.freebsd.org/214864)  

In FreeBSD-HEAD and 12.0 the default FreeBSD system linker
(i.e., `/usr/bin/ld`) is LLVM's lld, on amd64, arm64, and armv7.
For i386 in 12.0 lld is used as the bootstrap linker
(i.e., to build the kernel and base system) but it is not enabled
as the system linker because of multiple issues building FreeBSD ports
with it enabled.

The primary issue affecting i386 with lld is that many ports build
position-dependent code (i.e., non-PIC) for use in shared libraries.
This either comes from omitting the `-fPIC` compiler flag, or using
hand-written position-dependent assembly. Compared with other
CPU architectures i386 position-independent code is rather inefficient,
which may be responsible for port authors making an explicit decision
to avoid PIC.

By default lld does not allow position-dependent code in shared objects
(in particular, it does not permit relocations against read-only segments -
typically containing the`.text` section).

Over the last quarter many commits were made to the ports tree to fix
the build when the system linker is lld - either building PIC code,
or adding the `-znotext` linker flag to permit relocations against
read-only segments, or just switching the port to link with GNU ld
if it is incompatible with lld in some other way.

At this point there are only a few dozen open bug reports for issues
linking ports with lld as the system linker, and I expect FreeBSD 12.1
to use lld as the system linker on i386 as well.

Tasks:
  * Fix freepascal/Lazarus ports with lld
  * Triage and address remaining port failures
  * Holistic review of lld workarounds in the ports tree, to identify changes
    that are no longer needed, should be addressed in lld, or should be sent
    upstream

Sponsor: The FreeBSD Foundation  
