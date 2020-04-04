## Ports Collection ##

Link:	 [About FreeBSD Ports](https://www.FreeBSD.org/ports/)  
Link:	 [Contributing to Ports](https://www.freebsd.org/doc/en_US.ISO8859-1/articles/contributing/ports-contributing.html)  
Link:	 [FreeBSD Ports Monitoring](http://portsmon.freebsd.org/index.html)  
Link:	 [Ports Management Team](https://www.freebsd.org/portmgr/index.html)  

Contact: René Ladan <portmgr-secretary@FreeBSD.org>  
Contact: FreeBSD Ports Management Team <portmgr@FreeBSD.org>  

The Ports Management Team is responsible for overseeing the
overall direction of the Ports Tree, building packages, and
personnel matters.  Below is what happened in the last quarter.

During the last quarter the number of ports settled in at 39,000. 
There are currently just over 2,400 open PRs of which 640 are
unassigned.  The last quarter saw 8146 commits by 173 committers
to the HEAD branch and 357 commits by 52 committers to the
2020Q1 branch.  This means the number of PRs grew although the
committer activity remained more or less constant.

As always, people come and go. This time we welcomed Loïc
Bartoletti (lbartoletti@), Mikael Urankar (mikael@), Kyle Evans
(kevans@, who is already a src committer), and Lorenzo Salvadore
(salvadore@, who we already know for compiling these reports you 
are reading right now).  We said goodbye to dbn@ and theraven@ ,
who we hope to see back in the future.

On the infrastructure side, USES=qca was added and USES=zope was
removed.  The latter was also due to it was incompatible with
Python 3, and portmgr is in the process of removing Python 2.7 from
the Ports Tree.  This means that all ports that currently rely on
Python 2.7 need to be updated to work with Python 3 or be removed.

After a long period of work by multiple people, Xorg got updated
from the 1.18 to the 1.20 release series.  Also, the web browsers
were updated: Firefox to version 75.0, Firefox ESR to 68.7.0, and
Chromium to 80.0.3987.149.  The package manager itself got updated
to version 1.13.2.

antoine@ ran 29 exp-runs during the last quarter for various updates
to KDE, poppler, pkg and build tools; and test compatibility with src
changes: removing procfs-based debugging, fixing TLS alignment, and
only including libssp\_nonshared.a in libc for the i386 and Power
architectures.
