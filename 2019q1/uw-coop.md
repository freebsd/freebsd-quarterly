## University of Waterloo Co-operative Education Students ##

Contact: Ed Maste, <emaste@freebsd.org>

For the January-April 2019 term the FreeBSD Foundation has again brought
on two co-operative education (co-op) students from the University of
Waterloo.

Gerald Aryeetey is a 2nd year Computer Engineering student.  Gerald
started looking at a FreeBSD tool chain issue - our static library
archiver (`ar`) did not read or write archives in the 64-bit format.
Gerald submitted a
[libarchive change](https://github.com/libarchive/libarchive/pull/1116)
to support 64-bit archives followed by
[change to FreeBSD's ar](https://reviews.freebsd.org/D19814)
to add 64-bit support.

Gerald later looked at a number of `freebsd-update` issues in FreeBSD's
bugzilla database, and submitted many fixes.  Around a dozen have been
committed to FreeBSD, and more are in review.

Gerald also worked on the
[FreeBSD Foundation's hardware continuous integration](https://github.com/freebsdfoundation/hardware-ci)
effort.
The prototype installation is building FreeBSD on a commit-by-commit basis
and testing on a BeagleBone Black and a Pine64 LTS.
The prototype will be converted to a permanent, public installation in the
near future, after which additional test devices will be added.

For his final project Gerald intends to write a device driver for the
[Microchip LAN743x PCIe NIC](https://www.microchip.com/wwwproducts/en/LAN7430).

Bora Özarslan is a 3rd year student in Computing and Financial Management.
Bora's initial focus was also on tool chain issues in FreeBSD, starting with
improvements or bug fixes in FreeBSD's `readelf` (from the
[ELF Tool Chain](https://sourceforge.net/p/elftoolchain/wiki/Home/) project).

Bora developed a
[tool](https://reviews.freebsd.org/D19290) to modify feature control bits
in ELF binaries - for example, allowing binaries incompatible with ASLR to
request to opt-out.
As part of his readelf work Bora also added support to report the status of
the feature control bits.

Bora continued investigating security topics, looking at applying
[Capsicum sandboxing](https://reviews.freebsd.org/D19407) to
Kristaps' BSD licensed rsync implementation,
[openrsync](https://github.com/kristapsdz/openrsync).
This work required first implementing
[fileargs_lstat](https://reviews.freebsd.org/D19548) support in `cap_fileargs`
(which as now been committed) as well as changes to the
`fts` directory hierarchy routines (which have not yet been committed to
FreeBSD).

For the rest of the work term Bora will investigate and test unmodified
Linux Docker containers on FreeBSD, to evaluate the state of Linuxulator
support.

Sponsor: The FreeBSD Foundation
