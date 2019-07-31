## Ports Collection ##

Contact: René Ladan, <portmgr-secretary@FreeBSD.org>  
Contact: FreeBSD Ports Management Team, <portmgr@FreeBSD.org>  

Link:	 [About FreeBSD Ports](https://www.FreeBSD.org/ports/)  
Link:	 [Contributing to Ports](https://www.freebsd.org/doc/en_US.ISO8859-1/articles/contributing/ports-contributing.html)  
Link:	 [FreeBSD Ports Monitoring](http://portsmon.freebsd.org/index.html)  
Link:	 [Ports Management Team](https://www.freebsd.org/portmgr/index.html">Ports Management Team)  

The following was done during the last quarter by portmgr to keep things in
the Ports Tree going:

During the last quarter the number of ports rose to just under 37,000.  At the
end of the quarter, there were 2146 open PRs and 7837 commits (excluding 499 on
the quarterly branch) from 172 committers.  This shows a slight decrease in
activity compared to previous quarter.

People come and go, last quarter we welcomed Pedro Giffuni (pfg@), Piotr Kubaj
(pkubaj@) and Hans Petter Selasky (hselasky@).  Pedro and Hans Petter were
already active as src committers.  We said goodbye to gordon@, kan@, tobez@,
and wosch@.

On the infrastructure side, a new USES=cabal was introduced and various default
versions were updated: MySQL to 5.7, Python to 3.6, Ruby to 2.5, Samba to 4.8
and Julia gained a default version of 1.0.  The web browsers were also updated:
Firefox to 68.0 and Chromium to 75.0.3770.100

During the last quarter, antoine@ ran a total of 41 exp-runs to test various
package updates, bump the stack protector level to "strong", switch the default
Python version to 3.6 as opposed to 2.7, remove sys/dir.h from base which has
been deprecated for over 20 years, and convert all Go ports to USES=go.
