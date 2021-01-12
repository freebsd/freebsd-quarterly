## Python 2.7 removal from Ports ##

Link:    [About FreeBSD Ports](https://www.FreeBSD.org/ports/)  
Link:    [Ports Management Team](https://www.freebsd.org/portmgr/index.html)  
Link:    [[meta] Ports broken by Python 2.7 End-of-Life and removal](https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=249337)  

Contact: René Ladan <portmgr-secretary@FreeBSD.org>  
Contact: FreeBSD Ports Management Team <portmgr@FreeBSD.org>  

As of January 2020, Python 2.7 reached its end-of-life after several years of extensions.
Portmgr subsequently started the project of phasing Python 2.7 out of the Ports Tree by tagging lang/python27 for expiration on 2020-12-31.
Last year, some 740 ports were removed from the Ports Tree as they were incompatible with Python 3, mostly because these ports were either unmaintained or abandoned upstream.

During this process, there were several instances of an upstream still being active but where the upstream have not had the resources yet to upgrade their software to Python 3.
A noticeable example of this is www/chromium and derived software, such as devel/electron7 and www/qt5-webengine.
Portmgr is currently looking into ideas on how to minimize the impact of Python 2.7 on the Ports Tree while keeping Chromium and KDE 5 functional.
As various software packages on the FreeBSD cluster itself also use Python 2.7, portmgr started coordinating with affected parties on upgrade plans.
Currently there are 40 ports left that directly depend on Python 2.7 to build or run, and an unknown number of indirect ports.
All those ports should eventually be upgraded to Python 3 or be removed too, ideally some time this year.

Portmgr is currently cleaning up (unused) Python 2.7 code from ports which do not need Python 2.7.
New ports should not be using Python 2.7 anymore, i.e. they should not have USES=python but instead something like USES=python:3.6+.

So while this all looks rather invasive, it is not feasible to keep Python 2.7 around for much longer.
Over time security vulnerabilities might show up which will likely no longer be fixed, because the Python Software Foundation no longer supports Python 2.7.
Other problems are that the software gets outdated over time and thereby loses its usefulness as part of a development kit.

Help needed:

  * Coordinate with postmaster on isolating or migrating away from mail/mailman
  * Coordinate with clusteradm (?) for upgrading svnweb and our wiki
