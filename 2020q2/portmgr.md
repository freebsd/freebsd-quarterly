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

There are currently 2,373 open ports PRs of which 526 are
unassigned, for a total of 39,628 ports.  In the last quarter
there were 10,315 commits to HEAD and 476 to the quarterly
branch by respectively 178 and 65 committers.  Compared to the
quarter before, this means a significant increase in commits and
also a slight decrease in open PRs.

During the last quarter, we welcomed Hiroki Tagato (tagattie@).
We said goodbye to seanc@, zleslie@, gnn@ and salvadore@.

A few default versions got bumped:
  * Java (new) at 8
  * Lazarus to 2.0.8

It is now possible to write pkg scripts in Lua instead of sh.
They have two advantages over their sh versions:
  * they run in a Capsicum sandbox
  * they respect rootdir, the directory which pkg will use as
    the starting point to install all packages under.

Some user-facing packages were also updated:
  * pkg to 1.14.6
  * Firefox to 78.0.1
  * Thunderbird to 68.10.0
  * Chromium to 83.0.4103.116
  * Ruby to 2.5.8, 2.6.6, and 2.7.1
  * Qt5 to 5.14.2

antoine@ ran 55 exp-runs during the last quarter to test port
version updates, make liblzma use libmd, flavor devel/scons and
Lua ports, add and update library functions in the base system,
make malloc.h usable again, remove as(1) from the base system, and
augment sed(1) with -f.
