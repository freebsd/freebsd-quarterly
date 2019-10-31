## KDE on FreeBSD ##

Contact: Adriaan de Groot <kde@FreeBSD.org>  

Link:	 [KDE FreeBSD](https://freebsd.kde.org/)  
Link:	 [KDE Community FreeBSD](https://community.kde.org/FreeBSD)  

The *KDE on FreeBSD* project packages the software produced by
the KDE Community for FreeBSD. The software includes a
full desktop environment, the art application 
[Krita](https://krita.org/), video editor [Kdenlive](https://kdenlive.org)
and hundreds of other applications that can be used on
any FreeBSD desktop machine.

Along with KDE itself, the team maintains the Qt libraries,
cmake, and a handful of other C++ libraries used in the KDE stack.

The upstream releases KDE Frameworks (libraries) on a monthly
cycle, KDE Plasma (the desktop environment) quarterly and
a collection of KDE Applications (usable everywhere) twice a year.
The KDE on FreeBSD team chased a dozen updates to these components
so that FreeBSD remains one of the most up-to-date systems
with KDE software (and Qt).

A large (and possibly breaking, still needs more investigation)
change came with the release to KDE's Digikam 6.3.0, which stopped
using its previous plugins system (the "old" plugins are still used
by other KDE software).

A new entry in the net-im category was added for Ruqola, a
Rocket.chat client for rich instant-messaging.

CMake was updated twice. This forces the rebuild of several thousand
C++-based ports. The KDE on FreeBSD team then fixes those ports,
regardless of whether the error is in the CMake update, or in
the upstream code. These updates tend to take a large amount of effort,
since they touch unfamiliar (and often very-very-legacy) code.

The [open bugs list](https://bugs.freebsd.org/bugzilla/buglist.cgi?bug_status=New&bug_status=Open&bug_status=In%20Progress&bug_status=UNCONFIRMED&email1=kde%40FreeBSD.org&emailassigned_to1=1&emailtype1=substring&f0=OP&f1=OP&f2=product&f3=component&f4=alias&f5=short_desc&f7=CP&f8=CP&f9=assigned_to&j1=OR&j_top=OR&o2=substring&o3=substring&o4=substring&o5=substring&o9=substring&query_format=advanced&v2=kde%40&v3=kde%40&v4=kde%40&v5=kde%40&v9=kde%40&human=1)
grew to 24 this quarter.
It tends to hover around 20 items as new things come in
and old ones are resolved. We welcome detailed bug reports
and patches. KDE packaging updates are prepared in
a [copy of the ports repository](https://github.com/freebsd/freebsd-ports-kde/)
on GitHub and then merged in SVN. We welcome pull requests
there as well.
