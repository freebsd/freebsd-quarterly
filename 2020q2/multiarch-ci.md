## Continuous Integration on !x86 ##

Contact: Edward Tomasz Napierala, <trasz@FreeBSD.org>

For quite a while the [FreeBSD CI infrastructure](https://ci.FreeBSD.org)
has been running FreeBSD builds and regression tests, making it easy to
spot regressions.  While CI was building images for all architectures,
the regression tests were only run on amd64 and i386, which means they
couldn't detect architecture-specific runtime breakage.  The goal of this
project is to run them for remaining architectures - ARM, ARM64, MIPS64,
POWER, and RISC-V.

The tests are being run using common, mostly machine-independent scripts.
Those required some changes to make it possible to use QEMU in addition
to Bhyve, the hypervisor used for x86 tests.  The `sysutils/u-boot-qemu-arm`
and `sysutils/u-boot-qemu-arm64` ports were added to the Ports Collection.
Finally, each of the architectures required some tweaks, to account for
different configuration requirements - for example the MIPS64 kernel
doesn't support VirtIO disks, or even AHCI, whereas on ARM64 the U-Boot
gets confused with more than one VirtIO disk.

Remaining work:

 - Failing regression tests need to be fixed.

 - The tests are quite slow, for example the ARM64 run takes about five
   hours.  Running them automatically after each commit would quickl
   overload the CI cluster.  A solution would be to e.g. run them daily.

 - Two jobs still fail to produce results: powerpc64 deadlocks at the
   end of regression test suite due to an unkillable process, and riscv64
   panics randomly.  Those might be fixed by an upcoming QEMU port update.

Sponsor: DARPA
