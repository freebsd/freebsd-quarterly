## Ports Collection ##

Link:	 [About FreeBSD Ports](https://www.FreeBSD.org/ports/)  
Link:	 [Contributing to Ports](https://www.freebsd.org/doc/en_US.ISO8859-1/articles/contributing/ports-contributing.html)  
Link:	 [FreeBSD Ports Monitoring](http://portsmon.freebsd.org/index.html)  
Link:	 [Ports Management Team](https://www.freebsd.org/portmgr/index.html)  
Link:    [Ports Tarball](http://ftp.freebsd.org/pub/FreeBSD/ports/ports/) 

Contact: René Ladan <portmgr-secretary@FreeBSD.org>  
Contact: FreeBSD Ports Management Team <portmgr@FreeBSD.org>  

-------------------
Paragraphs are separated with an empty line.  Use Markdown
syntax, the same as you use on GitHub.  If you don't know
Markdown, just write it as if it was plain text.

Show the importance of your work.  Status reports are not
just about telling everyone that things were done, they also
need to explain why they were done.
----------------

The Ports Management Team is responsible for overseeing the
overall direction of the Ports Tree, building packages, and
personnel matters.  Below is what happened in the last quarter.

For the last quarter the dashboard looks like:
  * 41500 ports (including flavors)
  * 2516 open PRs of which 625 are unassigned
  * 8715 commits to the HEAD branch by 164 committers
  * 420 commits to the 2020Q4 branch by 59 committers
Compared to the third quarter, the PR statistics mostly stayed the same. There
were slightly fewer commits by the same number of people. The number of ports
again grew steadily, this time by almost 4 percent.

During the last quarter, we welcomed Juray Lutter (otis@) as a new ports
committer and said goodbye to cpm, jadawin, knu, araujo, mmokhi and scottl.

Traditionally merges to the quarterly ports branches, which are more
conservative versions of the HEAD tree, required approval of either the
Ports Security Team (ports-secteam@) or portgmr@. There were already a number
of blanket approvals for tested commits, ranging from fixing typing mistakes to
upgrading web browsers to their latest version. As of last December, all
ports committers are free to merge on their own, lessening the burden on
ports-secteam@.

Patent limitations have been disconnected from the license framework, given
that patents are a complex topic with implications varying from one jurisdiction
to another.

The last quarter saw a number of updates to default versions of ports:
  * librsvg2: "rust" on supported platforms, "legacy"
    otherwise
  * Mono: 5.10
  * FPC switched to 3.2.0
  * GCC switched to 10 for powerpc64le
  * Lazarus switched to 2.0.10
  * Ruby switched to 2.7.X
  * Samba switched to 4.12

During the last quarter, a new virtual category was added: "education" for ports
that for instance help the user to learn about a certain topic or help
facilitating exams.

The @shell and @sample keywords have been rewritten in Lua which makes root-dir
compliant (see pkg -r) and ensures they are Capsicum-sandboxed.

The last quarter also saw updates to several user-facing ports:
  * Firefox 84.0.1
  * Firefox-esr 78.6.0
  * Chromium 87.0.4280.88
  * Ruby 2.7.2
  * Qt5 5.15.2
  * XFce 4.16

As always, antoine@ was busy running exp-runs, 37 this quarter, testing:
  * various ports upgrades
  * changing sys/cdefs.h in base
  * adding "set pipefail" to most framework scripts to catch errors earlier
  * changing the default locale to C.UTF-8 in base
  * using bsdgrep as /usr/bin/grep
