## Ports On Non-x86 Architectures ##

Contact: Mark Linimon <linimon@FreeBSD.org>

It has been some time since the last report on the status of FreeBSD
ports on non-x86 architectures.

Traditionally, we have referred to these as "tier-2 architectures".
However, aarch64 has aspirations for tier-1, and although riscv64 is
actually tier-3, it has aspirations for tier-2.

  * The big news is that, thanks to the FreeBSD Foundation (and the
    assistance of Philip Paeps), FreeBSD now has two new aarch64 boxes,
    which have replaced the previous, badly-aging, alternatives.  For
    the first time since August, we once again have up-to-date aarch64
    packages.

  * Thanks to the above, and the work of Emmanuel Vadot and others, some
    bitrot in aarch64 ports has been reversed.

  * Piotr Kubaj (pkubaj@) continues to make progress on bringing
    powerpc64 (big-endian) up to parity with amd64.  Almost everything
    that is buildable, now does so.  The Linux ports and some of the
    graphics drivers are excluded.

  * Piotr has also begun the task of bringing powerpc64le (little-endian)
    up to parity with powerpc64.  Although several of the powerpc64 src
    committers (and your author) have a fondness for big-endian, the fact
    is that our most feasible path to getting graphics capability anywhere
    near parity with x86 is via the little-endian choice.

  * Mark Linimon (linimon@) has begun his own test-builds of ports on
    riscv64 just to ascertain overall buildability.  Surprisingly, many
    ports do indeed build.  Thanks to contributions from several people
    already working on riscv64, including John Baldwin (jhb@) with an LLVM fix,
    we are now able to build 18732 packages.  NB: these packages are
    *unofficial* and not guaranteed.

  * Kyle Evans (kevans@)'s work on chasing bitrot in qemu has been key
    to work on both aarch64 and riscv64.  All users are encouraged to
    update to the latest version.

Tasklist:

  * We need users of riscv64 to actually test the packages that have been
    built (so far, they have only been tested for buildability).  Contact
    linimon@ if you are interested.
