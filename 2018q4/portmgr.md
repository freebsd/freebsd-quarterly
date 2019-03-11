## Ports Collection ##

Contact: René Ladan, <portmgr-secretary@FreeBSD.org>
Contact: FreeBSD Ports Management Team, <portmgr@FreeBSD.org>

Link:	 [About FreeBSD Ports](https://www.FreeBSD.org/ports/)
Link:	 [Contributing to Ports](https://www.freebsd.org/doc/en_US.ISO8859-1/articles/contributing/ports-contributing.html)
Link:	 [FreeBSD Ports Monitoring](http://portsmon.freebsd.org/index.html)
Link:	 [Ports Management Team](https://www.freebsd.org/portmgr/index.html">Ports Management Team)

The number of ports in the last quarter shrunk a bit to 32,900. At the end of
the quarter there were 2365 open port PRs of which a small 500 were unassigned.
The last quarter saw 7333 commits from 174 committers. This means that more
port PRs were resolved than last quarter and the number of commits remained
approximately the same.

During the last quarter, we welcomed Alexandre C. Guimarães (rigoletto@) and
Vinícius Zavam (egypcio@). The port commit bits of Alberto Villa (avilla@),
Lars Thegler (lth@), Dryice Dong Liu (dryice@), Ion-Mihai Tetcu (itetcu@),
Gabor Pali (pgj@), Tom Judge (tj@), Ollivier Robert (roberto@), and Maxim
Sobolev (sobomax@) were taken in for safekeeping.

The number of commit bits safekept is higher than usual because for port commit
bits the idle timeout changed from 18 months to 12 months.

Some default versions were changed:
  * PHP from 7.1 to 7.2
  * Perl5 from 5.26 to 5.28
  * Ruby from 2.4 to 2.5
  * For LLVM, version 7.0 is now supported as a default version.

Other big changes are:
  * info files are stored in the share/info directory just as other
    operating systems do.
  * PyQt ports can now be installed concurrently.
  * As FreeBSD 10 reached its end of life, support for this branch has been
    removed from the Ports Collection. People still requiring FreeBSD 10
    support can use the RELEASE\_10\_EOL tag.
  * USES=cmake now defaults to outsource
  * KDE 4 has reached its end-of-life and has been removed from the Ports
    Collection.

Eager as ever, antoine@ ran 36 exp-runs this quarter to ensure major port
upgrades were correct.
