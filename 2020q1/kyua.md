## Import of the Kyua test framework ##

Link:	 [The FreeBSD Test Suite](https://wiki.freebsd.org/TestSuite)

Contact: Brooks Davis <brooks@FreeBSD.org>

The FreeBSD test suite uses the Kyua test framework to run tests.

Historically Kyua has been installed from the ports collection
(`devel/kyua`).  While this is fine for mainstream architectures,
it can pose bootstrapping issues on new architectures and package
installation is quite slow under emulation or on FPGA based systems.
By including it in the FreeBSD base system we can avoid these issues.

We hope that this inclusion will spur testing of embedded platforms
and simplify the process of testing within continuous integration
systems.

We currently plan to retain the `devel/kyua` port to serve FreeBSD
versions without and to serve as a development version.

Sponsor: DARPA
