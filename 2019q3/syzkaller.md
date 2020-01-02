## syzkaller on FreeBSD ##

Contact: Andrew Turner <andrew@FreeBSD.org>  
Contact: Mark Johnston <markj@FreeBSD.org>  
Contact: Michael Tuexen <tuexen@FreeBSD.org>  
Contact: Samy Al Bahra <sbahra@freebsd.org>  

See the syzkaller entry in the 2019q1 quarterly report for an
introduction to syzkaller.

Work has continued on fixing bugs uncovered by syzkaller.  Over a dozen
kernel bugs fixed in the past three months have been directly attributed
to syzkaller, and a number of syzkaller reproducers have been
incorporated into our test suite.

backtrace.io, via Samy, has graciously provided a large server for
running a dedicated syzkaller instance to fuzz FreeBSD under bhyve.
Though syzbot, the public syzkaller instance run by Google, already
fuzzes FreeBSD, it has proven fruitful to run multiple syzkaller
instances: different instances find different bugs, and
syzkaller.backtrace.io allows us to experiment with FreeBSD-specific
extensions.  In particular, this instance currently uploads data about
each crash to backtrace.io, making it much easier to triage and analyze
crashes.  We plan to make this service generally available to FreeBSD
developers in the near future.

Going forward we will continue to extend syzkaller coverage and make it
simpler for users and developers to run private instances, and
optionally collect kernel crash information for debugging or for
submission.

Sponsor: backtrace.io
Sponsor: The FreeBSD Foundation
