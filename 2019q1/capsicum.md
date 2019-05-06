## Capsicum

Contact: Enji Cooper <ngie@freebsd.org>
Contact: Mark Johnston <markj@FreeBSD.org>
Contact: Ed Maste <emaste@FreeBSD.org>
Contact: Mariusz Zaborski <oshogbo@FreeBSD.org>
Contact: Bora Özarslan <borako.ozarslan@gmail.com>

Links
[Capsicum Wiki Page](https://wiki.FreeBSD.org/Capsicum)

Three themes for Capsicum work were:
 * Importing Google's Capsicum test suite into FreeBSD
 * Porting and sandboxing openrsync for FreeBSD
 * Applying capsicum to additional base system utilities

The Googletest-based Capsicum test cases are now integrated into
FreeBSD. After some discussion with David Drysdale - the main
maintainer and developer for the Capsicum port on Linux - we decided that
from now the FreeBSD will be upstream for Capsicum test cases.

The next major step was sandboxing openrsync. In the course of that work we
extended our fileargs service with two new functionalities.  We modified
the fileargs service to allow limiting the operations which can be performed,
and can now delegate `lstat` to the Casper service.

Furthermore, openrsync highly depends on the `fts` API. We spend
some time in optimizing `fts` and making it sandbox friendly by
introducing `fts_openat` function and removing the need to change the
working directory to traverse the paths. The changes to the `fts` API
are now in the tests phase.

Moreover, we improved bootstrapping for non-FreeBSD machines. Thanks
to this work we can now build tools needed to bootstrap FreeBSD which
use Casper services. In the base system `strings` is now sandboxed as a
result.

We also sandboxed `rtsol`, `rtsold`, and `savecore`.

We host biweekly Capsicum calls. The notes from the meetings are published
in FreeBSD's
[Capsium meeting repository](https://github.com/freebsd/meetings/tree/master/capsicum)
on GitHub.
If you would like to join the call do not hesitate to send us an email.
