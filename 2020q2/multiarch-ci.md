## Continuous Integration on !x86 ##

Contact: Edward Tomasz Napierala, <trasz@FreeBSD.org>

For quite a while the [FreeBSD CI infrastructure](https://ci.FreeBSD.org)
has been running FreeBSD builds and regression tests, making it easy to
spot regressions.  While CI was building images for all architectures,
the regression tests were only run on amd64 and i386, which means they
couldn't detect architecture-specific runtime breakage on non-x86
architectures.  This poses a problem not only for FreeBSD itself,
but also for people working on FreeBSD forks for !x86, such as the CHERI
project at University of Cambridge and SRI International.

The goal of this project is to run regression tests on the remaining
architectures supported by FreeBSD: ARM, ARM64, MIPS, POWER, and RISC-V.
The tests are being run using common, mostly machine-independent scripts.
Those required some changes to make it possible to use QEMU in addition
to Bhyve, the hypervisor used for x86 tests.  The `sysutils/u-boot-qemu-arm`
and `sysutils/u-boot-qemu-arm64` ports were added to the Ports Collection.
Finally, each of the architectures required some tweaks, to account for
different configuration requirements - for example the MIPS kernel
doesn't support VirtIO disks, or even AHCI, whereas on ARM64 the U-Boot
gets confused with more than one VirtIO disk.

On ARM, we're currently at 52 failures and 590 skipped tests, of 5925
tests ran
(https://ci.freebsd.org/job/FreeBSD-head-armv7-test/lastCompletedBuild/testReport/).
On ARM64 it's 19 failures and 160 skipped
(https://ci.freebsd.org/job/FreeBSD-head-aarch64-test/lastCompletedBuild/testReport/).
On MIPS it's 172 failures and 734 skipped
(https://ci.freebsd.org/job/FreeBSD-head-mips64-test/lastCompletedBuild/testReport/).
For POWER, and RISC-V the results are not available yet.

Remaining work:

 - Failing regression tests need to be fixed.

 - The tests are quite slow on QEMU, for example the ARM64 run takes about
   five hours.  Running them automatically after each commit would quickly
   overload the CI cluster.  A solution would be to e.g. run them daily.

 - Some of the jobs still fail to produce results: powerpc64 deadlocks at
   the end of regression test suite due to an unkillable process, riscv64
   panics randomly, and on mips64 kyua(1) often crashes on jemalloc assertion.
   Those might be fixed by an upcoming QEMU port update.

Sponsor: DARPA
