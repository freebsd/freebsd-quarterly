## FreeBSD KDE status report ##

Contact: Adriaan de Groot <adridg@FreeBSD.org>, Tobias C. Berner <tcberner@FreeBSD.org>

Link:	 [KDE FreeBSD](https://freebsd.kde.org/)


First of all, we removed KDE 4 from the ports tree this quarter.
Qt4 will follow it by the end of march.

Thanks to the update of libinput in ports we could finally update Plasma Desktop
past 5.12, and are now again in sync with the upstream releases.

KDE Frameworks and Applications were also kept in sync with upstream.

We've also updated Qt5 to 5.12 -- with QtWebEngine still hanging on on 5.9.5
for now, but thanks to a new contributor we should have 5.12 by the end of Q1.

In the background we changed the default behaviour of cmake in the ports tree
to default to outsource builds.

People who are willing to contribute can find us on #kde-freebsd on freenode,
and the kde@FreeBSD.org mailing list. Further we accept pull-requests and
contributions on github.com/freebsd/freebsd-ports-kde.
