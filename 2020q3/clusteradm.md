## Cluster Administration Team ##

Contact: Cluster Administration Team <clusteradm@FreeBSD.org>

Link: [Cluster Administration Team members](https://www.freebsd.org/administration.html#t-clusteradm)

The FreeBSD Cluster Administration Team consists of the people responsible for 
administering the machines that the Project relies on for its distributed work
 and communications to be synchronised. In this quarter, the team has worked 
on the following:
  * Work with the FreeBSD Foundation on hardware update for web services, mirror and package building servers.
  * Disable directory indexing on the package mirrors to resolve performance issues of the machine.
    * This was later relaxed to allow indexing of the parent directories but still disallow the large package directories.
  * Ongoing systems administration work:
    * Accounts management for committers.
    * Backups of critical infrastructure.
    * Keeping up with security updates in 3rd party software.

Work in progress:

  * Setup Malaysia (KUL) mirror.
  * Setup Brazil (BRA) mirror.
  * Review the service jails and service administrators operation.
  * Infrastructure of building aarch64 and powerpc64 packages.
    * NVMe issues on PowerPC64 POWER9 blocking dual socket machine from being used as pkg builder.
    * Drive upgrade test for pkg builders (SSDs) courtesy of the FreeBSD Foundation.
    * Boot issues with Aarch64 reference machines.
  * New NYI.net sponsored colocation space in Chicago-land area.
  * Work with git working group for the git repository.
  * Searching for more providers that can fit the requirements for a [generic mirrored layout](https://wiki.freebsd.org/Teams/clusteradm/generic-mirror-layout) or a [tiny mirror](https://wiki.freebsd.org/Teams/clusteradm/tiny-mirror).
