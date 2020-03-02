## Ports Collection ##

Link:	 [About FreeBSD Ports](https://www.FreeBSD.org/ports/)  
Link:	 [Contributing to Ports](https://www.freebsd.org/doc/en_US.ISO8859-1/articles/contributing/ports-contributing.html)  
Link:	 [FreeBSD Ports Monitoring](http://portsmon.freebsd.org/index.html)  
Link:	 [Ports Management Team](https://www.freebsd.org/portmgr/index.html)  

Contact: René Ladan <portmgr-secretary@FreeBSD.org>  
Contact: FreeBSD Ports Management Team <portmgr@FreeBSD.org>  

The FreeBSD Ports Management Team, tasked with overseeing the Ports Tree and
its committers, reports that the following events happened during 2019Q3:

The number of ports grew to just under 38,000 during the last quarter.  We have
just over 2,000 open ports PRs, of which 400 are unassigned.  In this period,
169 committers made 7,340 commits to HEAD and 561 commits to the quarterly
branch.  This shows that the trend of last quarter of increased activity is
continuing.

During the last quarter, we welcomed Santhosh Raju (fox@) and Dmitri Goutnik
(dmgk@) to the team, and said goodbye to gabor@.  During the last quarter,
feld@ decided to step down from the portmgr@ and ports-secteam@ teams.  We
would like to thank them for their past services.

In the last three months, bapt@ put on his engineering hat and released a new
version of pkg (1.12), added support for overlays to the Ports Tree, fixed
two Make targets (deinstall-depends and reinstall), and cleaned up
bsd.sites.mk.

On the infrastructure side, USES=pure became obsolete and has therefore been
removed, and two new USES, xorg and xorg-cat have been added and replace the
old bsd.xorg.mk.  Two new keywords, ldconfig and ldconfig-linux, were added to
simplify formatting of package lists.

A number of default versions changed: Lazarus to 2.0.4, Linux to CentOS 7,
LLVM to 9.0, Perl to 5.30, PostgreSQL to 11, and Ruby to 2.6.  Of the big
user-visible ports, Firefox got updated to 69.0.1, Firefox-esr to 68.1.0,
Chromium to 76.0.3809.132, and Xfce to 4.14.

During the last quarter, antoine@ ran 48 exp-runs to test package updates, test
updating bsd.java.mk, test the new ldconfig and ldconfig-linux keywords, test
default version updates, test the new xorg and xorg-cat USES, test base
updates, and test various improvements to Go and Ruby.
