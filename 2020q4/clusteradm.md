## Cluster Administration Team ##

Contact: Cluster Administration Team <clusteradm@FreeBSD.org>

Link: [Cluster Administration Team members](https://www.freebsd.org/administration.html#t-clusteradm)

The FreeBSD Cluster Administration Team consists of the people responsible for
administering the machines that the Project relies on for its distributed work
and communications to be synchronised. In this quarter, the team has worked
on the following:

  * Finished setting up the Malaysia mirror site, generously hosted by the
    [Malaysian Research & Education Network](https://myren.net.my/).  Traffic
    from Oceania and parts of Asia is now going to this mirror instead of
    farther away sites like Japan and California.
  * Upgraded the package building machines to a version of head from
    mid-October 2020.
  * Upgraded developer machines in the cluster (freefall, ref\* and universe\*) to
    a version of head from mid-October 2020.
  * Installed eight new x86 servers in our New Jersey site:
    five application servers, two package builders and one mirror server.
      * The new mirror server is in production (pkg0.nyi.freebsd.org).
      * The two package builders are in production.
      * Two of the application servers have been put into production as the Git
        source of truth and the cgit web frontend, respectively.
  * Installed two new aarch64 servers in our New Jersey site.  Both are now
    building aarch64 packages.
  * Fixed package mirror synchronisation for powerpc64 packages.
  * Rebuilt the ZFS pool on the UK mirror server (pkg0.bme.freebsd.org) for
    better I/O parallelism.  This should improve download performance
    especially at peak times.
  * Ongoing systems administration work:
    * Accounts management for committers.
    * Backups of critical infrastructure.
    * Keeping up with security updates in 3rd party software.

Work in progress:

  * Hardware refreshing for web services, backup version control system in NYI
  * Upgrading production machines in the FreeBSD cluster to 12.2
      * Most machines have been upgraded as of mid-December 2020
      * Remaining machines will be decommissioned / repurposed after services
        migrate to newer hardware
  * Supporting Git migration and infrastructure setup
  * powerpc pkgbuilder/ref/universal machines
  * Preparations for a new mirror site in Australia, to be hosted by
    [IX Australia](https://www.ix.asn.au).
  * Setup Brazil (BRA) mirror.
  * Review the service jails and service administrators operation.
  * Searching for more providers that can fit the requirements for a
    [generic mirrored layout](https://wiki.freebsd.org/Teams/clusteradm/generic-mirror-layout)
    or a
    [tiny mirror](https://wiki.freebsd.org/Teams/clusteradm/tiny-mirror).
