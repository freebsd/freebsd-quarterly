## Valgrind updates ##

Contact: Paul Floyd <paulf@free.fr>
Contact: Kyle Evans <kevans@FreeBSD.org>

Link: https://reviews.freebsd.org/D25452

A large amount of work has been done to rebase FreeBSD support on top of
Valgrind 3.17.0, and to address numerous test suite failures.  Currently,
almost all of the regression tests pass on amd64.  This is a major improvement
over the current state of affairs, in which the Valgrind is quite out of date
and is missing important functionality.  Some follow-up work aims to make
FreeBSD an officially supported target platform for Valgrind.

The devel/valgrind-devel port is in the process of being updated to point at
the new work.
