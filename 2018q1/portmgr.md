<project cat='team'>
  <title>Ports Collection</title>

Contact: René Ladan, <portmgr-secretary@FreeBSD.org</email>
Contact: Ports Management Team, <portmgr@FreeBSD.org>

Link:	[About FreeBSD Ports](https://www.FreeBSD.org/ports/)
Link:	[Contributing to ports](https://www.freebsd.org/doc/en_US.ISO8859-1/articles/contributing/ports-contributing.html)
Link:	[FreeBSD ports monitoring](http://portsmon.freebsd.org/index.html)
Link:	[Ports management Team](https://www.freebsd.org/portmgr/index.html)
Link:	[FreeBSD portmgr (@freebsd_portmgr)](https://twitter.com/freebsd_portmgr/)
Link:	[FreeBSD Ports Management Team)](https://www.facebook.com/portmgr)
Link:	[FreeBSD Ports Management Team)](https://plus.google.com/communities/108335846196454338383)

In the last quarter, the number of ports grew to almost 32,000. There
are currently 2,100 open PRs with less than 600 unassigned.  There were
7,900 commits from 169 committers. Compared to last quarter, the number
of commits grew by 18% and the number of PRs dropped by 25%.  Those are
some good numbers.

During the last quarter, we took seven commit bits in for safekeeping:
maho, wxs, vg, tabthorpe, pawel, junovitch, and kevlo.  On the other
hand, we welcomed six new committers: Eric Turgeon (ericbsd), Devin Teske
(dteske), Matthias Fechner (mfechner), Fernando Apesteguía (fernape),
Koichiro IWAO (meta), and Sean Chittenden (seanc, returning).

Three new USES were introduced:

      - apache: handle dependencies on the Apache web server and modules
      - eigen: automatically depend on math/eigen2 or math/eigen3
      - emacs: handle dependencies on the Emacs editor and modules.

EXTRA_PATCHES has been extended to support
directories, in which case it will automatically apply all
patch-* files to the port.  Ports using USES=php:phpize,
php:ext, php:zend, and
php:pecl are now flavored and packages will
automatically be built for all versions they support (5.6, 7.0, 7.1 or
7.2).

Last quarter again saw some updates of major ports: pkg 1.10.5, Chromium
65.0.3325.181, Firefox 59.0.2 and Firefox-ESR 52.7.3, Ruby 2.3.7/2.5.1
and Qt5 5.9.4.

During the last three months, no less than 43 exp-runs were ran to test
updates and to perform cleanups and improvements to the framework and the
base system.
