## syzkaller on FreeBSD ##

Contact: Mark Johnston <markj@FreeBSD.org>  
Contact: Michael Tuexen <tuexen@FreeBSD.org>

See the syzkaller entry in the 2019q1 quarterly report for an
introduction to syzkaller.

A number of kernel bugs have been found by syzkaller and fixed this
quarter, mostly in the network stack and file descriptor table code.
Bug investigations have led to improvements in debugging facilities and
assertions, for example in the SCTP stack.  Syzkaller reproducers have
been added to Peter Holm's stress2 suite, helping ensure that
regressions are found quickly.

The syzkaller instance hosted by backtrace.io (see the 2019q3 report)
has been very useful in testing syzkaller improvements and finding bugs.
Though Google runs a dedicated syzkaller instance [targeting FreeBSD](https://syzkaller.appspot.com/freebsd),
it has proved fruitful to run multiple instances since they end up
building different corpuses and thus discover different, though
overlapping, sets of bugs.

Support for fuzzing a number of new system calls has been added,
including the new copy\_file\_range() and \_\_realpathat() system calls,
and the Capsicum system calls.  Some work was also done to audit
existing system call definitions to ensure that FreeBSD-specific
extensions of POSIX system calls are covered.  Work is ongoing to target
the Linux emulation layer, and to collect kernel dumps so that one-off
crashes with no reproducer have a chance at being diagnosed and fixed.

Sponsor: backtrace.io
Sponsor: The FreeBSD Foundation

