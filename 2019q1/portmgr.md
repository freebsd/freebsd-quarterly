## Ports Collection ##

Contact: René Ladan, <portmgr-secretary@FreeBSD.org>  
Contact: FreeBSD Ports Management Team, <portmgr@FreeBSD.org>  

Link:	 [About FreeBSD Ports](https://www.FreeBSD.org/ports/)  
Link:	 [Contributing to Ports](https://www.freebsd.org/doc/en_US.ISO8859-1/articles/contributing/ports-contributing.html)  
Link:	 [FreeBSD Ports Monitoring](http://portsmon.freebsd.org/index.html)  
Link:	 [Ports Management Team](https://www.freebsd.org/portmgr/index.html">Ports Management Team)  

As always, below is a summary of what happened in the Ports Tree during the
last quarter.

During 2019q1, the number of ports dropped slightly to just over 32,500.  At
the end of the quarter, we had 2092 open port PRs.  The last quarter saw 8205
commits from 167 committers.  So more PRs were closed and more commits were
made than in 2018q4.

During the last quarter, we welcomed Kai Knoblich (kai@) and said goodbye to
Matthew Rezny (rezny@).

On the infrastructure side, two new USES were introduced (azurepy and sdl) and
USES=gecko was removed.  The default versions of Lazarus and LLVM were bumped
to 2.0.0 and 8.0 respectively.  Some big port frameworks that were end-of-life
were removed: PHP 5.6, Postgresql 9.3, Qt4, WebKit-Gtk and XPI.  Firefox was
updated to 66.0.2, Firefox-ESR to 60.6.1, and Chromium was updated to
72.0.3626.121.

During the last quarter, antoine@ ran 30 exp-runs for package updates, moving
from GNU ld to LLVM ld, and switching clang to DWARF4.
