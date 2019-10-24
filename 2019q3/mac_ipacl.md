## GSoC'19 Project - MAC policy on IP addresses in Jail: mac_ipacl

Contact:  Shivank Garg, <shivank@FreeBSD.org>

Link: [FreeBSD's Phabricator Differential Link](https://reviews.freebsd.org/D20967)
Link: [Github Diff Link](https://github.com/freebsd/freebsd/compare/master...shivankgarg98:shivank_MACPolicyIPAddressJail)

Link: [Project Wiki Page](https://wiki.freebsd.org/SummerOfCode2019Projects/MACPolicyIPAddressJail)

**About -**  With the introduction of VNET(9) in FreeBSD, Jails are free to
set their IP addresses. However, this privilege may need to be limited by
the host as per its need for multiple security reasons.
This project uses the mac(9) for an access control framework to impose
restrictions on FreeBSD jails according to rules defined by the root of the
host using sysctl(8). It involves the development of a dynamically loadable
kernel module (mac_ipacl) based on The TrustedBSD MAC Framework to
implement a security policy for configuring the network stack.
This project allows the root of the host to define the policy rules to
limit the root of a jail to a set of IP (v4 or v6) addresses and/or subnets
for a set of interfaces.

Features this new MAC policy module are:
-   The host can define the list(multiple lists) of IP addresses/subnets
for the jail to choose from.
-   The host can restrict the jail from setting certain IP addresses or
prefixes(subnets).
-   The host can restrict this privilege to a few network interfaces.

**Implementation -** The mac_ipacl module is a loadable kernel module. It
implements mac checks in netinet/in.c and netinet6/in6.c to check the IP
addresses requested by jail. The idea to implement these checks at these
places comes from the fact that SIOCAIFADDR(for IPv4) and
SIOCAIFADDR_IN6(for IPv6) ioctl handlers are defined for adding the IP
addresses to an interface. This is used by ifconfig(in userspace) for
setting the IP address. MAC framework act as multiplexer between the
netinet and the module. The requested IP and the credentials are checked
with the rules in mac_ipacl and output is returned accordingly to netinet.
The module can be tuned with various sysctl and similarly, policy rules are
also be defined with sysctl.

**TestSuite** - Test Scripts integrated with kyua and ATF are included with
the module.

**Using the module:** - I have written a man page for the module. Please
refer to the mac_ipacl(4) for using the new MAC module and various examples.

**Final Deliverables -**
-   A loadable kernel module -  [mac_ipacl in sys/security/mac_ipacl](https://github.com/shivankgarg98/freebsd/tree/shivank_MACPolicyIPAddressJail/sys/security/mac_ipacl)

-   ATF tests for the module in  [tests/sys/mac/ipacl](https://github.com/shivankgarg98/freebsd/tree/shivank_MACPolicyIPAddressJail/tests/sys/mac/ipacl)

-   A man for this new mac module - mac_ipacl.4 in
 [share/man/man4/mac_ipacl.4](https://github.com/shivankgarg98/freebsd/blob/shivank_MACPolicyIPAddressJail/share/man/man4/mac_ipacl.4)


This is a new project, developed as part of **Google Summer of Code'19**
under the guidance of **Bjoern A. Zeeb** <bz@FreeBSD.org>. The module is
**reviewed** and **Revision for this project is accepted and ready to
land**. It is yet to be merged with FreeBSD HEAD, and waiting to be tested
by few more hands in the industry.

I'll be very thankful if you can give this module a try and share your
valuable experience about it. Please be free to share your ideas and
feedback on this module and please do not hesitate to send me an email.
