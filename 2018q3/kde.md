## FreeBSD KDE status report ##

Contact: Adriaan de Groot, Tobias C. Berner, <kde@FreeBSD.org>

Link:	 [KDE FreeBSD](https://freebsd.kde.org/)

KDE FreeBSD is responsible for the ports of the Plasma5 and KDE4 desktops, and
all associated applications. Further we also manage the Qt4 and Qt5 ports, as
well as cmake.

We also care for the FreeBSD builders for KDE's upstream CI on build.kde.org.

Since the last status report a lot of things have changed. First and foremost,
the Plasma5 Desktop and the Qt5 bases KDE Applications have finally made their
way into the official ports tree after lingering for multiple years in our
development repository.

Secondly KDE4 has been marked deprecated and will be removed by the end of the
year. With Qt4 following no later than the next year (due to the exponentially
increasing burden of maintenance).

On a more technical side, bsd.qt.mk has been replaced by qt.mk and qt-dist.mk.

Further we have been keeping cmake and Qt5 and almost every other port under our
control up to date.

One big issue we have is www/qt5-webengine, which requires too much time to keep
up to date.

People who are willing to contribute can find us on #kde-freebsd on freenode,
the kde@freebsd.org mailing list. Further we accept pull-requests and
contributions on github.com/freebsd/freebsd-ports-kde.
