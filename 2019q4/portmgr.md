## Ports Collection ##

Link:	 [About FreeBSD Ports](https://www.FreeBSD.org/ports/)  
Link:	 [Contributing to Ports](https://www.freebsd.org/doc/en_US.ISO8859-1/articles/contributing/ports-contributing.html)  
Link:	 [FreeBSD Ports Monitoring](http://portsmon.freebsd.org/index.html)  
Link:	 [Ports Management Team](https://www.freebsd.org/portmgr/index.html)  

Contact: René Ladan <portmgr-secretary@FreeBSD.org>  
Contact: FreeBSD Ports Management Team <portmgr@FreeBSD.org>  

The Ports Management Team is responsible for overseeing the overall direction
of the Ports Tree, building packages, and personnel matters.  This entry shows
what happened in the last quarter.

2019Q4 closed with a total of 38,200 ports and 2180 open PRs of which a small
470 PRs are unassigned.  Last quarter saw 7907 commits from 157 committers to
the HEAD branch and 358 commits from 61 committers to the 2019Q4 branch.  This
seems to suggest a small increase in activity compared to the quarter before.

During the last quarter, we welcomed Oleksii "Alex" Samorukov (samm@) and
Scott Long (scottl@, already a source committer) as new ports committers.  We
also said goodbye to az@, brd@, dtekse@, eadler@, and johans@.

The default versions of some ports changed: Lazarus is now at version 2.0.6,
Samba at 4.10, and Python at 3.7.  The web browsers received their updates too:
Chromium is now at version 78.0.3904.108, Firefox at version 72.0 and its ESR
counterpart at version 68.4.0.  Finally, the Qt stack got updated to version
5.13.2.  

Some modernizations took place: the "palm" category was removed as well as the
virtual "ipv6" category.  IPv6 support (next to IPv4) is now considered the
norm.  Lastly, the CentOS 6 ports were removed after their CentOS 7 counterparts
were made the default in the previous quarter.

As always, antoine@ was happy to take your exp-runs, this time a total of 30,
for various ports and framework updates, default version updates, and the
removal of OpenJDK 6 and OpenJRE 6.
