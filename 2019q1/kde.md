## FreeBSD KDE status report ##

Contact: Adriaan de Groot, <adridg@FreeBSD.org>
Contact: Tobias C. Berner, <tcberner@FreeBSD.org>

Link:	 [KDE FreeBSD](https://freebsd.kde.org/)

The two biggest accomplishements this quarter were:
* Qt4 and all its consumers have been removed from the ports tree.
* www/qt5-webengine has been updated from the ancient 5.9.4 to 5.12.x by kai@

Further we have kept the KDE Frameworks, Plasma and Applications
ports up to date with upstreams releases, which thanks to upstreams'
FreeBSD-CI uses less and less patches.

All the kde@ maintained ports (including cmake) have been kept up
to date with their releases.

The plans for the next quarter are in no particular order
* Cleanup PyQt ports and pyqt.mk
* Improve qt.mk components
* Update sddm to 0.18.x
* Implement user management functionality in system settings (write
  non-logind backend)

People who are willing to contribute can find us on #kde-freebsd
on freenode, and the kde@FreeBSD.org mailing list. Further we accept
pull-requests and contributions on github.com/freebsd/freebsd-ports-kde.
