## Import of new implementation of bc and dc ##

Link:    [official repository](https://git.yzena.com/gavin/bc)
Link:    [repository mirror on GitHub](https://github.com/gavinhoward/bc/)

Contact: Stefan Eßer <se@FreeBSD.org>
Contact: Gavin D. Howard <yzena.tech@gmail.com>

A new version of bc and dc has been imported into FreeBSD-CURRENT
and enabled by default.
An import into 12-STABLE is planned before the end of July, but it
will not be enabled by default (will require "WITH\_GH\_BC=yes" to
be set in /etc/src.conf).

This version has been developed by Gavin D. Howard with the goal
to provide a highly portable and POSIX compatible implementation.
It offers GNU bc compatibility and should be a drop-in replacement
for the bc in FreeBSD, except for standard-violating behavior of
the bc currently in FreeBSD (e.g., the modulo operator).

Additional features:

* High performance (up to more than a factor of 100 faster than
  the current FreeBSD implementation in some tests)
* support of message catalogs with a large number of languages
  supported in the current release (contributions of further
  translations are welcome).
* Extra built-in functions and operators.
* Extended library of advanced math functions
* Detailed man-page explaining standard conformant and extended
  features
* One shared binary for bc and dc (bc is not just a pre-processor
  that relies on dc for the actual computations)

The only dc feature not supported by the dc is the execution of
sub-processes, since the author considers it a security hazard
for a calculator to have.

This code is also available as a port and package (math/gh-bc or
gh-bc), e.g. for use with a FreeBSD binary release.
