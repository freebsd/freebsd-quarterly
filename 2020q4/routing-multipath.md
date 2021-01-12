## Scalable routing multipath support ##

Link:	 [Implementation of scalable multipath](https://reviews.freebsd.org/D24141#change-ZOjdMqgDgUr7)  
Link:	 [Introduce scalable route multipath](https://reviews.freebsd.org/D26449)

Contact: Alexander Chernikov <melifaro@FreeBSD.org>  

This work targets implementing scalable routing multipath support and enabling it by default.
It closes the long-standing feature gap with other modern networking OSes.

This work is a part of on-going efforts to modernize the routing subsystem.

### Background ###

Initial FreeBSD multipath implementation, `RADIX_MPATH`, was added back in [2008](https://github.com/freebsd/freebsd-legacy/commit/4e8901ea7a04d2d803067647c0641e41494b8868). It was based on the radix changes and represented multipath routes as a linked-list of chained paths. It was not fully finished and tested, resulting in many crash reports. 

### Implementation overview ###

Multipath-related change changes are based on the introduction of the concept of next hops. Nexthops are separate data structures, containing the necessary information to perform packet forwarding. They are shared among the routes, providing more pre-computed cache-efficient data while requiring less memory.
Interested readers can find a more detailed description in [D24141](https://reviews.freebsd.org/D24141). They can find another overview in Nexthop objects [talk](https://linuxplumbersconf.org/event/4/contributions/434/attachments/251/436/nexthop-objects-talk.pdf) describing Linux kernel implementation.

Multipath implementation extends the nexthop concept further by introducing nexthop groups. Nexthop group is simply an array of nexthops, compiled according to each nexthop relative weight.

Each route has a pointer to either nexthops or a nexthop group, decoupling lookup algorithm from the routing stack internals. Both nexthops and nexthop groups are immutable and use epoch(9)-backed reclamation.

### Status ###

  * Nexthop objects ([D24232](https://reviews.freebsd.org/D24232)) [ DONE ]
    * Introduction of nexthop objects [ DONE ]
    * Conversion of old KPI users to the new one [ DONE ]
      * Conversion of route caching to nexthop caching [ DONE ]
    * Conversion of struct `rtentry` field access to nhop field access [ DONE ]
    * Eliminating old lookup KPI and hiding struct rtentry [ DONE ]

  * Multipath routing ([D26449](https://reviews.freebsd.org/D26449)) [ DONE ]
    * Switch control plane customers to use (rtentry, nexthop) pairs instead of rtentry to allow multipath changes happen transparently [ DONE ]
    * Introduce nexthop group objects [ DONE ]
    * Add multipath support for the rib (routing information base) manipulation functions [ DONE ]
    * Add flowid generation for outbound traffic to enable load balancing [ DONE ]

  * Routing daemon support
    * Add net/bird support for multipath routing [ NOT STARTED ]
    * Add explicit nexthop/nexthop groups control via rtsock [ IN PROGRESS ]
    * Work with FRR developers to add nexthop-based route control [ NOT STARTED ]
