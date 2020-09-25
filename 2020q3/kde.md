## KDE on FreeBSD ##

Link:    [KDE FreeBSD](https://freebsd.kde.org/)  
Link:    [KDE Community FreeBSD](https://community.kde.org/FreeBSD)  

Contact: Adriaan de Groot <kde@FreeBSD.org>  

The *KDE on FreeBSD* project aims to package all of the software 
produced by the KDE Community for the FreeBSD ports tree.
The software includes a
full desktop environment *KDE Plasma*, 
an IDE [KDevelop](https://www.kdevelop.org/),
a PIM suite [Kontact](https://kontact.kde.org/)
and hundreds of other applications that can be used on
any FreeBSD machine.

With the continuation of the ever-so-peculiar era of
almost-only-online, the KDE community has shifted gears
and also gone for online events. The yearly conference, 
[Akademy](https://akademy.kde.org/2020/),
was conducted online over video calls.
Meanwhile, software continues to be released,
so this quarter the kde@ team:

 - put the beta of the **next** version of KDE Plasma, scheduled for 
   official release in october 2020, into the 
   [Area51 development](https://community.kde.org/FreeBSD/Setup/Area51) tree.
   Area51 is a fork of the FreeBSD ports tree where new development for
   KDE ports happens.
 - the monthly regular updates to the KDE Plasma desktop landed on-time
   and safely.
 - with three months in a quarter, there were also three releases of
   KDE Frameworks 5, including a new framework for handling DAV jobs.
 - the June applications update and its .1 release landed a bit late,
   but bring with usual raft of updates to KDE applications and libraries.
 - a new [Digikam](https://www.digikam.org/) release arrived in
   the ports tree on the day of its release.
 - a new [KDevelop](https://www.kdevelop.org/) release arrived a day
   after the release. This update contains a number of crash fixes
   for refactoring support.
 - Qt was updated to Qt 5.15, the last in the Qt5 series and an LTS
   version. Bugfix releases are expected, but the next major Qt will
   be Qt 6.
   
On the infrastructure front, august saw some minor updates to CMake and ninja.
*kde@* continues to support the work of *xorg@* and *gnome@* in maintaining
the Free Desktop stack on FreeBSD, including XOrg, poppler, and xdg-utils.
A new `MAINTAINER` group, desktop@, has been created to provide
shared ownership of that shared stack.

With Python2 deprecation looming, the build system for QtWebEngine --
itself a fork of Chromium -- is becoming a pressing issue in Q4
and will no doubt chew up a lot of time in the coming months.
