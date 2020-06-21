## Status Report Sample - This Will Become The Title ##

Link:	 [FreshPorts](http://freshports.org/)  
Link:	 [FreshPorts blog](http://news.freshports.org/)  

Contact: Dan Langille <dan@langille.org>  

FreshPorts, and its sister site, FreshSource, have reported
upon FreeBSD commits for 20 years. They cover all commits,
not just ports.

FreshPorts tracks the commits and extracts data from the
port Makefiles to create a database of information useful
to both port developers and port users.

For example, https://www.freshports.org/security/acme.sh/ shows
the history of this port, back to its creation in May 2017.

### git ###

Work on git started [back in September](https://news.freshports.org/?s=git&searchsubmit=).
It was ignored for a while and started back in mid-June with 
the creation of new git-specific jails for commit ingress (commit
processing gitdev) and for the website.

Serhii (Sergey) Kozlov [created a script](https://github.com/FreshPorts/git_proc_commit/blob/master/git-to-freshports/git-to-freshports.py)
to transform GIT commit entries into XML digestible by FreshPorts.
This was a huge step foward for the effort.

The next step inslude:

* incorporate that script the automated processes of FreshPorts
* migrate to new test & stage versions of FreshPorts
* test
* get ready for prod

#### Help wanted ####

git is not far away now. I could use helpers to

* review code
* watch the commits on the devgit websites
* catch missing stuff

Thank you

### Packages ###

FreshPorts now displays the packages version available from the
repo sources. This covers all primary tiers (e.g. FreeBSD:12:amd64)
and all secondary tiers (e.g. FreeBSD:13:powerpc64). This helps
uses know what versions they can expect and when then repo was last
built.

### Dependency lines ###

Some things are easiest done via copy/paste. If you are working on a port
Makefile and need to add a new dependency, FreshPorts shows the dependency
line for that port.  For example:

```
acme.sh>0:security/acme.sh
```

Libraries are also covered by this feature.

Python ports were recently adjusted to display

```
 ${PYTHON_PKGNAMEPREFIX}virtualenv>0:devel/py-virtualenv
```

instead of

```
py37-virtualenv>0:devel/py-virtualenv
```

You can read more about this change in [issue
#73](https://github.com/FreshPorts/freshports/issues/73).


### Watch ports I maintain ###

The [search page](https://www.freshports.org/search.php) has long had
the "Ports I Maintain" button (if you are logged in). This feature recently
branched out to a new automated watch list option: `Watch ports I maintain`.

This [report subscription](https://www.freshports.org/report-subscriptions.php) 
will notify you of any commits to the ports you maintain. Your email 
address on FreshPorts must match the value in the MAINTAINER field of the port.
This is always a daily report.

From time to time, an infrastructure change will occur which touches your
port. This feature ensures you know about that change.

### Repology links ###

Repology links were requested. This allows you to see what versions of that
port are in the repositories of other systems. A link to repology.org
appears on every port page.

### Further reading ###

Based upon [things you didn’t know FreshPorts can do](https://news.freshports.org/2019/09/03/things-you-didnt-know-freshports-can-do/)


There are many things FreshPorts can do, including search `Makefile`s and
`pkg-plist`. This is from a recent blog post:

* provides example dependency line. e.g. p5-XML-RSS>0:textproc/p5-XML-RSS
* list of dependencies for a port
* list of ports depending upon this port
* see default configuration options
* what packages install a given file (e.g. bin/unzip)
* find out what ports a person maintains
* find Makefiles which contain references to bunzip
* search results can be plain-text consisting of a list of foo/bar ports
* the Maximum Effort checkbox on the search page does nothing
* committers can be notified of sanity test failures after the commit
* find a commit, any commit, based on SVN revision number, e.g. : https://www.freshports.org/commit.php?revision=352332


### Javascript help wanted ###

We [recently upgraded](https://github.com/FreshPorts/freshports/commit/f620270161dd7818272dfebacacaaf26df5f37e6)
some outdated Javascript modules. This broke our [JavaScript based
graphs](https://www.freshports.org/graphs2.php). We could use some help on
fixing that please. The starting points are listed on that URL.  If you need
a working website to play with, please contact me with a ssh public-key.


Sponsor: hardware provided by [iXsystems](https://www.ixsystems.com)
