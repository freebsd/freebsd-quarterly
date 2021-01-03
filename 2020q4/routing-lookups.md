# IP Routing lookup improvements

Link:	 [Add modular routing lookup framework.](https://reviews.freebsd.org/D27401)

Contact: Alexander Chernikov <melifaro@FreeBSD.org>  

This work adds a fib lookup framework, allowing to attach custom ip lookup algorithms to any routing table on the fly. It allows to use more performant and efficient lookup algorithms, dynamically selected based on the number of routes in the routing table. Finally, it provides an implementation of modified DIR-24-8 for IPv4/IPv6, speeding IP lookups for the large-fib use case.

This work is a part of a larger effort to modernise routing subsystem.

## Background

FreeBSD runs diverse workloads on both low-end and high-end devices,  resulting in a different networking/memory requirements for each case.
Small boxes with a couple of routes are different from routers with full-view.
IPv4 lookups are different from IPv6 ones. 
Conditions can change dynamically: one may easily reconfigure a system to receive full-view instead of a default route.

Currently, FreeBSD uses radix (compressed binary tree) to perform all unicast route manipulations, including routing lookups.
Radix implementation requires storing key length in each item, allowing to use sockaddrs, transparently supporting virtually any address family.
This flexibility comes at the cost: radix is *relatively slow*, *cache-unfriendly* and adds *locking* to the hot path.
Finally, radix is closely coupled to the rest of the system, making it hard to switch it to something else.

## Implementation overview

### Overview

Modular fib IP lookup framework has been designed to address flexibility and performance requirements.

It keeps system radix as the "control plane" source of truth, simplifying actual algorithms implementation.
It allows dynamic load new algorithms as the kernel modules and abstracts most OS-specific details, reducing algorithm "glue" code.
It automatically adapts to the current system state by picking the best matching algorithm for the routing table on-the-fly.

*The following algorithms are provided by default*:
*IPv4*:
* bsearch4 (lockless binary search in a specially-crafted IP array), tailored for small-fib (<16 routes)
* radix4_lockless (lockless immutable radix, re-created on every routing table change), tailored for small-fib (<1000 routes)
* radix4 (base system radix backend)
* dpdk_lpm4 (DPDK DIR24-8-based lookups), lockless datastructure optimised for large-fib ( [D27412](https://reviews.freebsd.org/D27412) )
*IPv6*:
* radix6_lockless: lockless immutable radix, re-created on every routing table change, tailored for small-fib (<1000 routes)
* radix6: wrapper around existing system radix
* dpdk_lpm6: DPDK DIR24-8-based lookups, lockless datastructure optimised for large-fib ( [D27412](https://reviews.freebsd.org/D27412) )

### Performance changes

Micro benchmarks (I7-7660U, single-core lookups, 2048 destinations, benchmark code in  [D27604](https://reviews.freebsd.org/D27604) ):
*IPv4*:
8 routes: radix4: ~20mpps, radix4_lockless: ~25mpps, bsearch4: ~69mpps, dpdk_lpm4: ~67 mpps
700k routes: radix4_lockless: 3.3mpps, dpdk_lpm4: 46mpps
*IPv6*:
8 routes: radix6_lockless: ~20mpps, dpdk_lpm6: ~70mpps
100k routes: radix6_lockless: ~14mpps, dpdk_lpm6: ~57mpps

*Forwarding performance*:
+10-15% IPv4: small-fib, bsearch4
+25% IPv4: full-view, dpdk_lpm4
+20% IPv6: full-view, dpdk_lpm6

## Status

1. Modular longest-prefix-match lookup algorithms ([D27401](https://reviews.freebsd.org/D27401)) [ DONE ]
	1. Design control plane framework for attaching algorithms [ DONE ]
	2. Port DPDK IPv6 lockless lookup algorithm ( [D27412](https://reviews.freebsd.org/D27412)) [ DONE ]
	3. Port DPDK IPv4 lockless lookup algorithm ( [D27412](https://reviews.freebsd.org/D27412)) [ DONE ]
