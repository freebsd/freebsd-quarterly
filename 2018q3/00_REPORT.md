# FreeBSD Team reports #

## Release Engineering Team ##

Contact: FreeBSD Release Engineering Team, <re@FreeBSD.org>

Link:	[FreeBSD 10.4-RELEASE announcement](https://www.FreeBSD.org/releases/10.4R/announce.html)  
Link:	[FreeBSD 11.2-RELEASE announcement](https://www.FreeBSD.org/releases/11.2R/announce.html)  
Link:	[FreeBSD 12.0-RELEASE schedule](https://www.FreeBSD.org/releases/12.0R/schedule.html)  
Link:	[FreeBSD development snapshots](https://download.FreeBSD.org/ftp/snapshots/ISO-IMAGES/)

The FreeBSD Release Engineering Team is responsible for setting
and publishing release schedules for official project releases
of FreeBSD, announcing code freezes and maintaining the
respective branches, among other things.

The FreeBSD Release Engineering Team completed the 10.4-RELEASE,
led by Marius Strobl, early October.  FreeBSD 10.4-RELEASE is the
fifth release from the *stable/10* branch, which builds on the
stability and reliability of 10.3-RELEASE.

The 11.2-RELEASE cycle started April 20 with the code slush, and continued to
progress throughout the rest of the quarter with the code freeze, followed by
three BETA builds and three RC builds, with the final release build announced
June 27.

The FreeBSD Release Engineering Team started the 12.0-RELEASE cycle August 10,
beginning with the code slush.  The code slush followed August 24, with the
*stable/12* branch expected to be created September 21.

However, due to unforeseen circumstances related to upstream code that was
deemed necessary to include in 12.0-RELEASE, the schedule needed to be
adjusted several times to account for works-in-progress related to the
upstream code to be compatible with other base system utilities.  At the end
of the quarter, the *stable/12* branch had not been created due to this delay.

Throughout the remainder of the quarter, several development snapshots builds
were released for the *head*, *stable/11*, and *stable/10* branches.

Much of this work was sponsored by the FreeBSD Foundation.

## Ports Collection ##

Contact: René Ladan, <portmgr-secretary@FreeBSD.org>

Link:	[About FreeBSD Ports](https://www.FreeBSD.org/ports/)  
Link:	[Contributing to ports](https://www.FreeBSD.org/doc/en_US.ISO8859-1/articles/contributing/ports-contributing.html)  
Link:	[FreeBSD ports monitoring](http://portsmon.FreeBSD.org/index.html)  
Link:	[Ports management Team](https://www.FreeBSD.org/portmgr/index.html)  
Link:	[FreeBSD portmgr (@freebsd_portmgr)](https://twitter.com/freebsd_portmgr/)  
Link:	[FreeBSD Ports Management Team (Facebook)](https://www.facebook.com/portmgr)  
Link:	[FreeBSD Ports Management Team (Google+)](https://plus.google.com/communities/108335846196454338383)

During the first quarter of 2018, the number of ports grew to almost 32,000. There
are currently 2,100 open PRs with less than 600 unassigned.  There were
7,900 commits from 169 committers. Compared to last quarter, the number
of commits grew by 18% and the number of PRs dropped by 25%.  Those are
some good numbers.

During the following two quarters, the number of ports grew to just under
34,000.  The number of open PR grew to almost 2,500 with less than 600
of those unassigned. A total of 175 committers made almost 14,200 commits.
Compared to the first quarter, the number of commits dropped by 10% and
the number of PRs grew by 19%.

During the last three quarters, portmgr took twelve commit bits in for
safekeeping: maho@, wxs@, vg@, tabthorpe@, pawel@, junovitch@, kevlo@,
ian@, nemysis@, daichi@, deichen@, and rea@.

On the other hand, we welcomed thirteen new committers: 
Eric Turgeon (ericbsd@), Devin Teske
(dteske@), Matthias Fechner (mfechner@), Fernando Apesteguía (fernape@),
Koichiro IWAO (meta@), Sean Chittenden (seanc@, returning),
John Hixson (jhixson@), Kevin Bowling (kbowling@), Sergey Kozlov
(skozlov@), Fukang Chen (loader@), Gleb Popov (arrowd@),
Mateusz Piotrowski (0mp@), and Jesper Schmitz Mouridsen (jsm@).
itetcu@ and kevlo@ returned after a hiatus.

During the last three quarters, antoine@ ran no less than 113 exp-runs
to test updates and to perform cleanups and improvements to the framework and the
base system. Most of them
were for port upgrades, but others include LLD progress, changing the
default port versions, improving support for armv6, armv7, and RISC-V,
removing old base system functionality, new USES,
and better matching pkg-plist with
Makefile options (DOCS and
EXAMPLES).

Five new USES were introduced:

  * apache: handle dependencies on the Apache web server and modules
  * eigen: automatically depend on math/eigen2 or math/eigen3
  * emacs: handle dependencies on the Emacs editor and modules.
  * gl replaces the old USE_GL from bsd.port.mk
  * qt-dist, qt:4 and qt:5 replace the old USE_QT from bsd.qt.mk

EXTRA_PATCHES has been extended to support
directories, in which case it will automatically apply all
patch-\* files to the port.  Ports using USES=php:phpize,
php:ext, php:zend, and
php:pecl are now flavored and packages will
automatically be built for all versions they support (5.6, 7.0, 7.1 or
7.2).

Last quarter again saw some updates of major ports: pkg 1.10.5, Chromium
65.0.3325.181, Firefox 59.0.2 and Firefox-ESR 52.7.3, Ruby 2.3.7/2.5.1
and Qt5 5.9.4.
The default version of PHP was changed from 5.6 to 7.1. The former
version is no longer supported by the developers. Furthermore, the
default versions of Samba and GCC are now respectively 4.7 and 7. The
Xorg ports have been reorganized and there have been changes to
net/openntpd, please read UPDATING if relevant.

Open tasks:

  * The number of commits dropped somewhat over the last three quarters,
    leaving more PRs unresolved. If you can, please pick up some PRs
    and improve everyone's experience.

## Core Team ##

Contact: FreeBSD Core Team, <core@FreeBSD.org>

Much of Core's focus for the past months has been on three items.

1. We have been coordinating between different groups to support the upcoming 12.0 release.  For example, the timing of the OpenSSL 1.1.1 release has posed challenges.  The new OpenSSL version includes API changes, so many components of the base system and ports require changes.  Staying with the older OpenSSL in 12.0 in not a feasible option, because it would mean backporting many changes to a version of OpenSSL that will soon be unsupported.

2. We have begun discussions with the release engineering team and Scott Long about updating our release process.  Topics we are exploring include having more frequent point releases, changing the support model, and revising and improving the tooling used to manage the tree and releases.  More to come.

3. We are working to gather information to make more data-driven decisions.  For example, we are planning developer and user surveys.  If you have questions that you think should be added to the survey, please discuss them on freebsd-arch@.  We are exploring ways for automated user-driven hardware usage data to understand the changing ways our software is used and to target better hardware support.

Here are other noteworthy events (in chronological order) since the last quarterly report.

### 2017 Q4 ###

- Sean Eric Fagan's (sef) commit bit was reactivated with a period of re-mentoring under Alexander Motin (mav).
- The MIPS architecture was promoted to tier 2 status.
- Core approved changes to the Code of Conduct.
- All fortune data files, except freebsd-tips, were removed in r325828.
- Core approved the adoption of a policy requiring any license exceptions to be recorded alongside code.
- Gordon Tetlow (gordon) became the new security officer.
- Core approved the use of SPDX tags.

### 2018 Q1 ###

- Jeb Cramer (jeb) was awarded a src commit bit under the mentorship of Sean Bruno (sbruno) and Eric Joyner (erj).
- Members of the CoC Review Team were approved.  The membership is to be reviewed once per year.
- A vendor commit bit was awarded to Slava Shwartsman (slavash) of Mellanox Technologies under the mentorship of Konstantin Belousov (kib) and Hans Petter Selasky (hselasky).
- Walter Schwarzenfeld was awarded project membership.
- Brad Davis (brd) was awarded a src commit bit under the mentorship of Allan Jude (allanjude) with Baptiste Daroussin (bapt) as co-mentor.
- Vincenzo Maffione (vmaffione) was awarded a src commit bit under the mentorship of Hiroki Sato (hrs).
- Ram Kishore Vegesna (ram) was awarded a src commit bit under the mentorship of Kenneth D. Merry (ken) and Alexander Motin (mav).

### 2018 Q2 ###

- Tom Jones (thj) was awarded a src commit bit under the mentorship of Jonathan T. Looney (jtl).
- Matt Macy's (mmacy) commit bit was restored under the mentorship of Sean Bruno (sbruno).
- Breno Leitao (leitao) was awarded a src commit bit under the mentorship of Justin Hibbits (jhibbits) with Nathan Whitehorn (nwhitehorn) as co-mentor.
- Leandro Lupori (luporl) was awarded a src commit bit under the mentorship of Justin Hibbits (jhibbits) with Nathan Whitehorn (nwhitehorn) as co-mentor.
- The handover from the ninth to the tenth elected Core team took place.  The new Core members are: Allan Jude (allanjude), Benedict Reuschling (bcr), Brooks Davis (brooks), Hiroki Sato (hrs), Warner Losh (imp), Jeff Roberson (jeff), John Baldwin (jhb), Kris Moore (kmoore), and Sean Chittenden (seanc).
- Joseph Mingrone (jrm) was appointed the Core secretary under mentorship of the retiring Core secretary, Matthew Seaman (matthew).
- The new team liaisons were decided.  portmgr: Sean, doceng: Hiroki, secteam: Brooks, re: John, clusteradm: Allan, CoC: Warner, Foundation: Benedict, bugmeister: John, CI: Sean.
- David Maxwell (dwm) was awarded project membership.
- Daichi Goto's (daichi) commit bit was reactivated with a period of re-mentoring under George Neville-Neil (gnn).
- A vendor commit bit was awarded to Ben Widawsky (bwidawsk) of Intel under the mentorship of Ed Maste (emaste).

### 2018 Q3 ###

- Core decided to begin meeting twice per month in an attempt to catch up with many new agenda items.
- Li-Wen Hsu (lwhsu) was awarded a src commit bit under the mentorship of Mark Johnston (markj) with Ed Maste (emaste) as co-mentor.
- Samy al Bahra was awarded project membership.
- George Neville-Neil (gnn) was approved to begin co-mentoring Vincenzo Maffione (vmaffione).

## The FreeBSD Foundation ##

Contact: Deb Goodkin, <deb@FreeBSDFoundation.org>

The FreeBSD Foundation is a 501(c)(3) non-profit organization dedicated to supporting and promoting the FreeBSD Project and community worldwide. Funding comes from individual and corporate donations and is used to fund and manage software development projects, conferences and developer summits, and provide travel grants to FreeBSD contributors. The Foundation purchases and supports hardware to improve and maintain FreeBSD infrastructure and provides resources to improve security, quality assurance, and release engineering efforts; publishes marketing material to promote, educate, and advocate for the FreeBSD Project; facilitates collaboration between commercial vendors and FreeBSD developers; and finally, represents the FreeBSD Project in executing contracts, license agreements, and other legal arrangements that require a recognized legal entity.

Here are some highlights of what we did to help FreeBSD last quarter:

### Partnerships and Commercial User Support ###

As a 501(c)(3) non-profit, we don’t directly support commercial users, but we do work with them to understand their needs and help facilitate collaboration with the community. Last quarter we met with a few key FreeBSD users and supporters, to discuss pain points, how they can contribute back to FreeBSD, and what technologies they would like to see supported, to support FreeBSD over more of their technologies and products.
 
As many of you know, we formed a partnership with Intel around one and a half years ago. Since then the people we worked directly with left the company, but it moved us into a new relationship with their Open Source Technology Center (OTC).

We are very encouraged that Intel has dedicated additional resources from the OTC to work on FreeBSD in addition to existing resources from the networking group and other technologies such as QuickAssist.   Much of the work has been focused on security and OS mitigations but we're also focusing on other areas such as power management and persistent memory.    In May and again in July we traveled to Intel's Hillsboro campus to meet with management and engineers from OTC and the networking team.  We presented an overview of the project and Foundation and also discussed key markets and vendors who use FreeBSD in their products or services and their future requirements.  

Intel was also interested in learning more about who contributes to FreeBSD.  Along those lines we've done some work with OTC to create scripts and organizational mappings to answer that question.  This data has been updated through Q3 and is available (here).  It's interesting to see how the contributions change over time by clicking on the quarterly charts.   Note: that we do need developers to help us update and maintain the organizational mappings as we understand that developers do tend to move around and contractors are often working on behalf of multiple organizations.

### Fundraising Efforts ###

Our work is 100% funded by your donations. As of September 30, we raised $328,482. Our 2018 fundraising goal is $1,250,00 and we are continuing to work hard to meet and exceed this goal! Please consider making a donation to help us continue and increase our support for FreeBSD: https://www.FreeBSDfoundation.org/donate/.

We also have a new Partnership Program, to provide more benefits for our larger commercial donors. Find out more information at https://www.FreeBSDfoundation.org/FreeBSD-foundation-partnership-program/ 
and share with your companies!

### OS Improvements ###

The Foundation improves the FreeBSD operating system by employing our technical staff to maintain and improve critical kernel subsystems, add features and functionality, and fix problems. This also includes funding separate project grants like the arm64 port, porting the blacklistd access control daemon, and the integration of VIMAGE support, to make sure that FreeBSD remains a viable solution for research, education, computing, products and more.

We kicked off or continued the following projects last quarter:

  * OpenZFS RAID-Z Expansion project
  * Headless mode out-of-the-box for embedded Arm boards like the Beaglebone Black
  * Performance and scalability improvements

Having software developers on staff has allowed us to jump in and work directly on projects to improve FreeBSD like:

  * ZFS improvements
  * New Intel server support
  * kqueue(2) updates
  * 64-bit inode support
  * Stack guard
  * Kernel Undefined Behavior Sanitizer
  * Toolchain projects
  * i915 driver investigation
  * NVDIMM support in acpiconf(8)
  * Continuous integration dashboard (web page and physical hardware)
  * FAT filesystem support in makefs(8)

### Continuous Integration and Quality Assurance ###

The Foundation provides a full-time staff member who is working on improving our automated testing, continuous integration, and overall quality assurance efforts.

Foundation employee Li-Wen Hsu set up new CI servers to speed up amd64 build and test jobs, to reduce the latency between changes being committed and results being available. Li-Wen also set up a staging / development server in order to test changes to the CI system itself without affecting production results. W have also started a small hardware test lab, currently connected to the staging server, that tests the full boot and test cycle on physical hardware. In the near future additional hardware devices will be added, and this will migrate to the production CI server.

### Release Engineering ###

The Foundation provides a full-time staff member to lead the release engineering efforts. This has provided timely and reliable releases over the last five years.

Foundation employee, Glen Barber continued leading the efforts on the upcoming 12.0-RELEASE.  For details surrounding the work involved and progress thus far on 12.0-RELEASE, please see the FreeBSD Release Engineering Team section of this quarterly status report.  

### Supporting FreeBSD Infrastructure ###

The Foundation provides hardware and support to improve the FreeBSD infrastructure. Last quarter, we continued supporting FreeBSD hardware located around the world.

### FreeBSD Advocacy and Education ###

A large part of our efforts are dedicated to advocating for the Project. This includes promoting work being done by others with FreeBSD; producing advocacy literature to teach people about FreeBSD and help make the path to starting using FreeBSD or contributing to the Project easier; and attending and getting other FreeBSD contributors to volunteer to run FreeBSD events, staff FreeBSD tables, and give FreeBSD presentations.

The FreeBSD Foundation sponsors many conferences, events, and summits around the globe. These events can be BSD-related, open source, or technology events geared towards underrepresented groups. We support the FreeBSD-focused events to help provide a venue for sharing knowledge, to work together on projects, and to facilitate collaboration between developers and commercial users. This all helps provide a healthy ecosystem. We support the non-FreeBSD events to promote and raise awareness of FreeBSD, to increase the use of FreeBSD in different applications, and to recruit more contributors to the Project.

Check out some of the advocacy and education work we did last quarter:

  * Organized and ran the Essen FreeBSD Hackathon in Essen, Germany
  * Participated in the FreeBSD Developer Summit BSDCam, in Cambridge, England
  * Represented FreeBSD at the ARM Partner Meeting
  * Presented and taught about FreeBSD at SdNOG 5 in Khartoum, Sudan
  * Exhibited and gave a talk at OSCON 2018 in Portland, OR
  * Exhibited at the 2018 Grace Hopper Celebration and sponsored as a Silver Non-Profit Sponsor
  * Exhibited at COCON 2018 in Taipei, Taiwan
  * Sponsored and gave presentations and tutorials at EuroBSDCon in Bucharest, Romania
  * Organized and ran the Bucharest FreeBSD Developer Summit
  * Sponsored the 2018 USENIX Security Symposium in Baltimore, MD as an Industry Partner
  * Provided FreeBSD advocacy material
  * Sponsored the 2018 USENIX Annual Technical Conference in Boston, MA as an Industry Partner
  * Sponsored the OpenZFS Developer Summit as a Silver Sponsor
  * Presented and taught about FreeBSD at SANOG32 in Dhaka, Bangladesh
  * Sponsored the SNIA Storage Developer Conference 2018 as an Association Partner
  * Provided 11 travel grants to FreeBSD contributors to attend many of the above events.

We continued producing FreeBSD advocacy material to help people promote FreeBSD around the world.

Read more about our conference adventures in the conference recaps and trip reports in our monthly newsletters: https://www.freebsdfoundation.org/news-and-events/newsletter/

We help educate the world about FreeBSD by publishing the professionally produced FreeBSD Journal. Last quarter we published the July/August issue that you can find at https://www.FreeBSDfoundation.org/journal/.

You can find out more about events we attended and upcoming events at https://www.FreeBSDfoundation.org/news-and-events/.

### Legal/FreeBSD IP ###

The Foundation owns the FreeBSD trademarks, and it is our responsibility to protect them. We also provide legal support for the core team to investigate questions that arise.

Go to http://www.FreeBSDfoundation.org to find out how we support FreeBSD and how we can help you!

## Continuous Integration ##

Contact:

  * Jenkins Admin <jenkins-admin@FreeBSD.org>
  * Li-Wen Hsu <lwhsu@FreeBSD.org>

Link:

  * [FreeBSD Jenkins Instance](https://ci.FreeBSD.org)
  * [FreeBSD CI artifact archive](https://artifact.ci.FreeBSD.org/)
  * [FreeBSD Jenkins wiki](https://wiki.FreeBSD.org/Jenkins)
  * [freebsd-testing Mailing List](https://lists.FreeBSD.org/mailman/listinfo/freebsd-testing)
  * [freebsd-ci Repository](https://github.com/freebsd/freebsd-ci)

The FreeBSD CI team maintains continuous integration tasks for FreeBSD.  The CI
system regularly checks the changes committed to the project's Subversion
repository can be successfully built, and performs various tests and analysis
with the build results.  The CI team also maintains the archive of the artifact
built by the CI system, for the further testing and debugging needs.

Starting from June 2018, the project is sponsored by the FreeBSD Foundation in
hardware and staff.  For more details of the sponsored projects, please refer
to:

https://www.freebsdfoundation.org/news-and-events/newsletter/freebsd-foundation-update-september-2018/

In addition to that, we also helped checking regressions for OpenSSL 1.1.1
update and test continuously for 12-STABLE branch.

We had meetings and working groups at two developer summits during 2018Q3:

  * [BSDCam 2018](https://wiki.FreeBSD.org/DevSummit/201808/Testing)
  * [EuroBSDCon 2018](https://wiki.FreeBSD.org/DevSummit/201809)

Work in progress:

  * Fixing the failing test cases and builds
    * DTrace test: https://ci.FreeBSD.org/job/FreeBSD-head-amd64-dtrace_test/lastCompletedBuild/testReport/
    * ZFS test: https://ci.FreeBSD.org/job/FreeBSD-head-amd64-test_zfs/lastCompletedBuild/testReport/
    * GCC build: https://ci.FreeBSD.org/job/FreeBSD-head-amd64-gcc/
  * Adding drm ports building test against -CURRENT
  * Adding tests for selected project branches, e.g.: clang700-import
  * Adding new hardware to the embedded testbed
  * Implementing automatic tests on bare metal hardware
  * Planning running ztest and network stack tests

# Kernel Projects #

## 4G/4G address space split for i386  ##

Contact: Konstantin Belousov, <kib@FreeBSD.org>

Most 32-bit FreeBSD architectures, including i386, starts to suffer from
the growth of software during the recent decade.
When a 32-bit address space is enough, 32-bit mode still
has an advantage over the 64-bit one, due to the smaller
memory traffic and more economical use of caches, but it is harder to
provide the self-hosting i386 system build.  

Our i386 kernel so far split the 4GB address space of the platform into
3GB (minus 4MB) accessible to userspace, and 1GB for kernel itself.  In
other words, neither kernel nor userspace could access a full 4GB. Programs
such as clang and lld require very large virtual address spaces for
linking and 3GB is not enough for them.  The kernel has trouble fitting into
the 1GB limitation with the modern sizing for network buffers, ZFS and
other KVA-hungry in-kernel code.

In FreeBSD 12, i386 now provides dedicated address spaces for
userspace and kernel, giving each mode full 4GB (minus 8MB) of usable
addresses.  The userspace on i386 now has access to the same amount of address space as
compat32 on amd64 kernel, and there is much more breathing space for
the kernel itself.

We use two page director entries (PDEs) shared between modes, one for mapping the page table,
another for the mode switching trampoline and other required system
tables, such as GDT/IDT/TSS, which must be mapped always.  Significant
change was required for the locore code, of which the page table creation part
was completely rewritten in C (from assembly), improving
readability.

Because user address space is no longer shared with the kernel,
the copyout(9) functions needed to be rewritten to make transient mapping
of userspace pages for duration of accesses.  Initial implementation
used the vm_fault_quick_hold_pages() framework, but was later optimized
for faster small block copying by hand-written assembler routines
which temporary switched to user mode mappings from a trampoline.

Future plans for maintenance of i386 include making the i386 pmap capable
of runtime selection of the PAE or non-PAE page table format and bringing NX
mappings for regular i386 kernel.

The work was sponsored by The FreeBSD Foundation.

## FreeBSD/DTrace

Contact: George Neville-Neil, <gnn@FreeBSD.org>

Contact: Domagoj Stolfa, <domagoj.stolfa@cl.cam.ac.uk>

DTrace is a whole-system debugging tool in FreeBSD and is one of the
actively supported projects during the past year.

A research prototype of a distributed version of DTrace and a version
of DTrace that can trace bhyve virtual machines from the host FreeBSD
system are currently under development at the University of Cambridge
as a part of the CADETS project. Recent developments include the
creation of dlog, an in-kernel DTrace consumer which is able to
publish to Kafka. In addition to that, early boot tracing and tracing
on shutdown was improved upon. On the virtualisation front,
improvements were made in the ability to dereference and follow
pointers inside guests from the host in the probe context by
implementing a nested page table walk inside DTrace for Intel
architectures. Moreover, the CADETS project has started formalising
DTrace in HOL4 which enables automated test generation, high assurance
of DTrace implementations in terms of adherence to the specification
and exploration of all allowable behaviours for a given D
script. Currently, the formal model contains most of DIF instructions
and a code generator for them, providing the ability to run DIF
programs specified using the model using FreeBSD's DTrace
implementation.

As a result of all of this, a number of changes were upstreamed to the
FreeBSD auditing subsystem and new variables such as `jid` and
`jailname` were added to DTrace which can be accessed from D scripts.

OpenDTrace Specification 1.0 has been published which covers the
internal workings of DTrace in general, and its adaptation to various
operating systems in particular.  This work was sponsored by
AFRL/DARPA through the CADETS project.

Ruslan Bukin (br@) has added C-compressed ISA extension support to the
RISC-V FBT provider as a part of the ECATS project.

Mark Johnston (markj@) has done some work to fix interactions between
FBT and ifuncs. ifuncs are a toolchain feature which allow programmers
to select a function's implementation at boot-time, rather than at
compile-time. For instance, on amd64, memcpy() is an ifunc and may be
implemented by either memcpy_erms() or memcpy_std(). FBT created
probes for the implementation functions, but we needed some extra
support to ensure that fbt::memcpy:entry continues to work as
expected. Similar work is needed for the PID provider, but is still
pending.

Microsoft showed a working demo of DTrace, which was ported from
FreeBSD [1].

Added to FreeBSD base in 11.2, dwatch is a new DTrace tool, developed
by Devin Teske (dteske@), for automating complex queries for data and
surgically tapping the kernel. In base there are 85 profiles for
interpreting domain-specific data with another 17 available from ports
making a total of over 100 different pipelines from which you can
extract data in multiple formats. dwatch also simplifies observation
of over 100,000 probe points available in FreeBSD, making it easy to
find any process, thread, or jail triggering any probe. On-top of all
that, dwatch profiles can leverage higher-level languages such as
python, perl, sh, and many more.

[1]: https://youtu.be/tG8R5SQGPck?t=891

## ACPI NVDIMM driver ##

Contact: Konstantin Belousov, <kib@FreeBSD.org>

NV-DIMM is the technology which provides non-volatile memory with the
access parameters similar to the regular DRAM, in the normal memory
address space of the host.  ACPI and UEFI specifications define
platform-independed way to detect and enumerate presence of NVDIMM and
get most of the data needed for correct applications use of it.

FreeBSD driver parses the ACPI NFIT table which lists NV-DIMMs, their
operational characteristics, and physical address spaces where the
NVDIMM memory is accessible.  Driver presents each address region as
two devices, one allows userspace to open(2) devfs node, which can be
read/written/mapped from the application, the mapping is zero-copy.
Another device is actually geom disk(9), which makes it possible to
use NVDIMM for normal FreeBSD filesystem, like UFS/ZFS/msdosfs.  Note
that buffer cache/mapping of files from a filesystem created over
NVDIMM causes unneeded double-buffering.

Apparently, on typical modern hardware, NVDIMM regions are located far
from the regular memory in the address space, and have attributes not
compatible with the regular DRAM.  This makes it unfeasible to extend
the direct map to provide kernel mappings.  New pmap KPI was designed,
pmap_large_map(9), which allows efficient mapping of very large
physical regions into KVA.  Also it have some optimizations to the
cache flush over the mapped regions, needed to efficiently support bio
flushes from the filesystems.  NVDIMM driver uses the KPI, it might be
also useful for the NTB driver.

The work was sponsored by The FreeBSD Foundation.

TODO:

  * Intel currently works on extending the driver with the support for
    UEFI namespaces.

  * DAX-capable filesystem is needed, which solves the issue of
    double-buffering.  Our tmpfs already provides VM facilities which
    allows it to avoid double-buffering for mmap, which can be reused
    there.

## SMAP ##

Contact: Konstantin Belousov, <kib@FreeBSD.org>

Support for SMAP, which stands for supervisor-mode access prevention,
was added to amd64 kernels.  SMAP makes faulting any access from the
supervisor mode to the pages accessible to user mode, unless the
%eflags.AC bit is set.

SMAP implementation uses the ifunc framework to avoid checking for the
SMAP capability of hardware on each call for the copyout(9) and other
functions.

On amd64, we have the common address space between kernel and user.
Enabling SMAP virtually splits the it into two disjoint address
spaces, providing relatively low-overhead way of catching direct
accesses from kernel to usermode, without using the copyout(9) family
of functions.

It is interesting that not much bugs were found in our kernel after
the SMAP was enabled.  One issue existed in the pci(9) user driver.
On the other hand, at least two ports, VBox and acpi_call, appeared to
access userspace in unsafe manner.

The work was sponsored by The FreeBSD Foundation.

## Large scale package building ##

Contact: Mateusz Guzik, <mjg@FreeBSD.org>

Building packages on a 128-thread machine with poudriere exhibits some
bottlenecks.

See the October FreeBSD Foundation Newsletter for a short write-up:
https://www.freebsdfoundation.org/news-and-events/newsletter/freebsd-foundation-update-october-2018/

One encountered problem stems from process handling.

The standard process life cycle on UNIX-like systems looks like this:
- a process is created with fork(2)
- it can do regular work or execve(2) a new binary
- it exits, becoming a zombie
- the parent collects the exit code and removes the zombie

There are other variations (e.g. vfork(2) can be used instead of
fork).

When you type 'ls' into your shell, it will typically vfork a new process
which will then execve /bin/ls.

All this is guarded with several global kernel locks, but the granularity
can be significantly improved.

A different problem stems from pipes.

Pipes are used all the time, e.g. "du -s | sort -n" creates a pipe whose
one endpoint is standard output for du and another is standard input for sort.

By default the pipe can hold up to 16KB before it gets filled up.

The kernel dedicates part of its virtual address space to hold pipe buffers
and allocates/deallocates physical pages as pipes get created/destroyed.
This is induces TLB invalidation requests to other CPUs, which causes an
unnecessary slowdown.

An easy way out is to cache a certain number of buffers.

The work is sponsored by The FreeBSD Foundation.

## String functions on the amd64 architecture ##

Contact: Mateusz Guzik, <mjg@FreeBSD.org>

Functions like memset, memmove and memcpy are very frequently used by virtually
all programs. They can be optimized in various ways, but FreeBSD uses very
rudimentary implementations using rep movsq/stosq. rep prefix has high startup
latency which is overly expensive when dealing with small sizes.

Short term goal of this project is to implement faster variants for the kernel
and import them into libc. The main speed up comes from not using rep for small
sizes (< 256) and from aligning target buffers to 16 bytes when rep is used.
On top of that runtime detection of the Enhanced REP MOVSB/STOSB extention can
be used to only use rep movsb/stosb.

Mid term goal extends userspace. SIMD extensions can be used to make these functions
faster. They can't easily be used in the kernel: SIMD registers are not saved on
transitions user&lt;-&gt;kernel for performance reasons. Thus any use would have to
take care of saving these registers, which can consume any win from using them in
the first place. This is not a concern for userspace code.

There is a BSD-licensed implementation in bionic:
https://android.googlesource.com/platform/bionic/+/master/libc/arch-x86_64/string/

which with some modifications can be used in libc later on.

See the Intel Optimization Manual for reference:
https://www.intel.com/content/dam/www/public/us/en/documents/manuals/64-ia-32-architectures-optimization-manual.pdf

The work is sponsored by The FreeBSD Foundation.

## 32-bit compatibility and other ABI cleanups ##

Contact: Brooks Davis, <brooks@FreeBSD.org>

As part of maintaining an external ABI (application binary interface)
compatibility layer, I've been improving FreeBSD infrastructure,
primarily the 32-bit compatibility layer. One of FreeBSD's strengths is
that we can easily support many ABIs. This includes support for a.out
format executables (vs the standard ELF), support for i386 on amd64, the
Linux emulation layer, etc.

This infrastructure has existed for decades and not every design
decision has stood the test of time.  Support has also been incomplete
in a number of areas (e.g. network management under 32-bit emulation).

Committed improvements include:
 
 * Improved `ioctl` and `sysctl` support to allow `ifconfig` and
   `netstat` to work in 32-bit compat mode.

 * Migration from a model of translating `ioctl` commands and data
   structures at the kernel boundary to translating where the commands
   are processed.  This is a correctness improvement (`ioctl` commands
   have not meaning outside the specific file descriptor in question)
   and improves code reusability (my out-of-tree work will soon include
   a 64-bit compatibility layer.)

 * Simplifications of the generic ELF process execution path by Ed
   Maste, John Baldwin, and myself.  A number of simplifications including
   minor speedups have been committed.

Portions of this work were developed by SRI International and the
University of Cambridge Computer Laboratory (Department of Computer
Science and Technology) under DARPA/AFRL contract FA8750-10-C-0237
("CTSRD"), as part of the DARPA CRASH research programme and under DARPA
contract HR0011-18-C-0016 ("ECATS"), as part of the DARPA SSITH research
programme.

Work in progress includes cleanups to the APIs used by the kernel when
creating processes and continued `ioctl` improvements.  Works is also
underway to generate the 32-bit system call list from the "default"
list.

The remaining `ioctl` commands handled in
[sys/compat/freebsd32/freebsd32_ioctl.c](https://svnweb.FreeBSD.org/base/head/sys/compat/freebsd32/freebsd32_ioctl.c?view=log)
need to be migrated to the point of implementation. Help with the latter
would be appreciated.

## Allwinner SoC Support

Contact: Emmanuel Vadot, <manu@FreeBSD.org>

  * SPI driver added for A64 SoC
  * Thermal driver added/fixed for A64/H3/H5 SoCs
  * Lot of bugs where fixed in the mmc driver, stability should be better
  * New driver for AXXP803 which is the power chip companion of the A64 SoC
  * Add overlays to use another timer controller as the default one in A64 if faulty
    These overlay is enabled in the PINE64/LTS images by default

## ARMv6 and ARMv7 image now use EFI loader

Contact: Emmanuel Vadot, <manu@FreeBSD.org>

Instead of using the ubldr version of the loader which uses the U-Boot
API, all images now use loader.efi as their primary FreeBSD loader.
This allow us to have a common boot path for all arm and arm64 image.

## Armada 38x FreeBSD support ##

Contact: Marcin Wojtas, <mw@semihalf.com>  
Contact: Patryk Duda, <pdk@semihalf.com>  
Contact: Rafał Kozik, <rk@semihalf.com>

Link:	 [PRODUCT BRIEF](https://www.marvell.com/documents/egrkpyqzpoebxblyeept/)

The Marvell Armada 38x is a very poplular ARMv7-based dual core SoC.
Thanks to the multiple low and high speed interfaces
the platform is used in a wide range of products, such
as Network-Attached Storage (NAS), Wi-Fi Access Point (WAP) and others.

Since last report, remaining Armada 38x support was integrated to HEAD, which can now compile with the armv7
GENERIC config and use unmodified sys/gnu/dts device trees. The details are as follows:

* GENERIC config
    - Introduce a vast rework of sys/arm/mv directory for arm and armv7 platforms.
    - Enable PLATFORM support for Marvell ARMv7 SoCs, which can now can boot with GENERIC kernel.
    - Base on dynamic detection of SoC type and device tree instead of using ifdefs
      and enable more flexible environment for maintaining Marvell platforms.
* sys/gnu/dts device trees
    - Improve platform code and the drivers (e.g. CESA, PCIE, GPIO) to properly work with original
      Linux device trees.
* GPIO
    - Add multiple fixes and improvements to the sys/arm/mv/gpio.c
    - Rework driver to properly integrate with HEAD GPIO frameworks (main and gpioled)
    - Enable support for both old and Linux GPIO device tree bindings, so that multiple controllers
      can be used.

Sponsors: Stormshield, Semihalf

## Save/Restore/Migration support in bhyve ##

Contact: Elena Mihailescu, <elenamihailescu22@gmail.com>  
Contact: Darius Mihai, <dariusmihaim@gmail.com>  
Contact: Sergiu Weisz, <sergiu121@gmail.com>  
Contact: Mihai Carabas, <mihai@FreeBSD.org>

Link:	[Github repository for the save/restore and migration features](https://github.com/FreeBSD-UPB/freebsd/tree/projects/bhyve_migration)  
Link:	[Github wiki - How to Save and Restore a bhyve guest](https://github.com/FreeBSD-UPB/freebsd/wiki/Save-and-Restore-a-virtual-machine-using-bhyve)  
Link:	[Github wiki - How to Migrate a bhyve guest](https://github.com/FreeBSD-UPB/freebsd/wiki/Virtual-Machine-Migration-using-bhyve)  
Link:	[Github wiki - Suspend/resume test matrix](https://github.com/FreeBSD-UPB/freebsd/wiki/Suspend-Resume-test-matrix)

The Save/Restore for bhyve feature is a suspend and resume facility added to the
FreeBSD/amd64's hypervisor, bhyve. The bhyvectl tool is used to save the guest
state in three files (a file for the guest memory, a file for devices' and CPU's
state and another one for some metadata that are used in the restore process).
To suspend a bhyve guest, the bhyvectl tool must be run with the `--suspend <state_file_name>`
option followed by the guest name.

To restore a bhyve guest from a checkpoint, one simply has to add the `-r` option
followed by the main state file (the same file that was given to the `--suspend`
option for bhyvectl) when starting the VM.

The Migration feature uses the Save/Restore feature to migrate a bhyve guest
from a FreeBSD host to another FreeBSD host. To migrate a bhyve guest,
one needs to start an empty guest on the destination host from a shared guest
image using the bhyve tool with the `-R` option followed by the source host
IP and the port to listen to migration request. On the source host, the
migration is started by executing the bhyvectl command with the `--migrate`
option, followed by the destination host IP and the port to send to the messages.

__New features added__:

  * Create the socket connection between source and destination hosts;
  * Migrate the guest state via sockets;
  * Separate the suspend/resume/migration code from the bhyverun.c and bhyvectl.c and added two new files for them: migration.c and migration.h;
  * Added save/restore state for xhci;
  * Added save/restore state for fbuf;
  * Fix vhpet restore state issues (timers related);
  * Add partially support for suspending and resuming a Linux guest;

Sponsors: Matthew Grooms; iXsystems;

__Future tasks__:

   * Check if live migration can be implemented using the FreeBSD's Copy-on-Write mechanism;
   * Add live migration support by using EPT (Intel);
   * Add live migration support by using NPT (AMD);
   * Add suspend/resume support for nvme;
   * Add suspend/resume support for virtio-console;
   * Add suspend/resume support for virtio-scsi;
   * Fix restore timers issues;
   * Fix suspending bhyve - threads issues;
   * Fix suspending bhyve - mutexes issues;
   * Add suspend/resume support for Windows guests.

## Building FreeBSD on non-FreeBSD hosts ##

Contact: Alex Richardson, <arichardson@FreeBSD.org>

Link:	 [Wiki](https://wiki.FreeBSD.org/BuildingOnNonFreeBSD) and [GitHub project](https://github.com/arichardson/freebsd/tree/crossbuild-aug2018)

Currently FreeBSD can only be built on a FreeBSD host. However, most free
CI tools only allow building on Linux or macOS and therefore can not be used
for building the FreeBSD base system. Furthermore, it is sometimes useful to
cross-build FreeBSD for a remote machine or an emulator even if the build
machine is not running FreeBSD.
The goal of this project is to allow building FreeBSD on both Linux and macOS hosts
and in the future it may be extended to allow compiling on a Windows host.
This work originates from the CHERI project and was motivated by multiple cases of
people wanting to try out CheriBSD but not being able to compile it since they did
not have a FreeBSD system available for compiling.
Once completed this project will also allow developers to contribute to on FreeBSD
even if they don't have access to a FreeBSD build system.

The current set of patches for this project can be found on
[GitHub](https://github.com/arichardson/freebsd/tree/crossbuild-aug2018).
With the current prototype it is possible to compile both world and kernel for
architectures that use clang and for MIPS64. However, some options such as LOCALES are
not supported yet and require further changes before the bootstrap tools can be built
on Linux/macOS.

Some changes required for building on non-FreeBSD have already been merged to
HEAD but there is still a rather large amount of changes that need review.

If you are interested in getting this into HEAD and would like to help, please
try the current prototype and report any issues to arichardson@FreeBSD.org.
If you can help with reviewing the changes please contact arichardson@FreeBSD.org
to be added to any pending Phabricator reviews.

## DTS Update ##

Contact: Emmanuel Vadot, <manu@FreeBSD.org>

DTS files (Device Tree Sources) were updated to be in pair with Linux 4.18 for
the 12.0 release.

The DTS are now compile for some arm64 boards as the one present in U-Boot are
now always up-to-date.

## ENA FreeBSD Driver Update ##

Contact: Michał Krawczyk, <mk@semihalf.com>

Link:	 [ENA README](https://github.com/amzn/amzn-drivers/blob/master/kernel/fbsd/ena/README)

ENA (Elastic Network Adapter) is the smart NIC which is used in the virtualised
environment of Amazon Web Services (AWS). It supports multiple queues and can handle up to 25 Gb/s, depending on the instance type on which it is used.

Since last report, the ENA v0.8.0 and v0.8.1 were released, which introduced
many bug fixes, new features, optimization, stability and error recovery
improvements. The last is especially important on the AWS, where the instances
have to be reliable as they may be running very sensitive functions and the
down time of the VM should be reduced to minimum.

The v0.8.0 and v0.8.1 release patches included:

  * Upgrade of the HAL to version v1.1.4.3
  * Improvement to the reset routine - the driver is now triggering reset from
     more fault points and is passing the reset reason to the device, which can
    perform the reset adequately to the encountered error.
  * The device statistics (like global Tx and Rx) are not read from the device,
    anymore. The only exception are Rx drops, which are read using the AENQ
    descriptor.
  * The RX Out Of Order completion feature was added, which enabled to cleanup the
    RX descriptors out of order by keeping trace of all free descriptors.
  * RX ring is now being monitored, to prevent the ring from stalling.
  * Error handling paths were reworked and fixed.
  * Driver was covered with branch prediction statements, to use the most of this
    CPU feature in the hot paths.
  * Fix handling of the DF flag in the IP packets.
  * Add dynamic logging and reduce number of messages being printed by the driver.
  * MTU configuration now is being verified using the device capabilities instead
    of constant value.
  * Do not pass packet header length hint to the device, because for the chained
    mbufs it may be problematic to determine header length, if the header is split
    into multiple segments.

Sponsor: Amazon.com Inc.

## FreeBSD Graphics Team ##

Contact: FreeBSD Graphics Team, <x11@FreeBSD.org>  
Contact: Niclas Zeising, <zeising@FreeBSD.org>

Link:	 [Project GitHub page](https://github.com/FreeBSDDesktop)

The FreeBSD X11/Graphics team is responsible for the lower levels of the FreeBSD
graphics stack.  This includes graphics drivers, graphics libraries such as the
MESA OpenGL implementation, the X.org xserver with related libraries and
applications, and Wayland with related libraries and applications.

There has been a lot of changes since the last report.  The most important one
is the change of driver distribution and updates.  On FreeBSD 11.2 and later
modern graphics drivers using the Linux KPI subsystem are found in ports.  These
give much improved support for Intel and AMD graphics hardware, however, they
are currently only available for amd64.

The legacy drivers available in the FreeBSD base system are also available in
the ports tree, since they cause issues with the new drivers.  They will remain
in tree for 11.2 and 12, but work is on-going to have them removed for 13,
except for arm.

The easiest way to install the new drivers is to install graphics/drm-kmod which
will install the correct driver depending on your architecture and FreeBSD
version.

There have been changes to the ports as well.  Most notably is the changed
handling of OpenGL dependencies, which has moved to USES instead of being
handled directly in bsd.port.mk.  Other big infrastructure changes is the move
from individual \*proto packages to xorgproto, and turning that into a build
time dependency.  Many thanks to portmgr for help with exp-runs for these
changes.

There have also been updates to applications and libraries as needed.

On the project management side, there is ongoing work to set up a more efficient
way of working, including bi-weekly conference calls to discuss the current
works in progress.  Notes from these conference calls will be posted on the
mailing list.

Looking forward, the current major works in progress is to update the graphics
driver to be on pair with Linux 4.17.  The code is merged, but patching and bug
fixing is ongoing.

There is also work to port the VMware guest graphics driver, vmwgfx, to FreeBSD
and to the Linux KPI, to get better graphics support in VMware.

Lastly on the driver side is to get the new graphics drivers to work on i386 as
well.  Experimental support for this exists in the code repository, but is not
yet merged to the FreeBSD ports tree.

In userland, the biggest things happening is the update of the input stack,
including libinput and supporting libraries.

Work is also ongoing on updating MESA libraries.

On the project management side, the most important tasks is to continue to work
on the team, and how we work internally.

We are also working on setting up a list of requirements for testing, so that we
can be reasonably assured that updates won't cause regressions.

People who are interested in helping out can find us on the x11@FreeBSD.org
mailing list, or on our Gitter chat: https://gitter.im/FreeBSDDesktop/Lobby.  We
are also available in #freebsd-xorg on EFNet.

We also have a team area on GitHub where our work repositories can be found:
https://github.com/FreeBSDDesktop

## ifuncs ##

Contact: Konstantin Belousov, <kib@FreeBSD.org>  
Contact: Ed Maste, <emaste@FreeBSD.org>  
Contact: Mark Johnston, <markj@FreeBSD.org>  
Contact: Mateusz Guzik, <mjg@FreeBSD.org>

Ifunc is a special construct in the ELF infrastructure, which allows
the selection of the implementation for the given symbol at the
runtime, when the ELF module gets the final relocations applied.  The
selection is governed by the small piece of user provided code,
attached to the symbol, so called resolver function.  Ifuncs provide
the very convenient way to select machine-specific implementation of
the parts of the code, without ugliness and unsafety of the
alternative approach, which is runtime patching.

Ifuncs require support both from the static linker ld(1), and from the
runtime linker for the corresponding execution environment.  On
FreeBSD, with the switch from the ancient GPLv2 licensed BFD-based
ld(1) to either in-tree LLD or external modern BFD ld, the use of
ifuncs become possible.  Runtime linkers for i386, amd64, and arm64
kernels, usermode dynamic linker ld-elf.so.1 on i386 and amd64, and
static binaries startup code for i386 and amd64 currently support
ifuncs.

ifunc were already applied for optimization of the following areas of
amd64 kernel:

* context switching code, instead of huge number of runtime checks
  (PTI vs non-PTI, PCID or not, is INVPCID instruction supported for
  PCID) now uses set of mode-specific routines, see
  pmap_activate_sw().  Besides removing checks at runtime, it also
  makes the code much more cleanly structured and readable.

* TLB and cache flush implementation.

* memcpy/memmove, copyin/copyout variants selection for ERMS and SMAP.

* FPU state save and restore, depending on the support for AVX or not,
  this is also used on i386.

For amd64 userspace, we currently use ifunc for optimization of the
TLS base set and get arch-depended functions.

The work was sponsored by The FreeBSD Foundation.

## Intel Work on Core Enabling and Security ###

Contact: Ben Widawsky, <bwidawsk@FreeBSD.org>

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

- https://reviews.FreeBSD.org/D17675
- https://reviews.FreeBSD.org/D17676

NVDIMM namespace support has also been put up for review. ACPI spec defines
namespaces as a way of partitioning the device into separate labels. The current
work will integrate with geom(4). How these are used is application dependent.
This work is up for review as well: https://reviews.FreeBSD.org/D17619

The team has additionally taken on smaller tasks like porting turbostat(8),
working on git svn init scripts, some small modifications to acpi tooling, and
an effort to create a port PMDK.

## LLVM 7.0 - Sanitizers support improvements / Static code analysis ##

Contact: David Carlier, <devnexen@gmail.com>

Link:	 [Release notes](http://releases.llvm.org/7.0.0/docs/ReleaseNotes.html)

In order to increase the FreeBSD tooling to uncover
code bugs in the userland, further compiler-rt components 
support and static code analysis improvements had been added
since the last 6.0 version.

Starting with the sanitizers, Memory Sanitizer (for amd64) mainly to
detect unitialized pointers. There is also a simple W^X paging
requests detection available from most of sanitizers is also present.

Also libFuzzer support finally had been possible. Basically,
it allows to test code with random values from corpus inputs.
Mutation and combination algorithms of those random inputs 
can be overwritten. Also can be used in addition of ubsan,
asan, msan and so on.

At last, the X-Ray instrumentation feature is also supported.
It is mainly about performance profiling purposes for a
reasonable performance runtime cost.

In the static code analysis department, reliable strlcpy (unfortunately strlcat
did not get merged in due time for the release) wrong usage
cases are now covered as well a W^X code detection had been added.

At the moment, this 7.0 version is imported by Dimitry Andric, within
its own git branch available only for FreeBSD after 12 releases.

## Boot Loader ##

Contact: Warner Losh, <imp@FreeBSD.org>  
Contact: Kyle Evans, <kevans@FreeBSD.org>  
Contact: Toomas Soome, <tsoome@Freebsd.org>

The FreeBSD boot loader lives in src/stand (prior releases had it in
sys/boot and lib/libstand). It covers all the code that the project
provides that interacts with the hardware before the kernel starts.

The LUA interpreter we added earlier in the year was made default this
quarter. Due to undiagnosed booting issues, however, it has been
disabled on sparc64 and all powerpc. The LUA interpreter is scheduled
to replace the FORTH interpreter entirely in FreeBSD 13, although the
FORTH interpreter will remain available as a build option in FreeBSD
12. The plans are not to remove the FORTH loader for about a year
after 12.0 release, or approximately January 2020. Platforms not
currently working have until that date to resolve the issues.

At this point, the LUA scripts implement everything that FORTH scripts
did. Where there was ambiguity in the spec, or where the FORTH scripts
were more forgiving that was strictly documented, every effort has
been made to improve the documentation and follow the old FORTH
behavior, or document the new behavior where the old behavior was
clearly a bug.

It's anticipated that no further changes to the FORTH loader or the
FORTH scripts will happen. They are quite mature and bullet proof at
tnhis point and it's unlikely that an undiscovered bug will need to be
fixed before retirement.

Other work in progress includes Toomas Soome's port to OpenIndiana. In
addition to porting, he's enhanced the code in a number of ways (both
in the block layer, and UEFI). Many of his improvements have been
committed to FreeBSD, though a few remain and hopefully will be
entering the tree soon after the freeze lifts.

UEFI booting has been greatly enhanced. However, there's still some
machines that have issues with the default BootXXXX variables or
something else in the environment that are being investigated. We hope
to understand the problems well enough to provide a fix for FreeBSD
12.0.

Ian Lepore has reworked the GELI support so that it is MI and can be
used on any architecture we support.

There's also efforts underway to bring signed image support, improved
crypto booting options and implement Multiboot 2.0.

## Usermode mapping of PCI BARs ##

Contact: Konstantin Belousov, <kib@FreeBSD.org>

Modern PCI(e) devices typically define memory-mapped BARs, each of them
have a separate page-aligned boundaries.  This is enforced by the need
of hypervisors to provide the pass-through using VT-d, which operates
with memory and has granularity of page for access control.  As is, it
also means that the BARs have suitable configuration for providing
access to usermode, controlling access by the normal page tables.

Linux already gives a way for userspace mapping of BARs using sysfs.

Of course, if userspace have enough privileges, it can read BAR,
determine the physical address of the mapping as seen by CPU, and use
mem(4) AKA /dev/mem to mmap.  This is really cumbersome, and leaves
issues open, e.g. BAR might be not activated, which requires
involvement on IOMMU on some architectures.  Also this rude approach
makes it very hard to create mappings with the correct caching
attributes.

FreeBSD pci(4) driver recently got a convenient support for such
mappings, and pciconf(8) utility was extended to use it.  See pci(4)
for PCIOCBARMMAP ioctl(2) request description for details, and
pciconf(8) for the -D switch.

TODO: automatically activate the BAR on mapping, this is not done yet.
Problem there is the need to avoid the resource conflict with the
possible future attachment of the kernel driver.

The work was sponsored by The FreeBSD Foundation and Mellanox Technologies.

## Device Mode USB ##

Contact: Edward Tomasz Napierala, <trasz@FreeBSD.org>

Link:	 [Handbook chapter](https://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/usb-device-mode.html)

Many embedded boards include hardware which supports device
side USB - the ability for the board to present itself to another
system as a USB drive, network adapter, or a virtual serial port.
FreeBSD USB stack has supported this functionality for quite some
time, but it wasn't used to its full extent.

The goal of this project was to fix that - to document the
functionality, possibly fix some bugs, and to make it easy
to use, automating it as much as possible.

Starting with FreeBSD 12.0, this functionality is enabled
out of the box.  This means you can connect your BeagleBone
Black's (using its USB client socket) or a Raspberry Pi 0
(using the OTG port) to your laptop, and you'll get a virtual
USB serial port, which serves as a system console, with getty(8)
waiting for you to log in.  This means you no longer need to
look for a keyboard and a screen, or mess with the console
cables just to configure your system.  You can also switch
it to provide network interface, or present itself as a USB
drive - it's all documented in the FreeBSD Handbook.

The work was sponsored by The FreeBSD Foundation.

## PINE64-LTS Image ##

Contact: Emmanuel Vadot, <manu@FreeBSD.org>

We now produce an image for the PINE64-LTS.
This image works on the PINE64-LTS and the Sopine with Baseboard.

## PocketBeagle Support ##

Contact: Emmanuel Vadot, <manu@FreeBSD.org>  
Contact: Tom Jones, <thj@FreeBSD.org>

Link:	 [Pocket Beagle](https://www.beagleboard.org/pocket)

The Pocket Beagle is the latest member of the BeagleBoard family.
Support for it was added and the Beaglebone image can be used on it directly.

## FreeBSD on PowerNV (ppc64) ##

Contact: Patryk Duda, <pdk@semihalf.com>  
Contact: Wojciech Macek, <wma@FreeBSD.org>  
Contact: Michal Stanek, <mst@semihalf.com>  
Contact: Nathan Whitehorn, <nw@FreeBSD.org>

Semihalf is happy to announce that FreeBSD is now running on IBM POWER8. This project is a continuation of work done by Nathan Whitehorn who provided basic support for a PowerNV emulator.

The IBM POWER8 family of CPUs offers superior performance compared to previous Power series. It provides complete NUMA support with up to 192 cores in a two socket system (up to 8 threads per core). All IO communication is handled by integrated PCIe interface equipped with multiple IOMMU engines.

The support for POWER8 system running FreeBSD in Non-Virtualized environment contains:

  * Generic driver for OPAL hypervisor
  * kboot loader modifications to allow Little-Endian loader to load a Big-Endian kernel ELF
  * skiboot update for ELF-parser allowing it to understand FreeBSD kernel file format
  * Basic support for PowerNV architecture, including modes of operation, MMU, interrupt controller
  * SMP operation (tested with 128 CPU configuration)
  * PHB subsystem driver, including IOMMU mapping for external buses
  * PCIe host controller driver
  * USB-3.0 XHCI driver
  * Reworked drivers to be Big-Endian compatible:
		- Chelsio cxgbe(4) 10/25G network adapter
		- NVMe SSD drive

All work has been merged into HEAD and will be included in FreeBSD 12.0-RELEASE.

Sponsors: IBM, FreeBSD Foundation, QCM Technologies, Semihalf, Limelight Networks.

The project is kindly initiated and supported by Limelight Networks (Kevin Bowling).

## FreeBSD on POWER9 ##

Contact: Matthew Macy, <mmacy@FreeBSD.org>

Once Justin Hibbits largely stabilized the powerpc64 port on the POWER9
based Talos II I decided to procure one. I've been slowly working towards
taking powerpc64 to parity with amd64. I've been working in an out of tree
GitHub project - in part to eliminate the need to continue to support the 11 
year old in tree gcc4.

Progress so far:

  - Adapted lock_delay to use POWER's SMT scheduling hints rather than
    using the yield hint from an older ISA
  - Added ifunc support
  - Ported the amd64 pmap so FreeBSD can use POWER9's new radix tree
    page tables. This will give us superpages mostly for free.
  - Reduced the overhead of copyinout primitives for radix.
  - Converted the copyinout primitives to ifuncs to switch between the
    old and the new at initialization time.
  - Converted pmap to use ifuncs to eliminate the overhead of kobj dispatch.
  - Hot patch out trap handling paths only needed by the older hashed page
    table support.

Work in Progress:

   - NMI semantics: NMIs need to be emulated by only soft disabling interrupts,
     disabling interrupts blocks all interrupts except machine check exceptions
     and system resets.
   - Superpage support: Superpages work in the functional simulator running SMT4
     but currently crash on real hardware due to incomplete page walk cache /
     TLB invalidation.
   - Kernel minidump - with radix MMU enabled minidump support was a fairly
     straightforward port but time needs to be spent on test / debug.
   - EARLY_AP_STARTUP - preliminary patches exist, but this is more work on !x86
     architectures due to IPI setup not being tied to the CPU code.

A list of the other items needed to achieve kernel feature parity with a
(wishful) list of milestones can be found at:
https://github.com/POWER9BSD/freebsd/projects/1

## FreeBSD on RISC-V ##

Contact: Ruslan Bukin, <br@FreeBSD.org>

FreeBSD/RISC-V has been one of the actively supported projects during the past year.

On a compiler front we have upstreamed FreeBSD OS-dependent bits for GNU toolchain. It was updated to GCC 8.1 and Binutils 2.30. FreeBSD packages are available.

FreeBSD Testsuite and required dependencies were successfully built for RISC-V and we did a test run: 152 tests failed out of 5186, which demonstrates a very good result for initial run and reveals areas to work on.

We have added support for compressed ISA extension to KDB debugger and DTrace FBT provider enabling C-compressed kernel and userland by default. The output of disassembling instructions in KDB is looking similar to objdump.

QEMU has updated to latest privilege spec allowing us to bring up FreeBSD on it. The emulation is quite fast: it takes one second only to boot FreeBSD to single-user mode in QEMU: https://www.youtube.com/watch?v=FnWpRBaWF18

Platform-Level Interrupt Controller (PLIC) driver was added. Interrupt support was converted to INTRNG.
PLIC is used in QEMU for virtio network and block devices (full FreeBSD distribution can be booted in QEMU).

Network virtualization support (VIMAGE) was fixed and enabled by default now.

In order to support RocketChip and derivatives we had to work on A(accessed), D(dirty) PTE (page table entry) bits management.
We have successfully tested this on a lowRISC board and it is booting to multiuser just fine. lowRISC UART driver was added.

Superuser-User-Modify (SUM) bit in sstatus register is now used: kernel can access userspace only within certain functions that explicitly handle crossing user/kernel boundary.

## RPI Firmware/DTB/U-Boot Update ##

Contact: Emmanuel Vadot, <manu@FreeBSD.org>  
Contact: U-Boot mailing list, <uboot@FreeBSD.org>

The RaspberryPi firmware loads the DTB from the fat partition based on
the model. U-Boot now uses this DTB and pass it to the FreeBSD loader/kernel
instead of using the one it embed.
This allow us to use the RaspberryPi Foundation provided DTB overlays to enable
HATs.
The Overlays can be obtained by installing the rpi-firmware package.

A new u-boot port for the W variant of the RPI0 was committed as u-boot-rpi-0-w.
Some experiments started by trasz@ show that we could maybe produce a generic
image for all armv6 RPI (RPI-B, RPI0 and RPI0W).

## Performance improvements ##

Contact: Matthew Macy, <mmacy@FreeBSD.org>

FreeBSD 12 saw the introduction of a number of performance improvements:
   - the introduction of the new synchronization primitive epoch to replace the
     use of reader locks for providing existence guarantees for data structures
   - epoch was used to provide an 85+% reduction in the overhead of pcb lookup
     in high core count systems
   - It was used to provide an 85+% reduction in UDP send overhead on high core
     count systems see the link for a bit more detail: 
       http://scalebsd.org/blog/2018/06/16/UDP-and-epoch-for-liveness-guarantees

   - System call overhead is now half that of 11
   - UNIX sockets now scale near linearly (previously maxed out at 3-4 threads)
   - The NUMA work has lead to a 20x-80x improvement in the scalability of page
     fault handling
    
# Ports #

## KDE on FreeBSD ##

Contact: Adriaan de Groot, <adridg@FreeBSD.org>  
Contact: Tobias C. Berner, <tcberner@FreeBSD.org>

Link:	 [KDE FreeBSD](https://FreeBSD.kde.org/)

KDE FreeBSD is responsible for the ports of the Plasma5 and KDE4 desktops, and
all associated applications. Further we also manage the Qt4 and Qt5 ports, as
well as CMake.

We also care for the FreeBSD builders for KDE's upstream CI on build.kde.org.

Since the last status report a lot of things have changed. First and foremost,
the Plasma5 Desktop and the Qt5 based KDE Applications have finally made their
way into the official ports tree after lingering for multiple years in our
development repository.

Secondly KDE4 has been marked deprecated and will be removed at the end of the
year. With Qt4 following no later than the next year (due to the exponentially
increasing burden of maintenance).

On a more technical side, bsd.qt.mk has been replaced by qt.mk and qt-dist.mk.
The porter's handbook is being updated (with thanks to Tobias Kortkamp).

Further we have been keeping CMake and Qt5 and almost every other port under our
control up to date. SDDM has been updated to the next-to-latest release with
backported security fixes.

One big issue we have is www/qt5-webengine, which requires too much time to keep
up to date, as the underlying chromium is in need of many patches, which change 
with every release. Another upcoming issue is the way in which FreeBSD's libinput
lags behind. This blocks future updates to KDE Plasma as well as Wayland 
improvements. Thankfully x11@ is looking at this issue already, so it should be
fixed soon -- for the meantime people who want to give the latest KDE Plasma
Desktop a try can use the appropriate branch from our GitHub.

People who are willing to contribute can find us on #kde-freebsd on freenode,
the kde@FreeBSD.org mailing list. Further we accept pull-requests and
contributions on github.com/freebsd/freebsd-ports-kde.

## Puppet ##

Contact: Puppet Team, <puppet@FreeBSD.org>

Link:	 [PuppetLab's FreeBSD slack channel](https://puppetcommunity.slack.com/messages/C6CK0UGB1/)
	 [BSDCan 2018: IT automation with Puppet](https://www.bsdcan.org/2018/schedule/events/930.en.html)

Since our last status report last year, the puppet@ team regularly updated the
Puppet ports to catch on upstream releases.  We have also held a Puppet talk at
BSDCan.

More recently, Puppet 6 was released, and a bunch of new ports appeared in the
FreeBSD ports tree: sysutils/puppet6, sysutils/puppetserver6,
databases/puppetdb6 being (obviously) the main ones. In this update, the Puppet
language has not been heavily modified. As a consequence, upgrading from Puppet
5 to Puppet 6 is an easy task compared to the experience you may have
encountered from previous major version bumps. If you are still using Puppet 4,
we recommend to schedule an upgrade soon: Puppet 4 is expected to be EOL by the
end of 2018.

Because distributing Marionette Collective modules via Puppet is more efficient
than using packages, the sysutils/mcollective-\*-{agent,client} ports have been
deprecated. Marionette Collective itself being phased out by PuppetLabs, the
sysutils/mcollective port is expected to be deprecated at some point in the
future, but we plan to keep it until an alternative is available. This
alternative, called Choria, is in active development by R.I.Pienaar the
original author of Marionette Collective. We are actively working with him to
support FreeBSD out of the box, and will commit sysutils/choria to the tree as
soon as it is considered a drop-in replacement for Marionette Collective.

## scarab: CLI tool for Bugzilla-related workflows ##

Contact: Oleksandr Tymoshenko, <gonzo@FreeBSD.org>

Link:    [GitHub repo](https://github.com/gonzoua/scarab)

scarab is a CLI tool that makes some of Bugzilla functionality
available from the command line. Normally users interact with the
[bugtracker](https://bugs.FreeBSD.org/bugzilla/) using web browser
but for certain workflows, Web UI may be more of an obstacle
than help requiring to perform more steps compared to CLI tool.

Bugzilla provides XML-RPC interfaces that can be used for
automation/integration and there are several CLI tools like
[pybugz](https://github.com/williamh/pybugz) that can be used
with bugs.FreeBSD.org as-is. They are generic one-size-fits-all
tools which mean they can do a lot of thing at the cost of
more complex CLI.

scarab was created to be more specialized and less complex with following
principles in mind:

  * Be an auxiliary tool, not a replacement for the web UI
  * Move complexity to a configuration file, keep arguments as simple as possible
  * Optimize for most common/tedious tasks

Based on my experience with Bugzilla following tasks were identified as a
candidates for inclusion in the first release of the tool:

  * Downloading attachment on host machine and copying it to devbox
  * Creating a file on the devbox and copying it to a host machine to be attached through Web UI
  * Creating PRs with common fields' values

First two operations were implemented as *files*, *fetch*, *fetchall*, *attach*
commands of the tool.

The third operation was implemented by introducing PR templates, set of
predefined field/value pairs, that can be combined run-time to provide higher
flexibility. More information and usage examples can be found in the
[config file example](https://github.com/gonzoua/scarab/blob/master/examples/scarabrc)

# Documentation #

## Various Documentation Bits ##

Contact: 
- Wiki:
  - wiki-admin@FreeBSD.org
  - #freebsd-wiki @ freenode IRC
- Quarterly reports:
  - Edward Tomasz Napierała, <trasz@FreeBSD.org>
  - Mateusz Piotrowski, <0mp@FreeBSD.org>

Links:	 
- [Wiki Fixit Group Website](https://wiki.FreeBSD.org/WikiFixitGroup/)

The FreeBSD Wiki used to be a scratch pad for the FreeBSD developers to
organize projects, store notes and publish articles that were about to be added
to the handbook. Recently, however, the FreeBSD wiki started to attract more
and more people from the wider FreeBSD community, which resulted in a change of
the character of the wiki.

As a result we decided to discuss the future of the tools we want to use for
documentation in FreeBSD (one of such discussions was held during BSDCam 2018, 
you may see some notes
[here](https://wiki.FreeBSD.org/DevSummit/201808/DeveloperTools)). The general
conclusion is that wiki is a great tool for what it was meant for: organizing
projects and notes in the community of developers. We should not move all our
documentation (especially handbooks) to Wiki as the quality and maintainability
would suffer. On the other hand, the current workflow of submitting
documentation patches, which involves checking out the doc tree and patching
XML files is not ideal for many end users. This is why we are trying to approach the problem from various directions:

1. The wiki is being cleaned up of old content. We are trying to define a clear
   hierarchy of subpages and categories to make navigating the wiki easier.
2. Some articles from the wiki are going to be migrated to either the doc tree
   or manual pages.
3. The quarterly reports project is testing out if using Markdown and GitHub as
   an alternative tool for submitting documentation lowers the barrier of
   entry.

# Third-Party Projects #

## HardenedBSD 2018Q3 Update

Contact: Shawn Webb, <shawn.webb@hardenedbsd.org>

Our last report was [June
2017](https://www.FreeBSD.org/news/status/report-2017-04-2017-06.html#HardenedBSD).
A lot has transpired since then. In this status report, we will
attempt to briefly cover all the progress we've made, including the
few commits that made it upstream to FreeBSD.

On 01 Jul 2018, we switched back to
[OpenSSL](https://hardenedbsd.org/article/shawn-webb/2018-04-30/hardenedbsd-switching-back-openssl)
as the crypto library provider in base. We did this because we lack
the resources and the documentation for properly supporting LibreSSL
in base. We still maintain LibreSSL in base; however, OpenSSL is
simply the default crypto library (aka, `WITHOUT_LIBRESSL` is the
default). We look forward to building a development community around
LibreSSL in HardenedBSD such that we can re-enable LibreSSL by
default, providing enhanced security for our users through the
rejection of software monocultures.

Cross-DSO Control Flow Integrity (Cross-DSO CFI) is an exploit
mitigation from llvm that provides forward-edge protections across
shared library and application boundaries. With HardenedBSD 12-STABLE,
we launched non-Cross-DSO CFI support in base. Meaning, CFI is only
applied to applications and not shared libraries. Along with
SafeStack, which provides backward-edge protections, Cross-DSO CFI
requires both ASLR and W^X for effectiveness as they store crucial
metadata needing protection. HardenedBSD expertly, efficiently, and
robustly fulfill those requirements through its PaX ASLR and PaX
NOEXEC implementations.

Over the past two years, we have slowly worked on Cross-DSO CFI
support in HardenedBSD. In mid-2018, we made enough progress that we
could publish an alpha [Call-For-Testing
(CFT)](https://hardenedbsd.org/article/shawn-webb/2018-07-16/preliminary-call-testing-cross-dso-cfi).
We need to integrate the Cross-DSO CFI support with the RTLD such that
function pointers resolved through `dlopen(3)`/`dlsym(3)` work properly
with the cfi-icall scheme. We also need to perform experimental
package builds, find breakages, and fix those breakages. We hope to
officially debut Cross-DSO CFI in the latter half of 2019 with the
possibility of pushing back to 2020. HardenedBSD remains the first and
only enterprise operating system to use CFI across the base set of
applications.

On 20 Aug 2018, we launched a new tool called `hbsdcontrol(8)` to
toggle exploit mitigations on a per-application basis.
`hbsdcontrol(8)` uses filesystem extended attributes and is the
preferred method for exploit mitigation toggling for those filesystem
that support extended attributes (UFS, ZFS). Our original utility,
`secadm`, should be used with filesystems that do not support extended
attributes (NFS).

In [September
2018](https://hardenedbsd.org/article/shawn-webb/2018-09-17/announcing-hardenedbsd-foundation),
the HardenedBSD Foundation Corp became a 501(c)(3) tax-exempt,
not-for-profit organization in the USA. This means that donations by
US persons are eligible for tax deductions. The creation of the
HardenedBSD Foundation will ensure that HardenedBSD remains successful
long-term. We look forward to working with the BSD community to
provide an open source, clean-room reimplementation of the grsecurity
patchset based on publicly-available documentation.

We assisted Kyle Evans with the new `bectl(8)` utility, primarily
enhancing jail support and fixing regressions. We are grateful for
Kyle Evans' assistance in landing the enhancements upstream in FreeBSD
and his overall responsiveness and helpfulness.

Relevant commits for the `bectl(8)` are:

1. [r339047](https://svnweb.FreeBSD.org/base?view=revision&revision=339047)
1. [r338221](https://svnweb.FreeBSD.org/base?view=revision&revision=338221)
1. [r337993](https://svnweb.FreeBSD.org/base?view=revision&revision=337993)
1. [r337947](https://svnweb.FreeBSD.org/base?view=revision&revision=337947)

We taught `bhyve(8)` how to live in a [jailed
environment](https://reviews.FreeBSD.org/rS337023), allowing users to
jail the hypervisor. We hardened the virtual address space of
`bhyve(8)` by using [guard pages](https://reviews.FreeBSD.org/rS338511).
This work made it upstream to FreeBSD. We are grateful to those in
FreeBSD who provided insight to increase the quality and efficiency
of our patches.
