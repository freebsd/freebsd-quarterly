## Intel ##

### FreeBSD Core Enabling / Security ###
Contact: Ben Widawsky <bwidawsk@FreeBSD.org>
Link: N/A

A new team has been formed within Intel to help with side channel security
mitigations as well as core enabling. They are evaluating work from all areas
except networking. The team is currently focusing on two areas:
1. Power Management improvements
2. NVDIMM namespace support

The ultimate goal of the power management work is to get runtime power
management to hit "opportunistic idle". What this means is when devices are
idle, the OS will power them down, and when everything goes idle certain SoCs
will allow you to hit very low power states across the platform. FreeBSD
currently doesn't have any notion of runtime power management, and many devices
don't properly implement suspend and resume. In addition, some preliminary work
is in process as it was thought to help when eventually enabling opportunistic
idle. That preliminary work has been happening and is now up for review:
- https://reviews.freebsd.org/D17675
- https://reviews.freebsd.org/D17676

NVDIMM namespace support has also been put up for review. ACPI spec defines
namespaces as a way of partitioning the device into separate labels. The current
work will integrate with geom(4). How these are used is application dependent.
This work is up for review as well: https://reviews.freebsd.org/D17619

The team has additionally taken on smaller tasks like porting turbostat(8),
working on git svn init scripts, some small modifications to acpi tooling, and
an effort to create a port PMDK.

### Networking ###
Contact: jeb, erj??
