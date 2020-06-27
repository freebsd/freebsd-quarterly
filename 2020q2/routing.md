# ## Lockless routing lookups and scalable multipath ##

Link:	 [Implementation of scalable multipath](https://reviews.freebsd.org/D24141#change-ZOjdMqgDgUr7)  

Contact: Alexander Chernikov <melifaro@FreeBSD.org>  

The primary goal of this work is to bring scalable routing multipath implementation,  enabled by default. Another goal is enabling high-performance routing lookups.

Multipath will close long-standing feature gap that modern networking OS must have.
Lockless routing lookups will remove lookup bottlenecks, improve both dataplane and control plane performance for the setups with large number of routes.

### Background

Initial routing kpi was introduced back in 1980. It was a nice generic approach back then, as no one new how the protocols would evolve. It has been enormously successful as it was able to survive for 20+ years.

Unfortunately this kpi does not try to protect subsystem internals from the outside users, resulting in tight  coupling with other subsystems. As a result, making changes is hard, leading to compromises and piling technical debt. 

### Implementation overview 

Most changes are based on introduction of the concept of nexthops. Nexthops are separate datastructures, containing all necessary information to perform packet forwarding such as gateway, interface and mtu. They are shared among the routes, providing more pre-computed cache-efficient data while requiring less memory.
Interested reader can find more detailed description in [D24141](https://reviews.freebsd.org/D24141). Another overview can be found in Nexthop object [talk](https://linuxplumbersconf.org/event/4/contributions/434/attachments/251/436/nexthop-objects-talk.pdf) describing Linux implementation.

Multipath implementation extends nexthop concept further by introducing nexthop groups.

Each route has a pointer to either nexthop or a nexthop group, decoupling lookup algorithm from the routing stack internals. Both nexthops and nexthop groups are immutable and use epoch(9)-backed reclamation.

Pre-requisite for the lockless routing lookup is the introduction of modular lookup framework, allowing to attach any longes-prefix-match algorithm implementation to any IPv4/IPv6 fib.

Currently there are plans to use modified DIR-24-8 algorithm from DPDK for both IPv4 and IPv6 families as an example of base lockless implementation.

### Status

1 Nexthop objects [ DONE ]
1.1 Introduction of nexthop objects [ DONE ]
1.2 Conversion of old KPI users to the new one [ DONE ]
1.2.1 Conversion of route caching to nexthop caching [ DONE ]
1.3 Conversion of struct `rtentry` field access to nhop field access [ DONE ]
1.4 Eliminating old lookup KPI and hiding struct rtentry. [ DONE ]

2 Multipath [ IN PROGRESS ]
2.1 Switch control plane customers to use (rtentry, nhop) pair instead of rtentry to allow multipath changes happen transparently. [ 90% DONE ]
2.2 Introduce nexthop group objects
2.3 Add mutipath support for the rib manipulation functions
2.4 Add flowid generation for outbound traffic to enable load balancing

3 Modular longest-prefix-match lookup algorithm [ IN PROGRESS ]
3.1 Design control plane framework for attaching algorithms [ 90% DONE ]
3.2 Port IPv6 lockless lookup algorithm [ DONE ]
3.3 Port IPv4 lockless lookup algorithm
