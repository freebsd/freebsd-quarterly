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

We passed the landmark of 40,000 ports in the Ports Collection
and are now around 40,400 ports.  The last quarter saw 9335
commits to the HEAD branch and 481 commits to the 2020Q3 branch
by respectively 167 and 63 committers.  There are currently 2525
open problem reports of which 595 are unassigned.  Compared to
last quarter, this means a slight decrease in activity and also
a slight increase in open PRs.

During the last quarter we welcomed Rainer Hurling (rhurlin@) and
said goodbye to Kevin Lo (kevlo@) and Grzegorz Blach (gblach@).

The last three months saw new default versions for Perl (5.32),
PostgreSQL (12) and PHP (7.4). Various packages also got updated:
Firefox to 81.0.1, Chromium to 84.0.4147.135, Gnome to 3.36,
Xorg to 1.20.9, Qt5 to 5.15.0, Emacs to 27.1, KDE Frameworks to
5.74.0 and pkg itself to 1.15.8.

Never tired, antoine@ ran 30 exp-runs to test port version updates,
on such diverse matters as:
  * Updating byacc in base to 20200330.
  * Check balancing of sed "y" command.
  * Use of brackets.
  * Removing the now redundant "port" argument from USES=readline.
