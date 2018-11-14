## Large scale package building ##

Building packages on a 128-thread machine with poudriere exhibits some
bottlenecks.

See the October FreeBSD Foundation Newsletter for an a short writeup:
https://www.freebsdfoundation.org/news-and-events/newsletter/freebsd-foundation-update-october-2018/

One encountered problem stems from process handling.

The standard process life cycle on UNIX-like systems looks like this:
- a process is created with fork(2)
- it can do regular work or execve(2) a new binary
- it exits, becoming a zombie
- the parent collects the exit code and removes the zombie

There are other variations (e.g. vfork(2) can be used instead of
fork).

When you type 'ls' into your shell, it will typically vfork a new process
which will then execve /bin/ls.

All this is guarded with several global kernel locks, but the granularity
can be significantly improved.

A different problem stems from pipes.

pipes are used all the time, e.g. "du -s | sort -n" creates a pipe whose
one endpoint is standard output for du and another is standard input for sort.

By default the pipe can hold up to 16KB before it gets filled up.

The kernel dedicates part of its virtual address space to hold pipe buffers
and allocates/deallocates physical pages as pipes get created/destroyed.
This is induces TLB invalidation requests to other CPUs, which causes an
unnecessary slowdown.

An easy way out is to cache a certain number of buffers.
