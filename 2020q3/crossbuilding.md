## Building FreeBSD on non-FreeBSD hosts ##

Link:	 [Wiki](https://wiki.freebsd.org/BuildingOnNonFreeBSD)  

Contact: Alex Richardson <arichardson@freebsd.org>  

Until recently FreeBSD could only be built on a FreeBSD host.
However, most free CI tools only allow building on Linux or macOS and therefore
can not be used for building the FreeBSD base system. Furthermore, it is
sometimes useful to cross-build FreeBSD for a remote machine or an emulator
even if the build machine is not running FreeBSD.
The goal of this project is to allow building the base system on Linux and macOS
hosts.

I started this project in 2017 to allow building
[CheriBSD](https://github.com/CTSRD-CHERI/cheribsd) on the Linux servers and
desktops that many of us working on the [CHERI project](http://www.cheri-cpu.com)
use. The first few patches were upstreamed in 2018 (see the 2018q3 report) and
I merged the full set of patches to CheriBSD shortly after. Over the past two
years I have slowly been upstreaming the remaining patches and finally comitted
the last required change in time for this report.

As of September 2020 it should be possible to use the `buildworld` and
`buildkernel` make targets to build a fully-functional FreeBSD installation
on macOS and Linux hosts. We use this in our continuos integration system to
build and test CheriBSD disk images for multiple architectures.
I have also committed a [GitHub Actions](https://github.com/features/actions)
configuration upstream that takes approximately 10 minutes to build an amd64
kernel. This will ensure that changes that break crossbuilding from Linux/macOS
can be detected easily.

Upstreaming the crossbuilding changes has resulted in various build system
cleanups. For example, we now [no longer need to use lorder.sh](https://reviews.freebsd.org/rS365836)
when building libraries which speeds up the linking step a bit.
The portability and bootstrapping changes should also make it easier
to upgrade from older versions since we no longer rely on host headers in
`/usr/include` matching those of the target system (e.g. when bootstrapping
localedef, etc.).

While this support for building on Linux and macOS should still be considered
experimental, it should work in many cases. If you would like to give it a try,
the following command line should successfully build an amd64 world on Linux
and macOS systems that have packages for LLVM 10 (or newer) installed:
`MAKEOBJDIRPREFIX=/somewhere ./tools/build/make.py TARGET=amd64 TARGET_ARCH=amd64 buildworld`
Builds must be performed using the `./tools/build/make.py` wrapper script since
most Linux and macOS systems do not ship an appropriate version of bmake.
Please let me know if you encounter any issues.

Sponsor: DARPA
