## Java on FreeBSD ##

Contact: Greg Lewis, <glewis@FreeBSD.org>

Link:    [OpenJDK 11 repository at FreeBSD GitHub](https://github.com/freebsd/openjdk-jdk11u)

Over the last few quarters there has been considerable work in improving
support for Java 11 and higher, with some work being back ported to Java 8.

Starting with the initial release in March on amd64, over the
intervening months FreeBSD support was added for features such as:

  * Java Flight Recorder
  * HotSpot Serviceability Agent
  * HotSpot Debugger
  * DTrace
  * Javac Server
  * Java Sound
  * SCTP

In addition, support for the aarch64, i386 and powerpc64 architectures
was also added.

With most features supported, attention turned to compliance, using the
internal JDK test suite as a method of measuring this.  Most work during
the third quarter has focused on this, with test failures dropping from
50+ failures to only 2 tier1 test failures (which don't appear to impact
functionality at all).  Some significant fixes include:

  * A stack overflow crash
  * Errors in external process handling
  * The unpack200 utility (on little endian systems)
  * HotSpot Debugger functionality such as thread enumeration
  * Networking functionality

Finally, this work has been forward ported to Java 12 and 13, with FreeBSD
gaining support for these versions on or just after the day of release.

Note that this work has been a collaboration with many others.  While there
are too many contributors to list here (please take a look at the commit
history of the GitHub repository), I'd like to recognise Kurt Miller of
OpenBSD for his tireless work as a co-collaborator on Java for BSD through
many years.

I'm also grateful to the sponsorship of the FreeBSD Foundation, which has
allowed me to focus on this work for Q3.

Sponsor: FreeBSD Foundation
