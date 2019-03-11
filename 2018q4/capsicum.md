## Capsicum ##

Contact: Mark Johnston, <markj@FreeBSD.org>
Contact: Ed Maste, <emaste@FreeBSD.org>
Contact: Mariusz Zaborski, <oshogbo@FreeBSD.org>

Link:	 [Capsicum Wiki Page](https://wiki.FreeBSD.org/Capsicum)

The major improvement in Capsicum is introducing a Casper service
fileargs, which is an easy way helps to sandbox the utils which need
access to the filesystem. There are several examples of usage fileargs
in applications like brandelf(1), wc(1), savecore(1), head(1) and
strings(1). The fileargs service also helps to bring new features to
the bhyve like audio device which is secured using Capsicum.

Another big step was introducing a private Casper service and
sandboxing the rtsold(8) and rtsol(8).

Next major improvement, which is still under the review, is rewriting
the sysctl service. The new sysctl service will allow in an easy way
to use cap_sysctl() and cap_sysctlnametomib().
