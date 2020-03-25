## KDE on FreeBSD ##

Link:    [KDE FreeBSD](https://freebsd.kde.org/)  
Link:    [KDE Community FreeBSD](https://community.kde.org/FreeBSD)  

Contact: Adriaan de Groot <kde@FreeBSD.org>  

The *KDE on FreeBSD* project packages the software produced by
the KDE Community for FreeBSD. The software includes a
full desktop environment KDE Plasma, the art application 
[Krita](https://krita.org/), video editor [Kdenlive](https://kdenlive.org)
and hundreds of other applications that can be used on
any FreeBSD desktop machine.

The quarter opened with a new kstars (amateur astronomy application)
release landing in ports, and then had the usual regular updates:

- three KDE Frameworks releases (on a monthly schedule),
- three bugfix releases to the collection of KDE software from
  the KDE release service (formerly *KDE Applications*, but it was
  always more that only-applications),
- three bugfix releases to the KDE Plasma desktop.

There were no substantial Qt updates but four bugfix releases for
`devel/cmake`, and regular work all over the ports tree.

One update to `devel/qca` dropped compatibility with FreeBSD 11
because upstream no longer supports older OpenSSL versions.
There is infrastructure in the ports tree now that adds a `USES=qca`
for Qt applications needing crypto support.

The [open bugs list](https://bugs.freebsd.org/bugzilla/buglist.cgi?bug_status=New&bug_status=Open&bug_status=In%20Progress&bug_status=UNCONFIRMED&email1=kde%40FreeBSD.org&emailassigned_to1=1&emailtype1=substring&f0=OP&f1=OP&f2=product&f3=component&f4=alias&f5=short_desc&f7=CP&f8=CP&f9=assigned_to&j1=OR&j_top=OR&o2=substring&o3=substring&o4=substring&o5=substring&o9=substring&query_format=advanced&v2=kde%40&v3=kde%40&v4=kde%40&v5=kde%40&v9=kde%40&human=1)
remains stable around 28 open issues,
with some interesting xkb issues as a highlight.
We welcome detailed bug reports
and patches. KDE packaging updates are prepared in
a [copy of the ports repository](https://github.com/freebsd/freebsd-ports-kde/)
on GitHub and then merged in SVN. We welcome pull requests
there as well.

