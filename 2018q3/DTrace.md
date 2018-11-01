## FreeBSD/DTrace

Contact: George Neville-Neil <gnn@freebsd.org>, Domagoj Stolfa <domagoj.stolfa@cl.cam.ac.uk>

DTrace is a whole-system debugging tool in FreeBSD and is one of the
actively supported projects during the past year.

A research prototype of a distributed version of DTrace and a version
of DTrace that can trace bhyve virtual machines from the host FreeBSD
system are currently under development at the University of Cambridge
as a part of the CADETS project. Recent developments include the
creation of dlog, an in-kernel DTrace consumer which is able to
publish to Kafka. In addition to that, early boot tracing and tracing
on shutdown was improved upon. On the virtualisation front,
improvements were made in the ability to dereference and follow
pointers inside guests from the host in the probe context by
implementing a nested page table walk inside DTrace for Intel
architectures. Moreover, the CADETS project has started formalising
DTrace in HOL4 which enables automated test generation, high assurance
of DTrace implementations in terms of adherence to the specification
and exploration of all allowable behaviours for a given D
script. Currently, the formal model contains most of DIF instructions
and a code generator for them, providing the ability to run DIF
programs specified using the model using FreeBSD's DTrace
implementation.

As a result of all of this, a number of changes were upstreamed to the
FreeBSD auditing subsystem and new variables such as `jid` and
`jailname` were added to DTrace which can be accessed from D scripts.

OpenDTrace Specification 1.0 has been published which covers the
internal workings of DTrace in general, and its adaptation to various
operating systems in particular.  This work was sponsored by
AFRL/DARPA through the CADETS project.

Ruslan Bukin (br@) has added C-compressed ISA extension support to the
RISC-V FBT provider as a part of the ECATS project.

Mark Johnston (markj@) has done some work to fix interactions between
FBT and ifuncs. ifuncs are a toolchain feature which allow programmers
to select a function's implementation at boot-time, rather than at
compile-time. For instance, on amd64, memcpy() is an ifunc and may be
implemented by either memcpy_erms() or memcpy_std(). FBT created
probes for the implementation functions, but we needed some extra
support to ensure that fbt::memcpy:entry continues to work as
expected. Similar work is needed for the PID provider, but is still
pending.

Microsoft showed a working demo of DTrace, which was ported from
FreeBSD [1].

Added to FreeBSD base in 11.2, dwatch is a new DTrace tool, developed
by Devin Teske (dteske@), for automating complex queries for data and
surgically tapping the kernel. In base there are 85 profiles for
interpreting domain-specific data with another 17 available from ports
making a total of over 100 different pipelines from which you can
extract data in multiple formats. dwatch also simplifies observation
of over 100,000 probe points available in FreeBSD, making it easy to
find any process, thread, or jail triggering any probe. On-top of all
that, dwatch profiles can leverage higher-level languages such as
python, perl, sh, and many more.

[1]: https://youtu.be/tG8R5SQGPck?t=891
