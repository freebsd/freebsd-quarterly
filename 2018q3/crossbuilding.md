## Building FreeBSD on non-FreeBSD hosts ##

Contact: Alex Richardson, <arichardson@freebsd.org>

Link:	 [Wiki](https://wiki.freebsd.org/BuildingOnNonFreeBSD) and [GitHub project](https://github.com/arichardson/freebsd/tree/crossbuild-aug2018)

Currently FreeBSD can only be built on a FreeBSD host. However, most free
CI tools only allow building on Linux or macOS and therefore can not be used
for building the FreeBSD base system. Furthermore, it is sometimes useful to
cross-build FreeBSD for a remote machine or an emulator even if the build
machine is not running FreeBSD.
The goal of this project is to allow building FreeBSD on both Linux and macOS hosts
and in the future it may be extended to allow compiling on a Windows host.
This work originates from the CHERI project and was motivated by multiple cases of
people wanting to try out CheriBSD but not being able to compile it since they did
not have a FreeBSD system available for compiling.
Once completed this project will also allow developers to contribute to on FreeBSD
even if they don't have access to a FreeBSD build system.

The current set of patches for this project can be found on
[GitHub](https://github.com/arichardson/freebsd/tree/crossbuild-aug2018).
With the current prototype it is possible to compile both world and kernel for
archictures that use clang and for MIPS64. However, some options such as LOCALES are
not supported yet and require further changes before the bootstrap tools can be built
on Linux/macOS.

Some changes required for building on non-FreeBSD have already been merged to
HEAD but there is still a rather large amount of changes that need review.

If you are interested in getting this into HEAD and would like to help, please
try the current prototype and report any issues to arichardson@freebsd.org.
If you can help with reviewing the changes please contact arichardson@freebsd.org
to be added to any pending Phabricator reviews.
