## Building FreeBSD on non-FreeBSD hosts ##

Contact: Alex Richardson, <arichardson@freebsd.org>

Link:	 [Wiki](https://wiki.freebsd.org/BuildingOnNonFreeBSD) and [GitHub project](https://github.com/arichardson/freebsd/tree/crossbuild-aug2018)

Currently FreeBSD can only be built on a FreeBSD host. However, most free
CI tools only allow building on Linux or macOS. Furthermore, this would allow
developers to work on FreeBSD even if they don't have a FreeBSD build system.
The current target is to allow building on both Linux and macOS but in the future
it may even be possible to compile on a Windows host.

When using the current prototype it is possible to compile both world and kernel for
archictures using clang as well as MIPS64. However, some options such as LOCALES are
not supported yet and require further changes before the bootstrap tools can be built
on Linux/macOS.

Some changes required for building on non-FreeBSD have already been merged to
HEAD but there is still a rather large amount of changes that need review.

If you are interested in getting this into HEAD and would like to help, please
try the current prototype and report any issues to arichardson@freebsd.org.
If you can help with reviewing the changes please contact arichardson@freebsd.org
to be added to any pending Phabricator reviews.
