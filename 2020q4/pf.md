## pf performance improvement ##

Contact: Kristof Provost, <kp@freebsd.org>

Link:   [First commit](https://cgit.freebsd.org/src/commit/?id=1c00efe98ed7d103b9684ff692ffd5e3b64d0237)
Link:   [D27707](https://reviews.freebsd.org/D27707)
Link:   [D27756](https://reviews.freebsd.org/D27756)
Link:   [D27757](https://reviews.freebsd.org/D27757)
Link:   [D27758](https://reviews.freebsd.org/D27758)
Link:   [D27759](https://reviews.freebsd.org/D27759)
Link:   [D27760](https://reviews.freebsd.org/D27760)
Link:   [D27761](https://reviews.freebsd.org/D27761)
Link:   [D27762](https://reviews.freebsd.org/D27762)
Link:   [D27763](https://reviews.freebsd.org/D27763)
Link:   [D27764](https://reviews.freebsd.org/D27764)

Contact: Kristof Provost, <kp@freebsd.org>

The performance of pf was not as good as it could be. Some investigation with the
invaluable hwpmc tooling eventually pointed to very poor cache behaviour.
The longest_lat_cache.miss event was very informative.

This turned out to be due to pf doing packet and byte counting in states, rules and
interfaces.

The pf code took the very straightforward approach of having a simple uint64_t
variable and incrementing it for every packet. The downside of this is that
when multiple cores do it simultaneously the CPU ends up having to write this
to memory very often, slowing packet processing down greatly. Happily the
counter(9) framework is designed for this exact situation.

One additional complication is that pf uses the same structure definitions for
its internal data as it uses for configuration from user space. To avoid
breaking user space these data structures have been decoupled. That is, where
pf_rule used to be used both to set rules via the ioctl() interface and to
evaluate rules while processing packets we now only use pf_rule for
configuration. The new pf_krule structure is used when evaluating packets.
This allows us to change the pf_krule structure, to change uint64_t to
counter_u64_t, without affecting user space.

Olivier Cochard-Labbé tested the full set of changes, and found (depending on
hardware) [substantial improvements in throughput](http://dev.bsdrp.net/benchs/kp/pf-patches/):

Sponsor: Orange Business Services
