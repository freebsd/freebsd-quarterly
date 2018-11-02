## 4G/4G address space split for i386  ##
Contact: Konstantin Belousov, <kib@freebsd.org>
Link:	 None

i386, as most other 32bit FreeBSD architectures, starts suffering from
the grow of software during the recent decade.  Althought 32bit
execution environments, when 32bit address space is enough, are still
have an advantage over the 64bit one, at least due to the smaller
memory traffic and more economical use of caches, it is harder to
provide the self-hosting i386 system build.  

Our i386 kernel so far split the 4G address space of the platform into
3G (without 4M) accessible to userspace, and 1G for kernel itself.  In
other words, neither kernel nor userspace got full 4G. The programs
like clang and lld, require very large virtual address space for
linking, 3G is not enough for them.  Kernel have trouble fitting into
1G limitation with the modern sizing for network buffers, ZFS and
other KVA-hungry in-kernel code.

In FreeBSD 12, i386 now provides dedicated address spaces for
userspace and kernel, giving each mode full 4G (- 8M) of usable
addresses.  The userspace on i386 now has the same resources as
compat32 on amd64 kernel, and there is much more breathing space for
the kernel itself.

We use two PDEs shared between modes, one for mapping the page table,
another for the mode switching trampoline and other required system
tables like GDT/IDT/TSS which must be mapped always.  Significant
change required for the locore code, which page table creation part
was completely rewritten and moved from assembler to C, aiding in
readability.

Since user address space is no longer shared with the kernel,
copyout(9) functions needed to be rewritten, making transient mapping
of userspace pages for duration of accesses.  Initial implementation
used vm_fault_quick_hold_pages() framework, but was later optimized
for faster small block copying by hand-written assembler routines
which temporary switched to user mode mappings from trampoline.

Future plans for maintanence of i386 include making i386 pmap capable
of runtime selection of PAE/non-PAE page table format, bringing NX
mappings for regular i386 kernel.

The work was sponsored by The FreeBSD Foundation.
## FreeBSD/DTrace

Contact: George Neville-Neil <gnn@freebsd.org>, Domagoj Stolfa <domagoj.stolfa@cl.cam.ac.uk>

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
Contact: Konstantin Belousov, <kib@freebsd.org>
Link:	 None

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
Contact: Konstantin Belousov, <kib@freebsd.org>
Link:	 None

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
[sys/compat/freebsd32/freebsd32_ioctl.c](https://svnweb.freebsd.org/base/head/sys/compat/freebsd32/freebsd32_ioctl.c?view=log)
need to be migrated to the point of implementation. Help with the latter
would be appreciated.
## Allwinner SoC Support

Contact: Emmanuel Vadot <manu@FreeBSD.org>

  * SPI driver added for A64 SoC
  * Thermal driver added/fixed for A64/H3/H5 SoCs
  * Lot of bugs where fixed in the mmc driver, stability should be better
  * New driver for AXXP803 which is the power chip companion of the A64 SoC
  * Add overlays to use another timer controller as the default one in A64 if faulty
    These overlay is enabled in the PINE64/LTS images by default
 ## ARMv6 and ARMv7 image now use EFI loader

Contact: Emmanuel Vadot <manu@FreeBSD.org>

Instead of using the ubldr version of the loader which uses the U-Boot
API, all images now use loader.efi as their primary FreeBSD loader.
This allow us to have a common boot path for all arm and arm64 image.
## Armada 38x FreeBSD support ##

Contact: Marcin Wojtas <mw@semihalf.com>, Patryk Duda <pdk@semihalf.com>, Rafał Kozik <rk@semihalf.com>

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
## bhyve - Save/Restore/Migration ##

Contact: Elena Mihailescu, <elenamihailescu22@gmail.com>

Contact: Darius Mihai, <dariusmihaim@gmail.com>

Contact: Sergiu Weisz, <sergiu121@gmail.com>

Contact: Mihai Carabas, <mihai@freebsd.org>

Link:	[Github repository for the save/restore and migration features](https://github.com/FreeBSD-UPB/freebsd/tree/projects/bhyve_migration)

Link:	[Github wiki - How to Save and Restore a bhyve guest](https://github.com/FreeBSD-UPB/freebsd/wiki/Save-and-Restore-a-virtual-machine-using-bhyve)

Link:	[Github wiki - How to Migrate a bhyve guest](https://github.com/FreeBSD-UPB/freebsd/wiki/Virtual-Machine-Migration-using-bhyve)

Link:	[Github wiki - Suspend/resume test matrix](https://github.com/FreeBSD-UPB/freebsd/wiki/Suspend-Resume-test-matrix)


The Save/Restore for bhyve feature is a suspend and resume facility added to the
FreeBSD/amd64's hypervisor, bhyve. The bhyvectl tool is used to save the guest
state in three files (a file for the guest memory, a file for devices' and CPU's
state and another one for some metadata that are used in the restore process).
To suspend a bhyve guest, the bhyvectl tool must be run with the ```--suspend <state_file_name>```
option followed by the guest name.

To restore a bhyve guest from a checkpoint, one simply has to add the ```-r``` option
followed by the main state file (the same file that was given to the ```--suspend```
option for bhyvectl) when starting the VM.

The Migration feature uses the Save/Restore feature to migrate a bhyve guest
from a FreeBSD host to another FreeBSD host. To migrate a bhyve guest,
one needs to start an empty guest on the destination host from a shared guest
image using the bhyve tool with the ```-R``` option followed by the source host
IP and the port to listen to migration request. On the source host, the
migration is started by executing the bhyvectl command with the ```--migrate```
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


## FreeBSD Core Team

Contact: FreeBSD Core Team <core@FreeBSD.org>

Much of Core's focus for the past months has been on coordinating loose ends with the upcoming 12.0 release.  For example, the timing of the release of OpenSSL 1.1.1 has posed challenges.  The new OpenSSL version includes API changes, so many components of the base system and ports require changes.  Staying with the older OpenSSL in 12.0 in not a feasible option, because it would mean backporting many changes to a version of OpenSSL that will soon be unsupported.

Here are other noteworthy events (in chronological order) since the last quarterly report.

- Sean Eric Fagan's (sef) commit bit was reactivated with a period of re-mentoring under Alexander Motin (mav).
- The MIPS architecture was promoted to tier 2 status.
- Core approved changes to the Code of Conduct.
- All fortune data files, except freebsd-tips, were removed in r325828.
- Core approved the adoption of a policy requiring any license exceptions to be recorded alongside code.
- Gordon Tetlow (gordon) became the new security officer.
- Core approved the use of SPDX tags.
- Jeb Cramer (jeb) was awarded a src commit bit under the mentorship of Sean Bruno (sbruno) and Eric Joyner (erj).
- Members of the CoC Review Team were approved.  The membership is to be reviewed once per year.
- A vendor commit bit was awarded to Slava Shwartsman (slavash) of Mellanox Technologies under the mentorship of Konstantin Belousov (kib) and Hans Petter Selasky (hselasky).
- Walter Schwarzenfeld was awarded project membership.
- Brad Davis (brd) was awarded a src commit bit under the mentorship of Allan Jude (allanjude) with Baptiste Daroussin (bapt) as co-mentor.
- Vincenzo Maffione (vmaffione) was awarded a src commit bit under the mentorship of Hiroki Sato (hrs).
- Ram Kishore Vegesna (ram) was awarded a src commit bit under the mentorship of Kenneth D. Merry (ken) and Alexander Motin (mav).
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
- Core decided to begin meeting twice per month in an attempt to catch up with many new agenda items.
- Li-Wen Hsu (lwhsu) was awarded a src commit bit under the mentorship of Mark Johnston (markj) with Ed Maste (emaste) as co-mentor.
- Samy al Bahra was awarded project membership.
- George Neville-Neil (gnn) was approved to begin co-mentoring Vincenzo Maffione (vmaffione).
## Building FreeBSD on non-FreeBSD hosts ##

Contact: Alex Richardson, <arichardson@freebsd.org>

Link:	 [Wiki](https://wiki.freebsd.org/BuildingOnNonFreeBSD) and [GitHub project](https://github.com/arichardson/freebsd/tree/crossbuild-aug2018)

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
archictures that use clang and for MIPS64. However, some options such as LOCALES are
not supported yet and require further changes before the bootstrap tools can be built
on Linux/macOS.

Some changes required for building on non-FreeBSD have already been merged to
HEAD but there is still a rather large amount of changes that need review.

If you are interested in getting this into HEAD and would like to help, please
try the current prototype and report any issues to arichardson@freebsd.org.
If you can help with reviewing the changes please contact arichardson@freebsd.org
to be added to any pending Phabricator reviews.
## DTS Update

Contact: Emmanuel Vadot <manu@FreeBSD.org>

DTS files (Device Tree Sources) were updated to be in pair with Linux 4.18 for
the 12.0 releaase.

The DTS are now compile for some arm64 boards as the one present in U-Boot are
now always up-to-date.
## ENA FreeBSD Driver Update ##

Contact: Michał Krawczyk <mk@semihalf.com>

Link:	 [ENA README](https://github.com/amzn/amzn-drivers/blob/master/kernel/fbsd/ena/README)

ENA (Elastic Network Adapter) is the smart NIC which is used in the virtualized
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
## FreeBSD Graphics Team status report ##

Contact: FreeBSD Graphics Team, <x11@freebsd.org>, Niclas Zeising <zeising@freebsd.org>

Link:	 [Project GitHub page](https://github.com/FreeBSDDesktop)

The FreeBSD X11/Graphics team is responsible for the lower levels of the FreeBSD
grpahics stack.  This includes graphics drivers, graphics libraries such as the
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
can be resonably assured that updates won't cause regressions.

People who are interested in helping out can find us on the x11@FreeBSD.org
mailing list, or on our gitter chat: https://gitter.im/FreeBSDDesktop/Lobby.  We
are also available in #freebsd-xorg on EFNet.

We also have a team area on GitHub where our work repositories can be found:
https://github.com/FreeBSDDesktop
## HardenedBSD 2018Q3 Update

Contact: Shawn Webb <shawn.webb@hardenedbsd.org>

Our last report was [June
2017](https://www.freebsd.org/news/status/report-2017-04-2017-06.html#HardenedBSD).
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

1. [r339047](https://svnweb.freebsd.org/base?view=revision&revision=339047)
1. [r338221](https://svnweb.freebsd.org/base?view=revision&revision=338221)
1. [r337993](https://svnweb.freebsd.org/base?view=revision&revision=337993)
1. [r337947](https://svnweb.freebsd.org/base?view=revision&revision=337947)

We taught `bhyve(8)` how to live in a [jailed
environment](https://reviews.freebsd.org/rS337023), allowing users to
jail the hypervisor. We hardened the virtual address space of
`bhyve(8)` by using [guard pages](https://reviews.freebsd.org/rS338511).
This work made it upstream to FreeBSD. We are grateful to those in
FreeBSD who provided insight to increase the quality and efficiency
of our patches.
## ifuncs ##
Contact: Konstantin Belousov, <kib@freebsd.org>,
	Ed Maste <emaste@freebsd.org>, Mark Johnston <markj@freebsd.org>,
	Mateusz Guzik <mjg@freebsd.org>
Link:	 None

Ifunc is a special construct in the ELF infrastructure, which allows
the selection of the implementation for the given symbol at the
runtime, when the ELF module gets the final relocations applied.  The
selection is governed by the small piece of user provided code,
attached to the symbol, so called resolver function.  Ifuncs provide
the very convenient way to select machine-specific implementation of
the parts of the code, without uglyness and unsafety of the
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

- context switching code, instead of huge number of runtime checks
  (PTI vs non-PTI, PCID or not, is INVPCID instruction supported for
  PCID) now uses set of mode-specific routines, see
  pmap_activate_sw().  Besides removing checks at runtime, it also
  makes the code much more cleanly structured and readable.

- TLB and cache flush implementation.

- memcpy/memmove, copyin/copyout variants selection for ERMS and SMAP.

- FPU state save and restore, depending on the support for AVX or not,
  this is also used on i386.

For amd64 userspace, we currently use ifunc for optimization of the
TLS base set and get arch-depended functions.

The work was sponsored by The FreeBSD Foundation.
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
## FreeBSD KDE status report ##

Contact: Adriaan de Groot <adridg@FreeBSD.org>, Tobias C. Berner <tcberner@FreeBSD.org>

Link:	 [KDE FreeBSD](https://freebsd.kde.org/)

KDE FreeBSD is responsible for the ports of the Plasma5 and KDE4 desktops, and
all associated applications. Further we also manage the Qt4 and Qt5 ports, as
well as cmake.

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

Further we have been keeping cmake and Qt5 and almost every other port under our
control up to date. SDDM has been updated to the next-to-latest release with
backported security fixes.

One big issue we have is www/qt5-webengine, which requires too much time to keep
up to date, as the underlying chromium is in need of many patches, which change 
with every release. Another upcoming issue is the way in which FreeBSD's libinput
lags behind. This blocks future updates to KDE Plasma as well as Wayland 
improvements. Thankfully x11@ is looking at this issue already, so it should be
fixed soon -- for the meantime people who want to give the latest KDE Plasma
Desktop a try can use the appropriate branch from our github.

People who are willing to contribute can find us on #kde-freebsd on freenode,
the kde@FreeBSD.org mailing list. Further we accept pull-requests and
contributions on github.com/freebsd/freebsd-ports-kde.
## LLVM 7.0 - Sanitizers support improvements / Static code analysis ##

Contact: David Carlier <devnexen@gmail.com>

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
## Boot Loader 2018Q4 Update

Contact: Warner Losh <imp@freebsd.org>, Kyle Evans <kevans@freebsd.org>, Toomas Soome <tsoome@Freebsd.org>

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
did. Where there was ambiguity in the spec, or where the FORTH scirpts
were more forgiving that was strictly documented, every effort has
been made to improve the documentation and follow the old FORTH
behavior, or document the new behavior where the old behavior was
clearly a bug.

It's anticpated that no further changes to the FORTH loader or the
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
something else in the environemnt that are being investigated. We hope
to understand the problems well enough to provide a fix for FreeBSD
12.0.

Ian Lepore has reworked the GELI support so that it is MI and can be
used on any architecture we support.

There's also efforts underway to bring signed image support, improved
crypto booting options and implement Multiboot 2.0.

## Usermode mapping of PCI BARs ##
Contact: Konstantin Belousov, <kib@freebsd.org>
Link:	 None

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
## Device Mode USB

Contact: Edward Tomasz Napierala, <trasz@FreeBSD.org>

Link:	 [Handbook chapter](https://www.freebsd.org/doc/en_US.ISO8859-1/books/handbook/usb-device-mode.html)

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

## PINE64-LTS Image

Contact: Emmanuel Vadot <manu@FreeBSD.org>

We now produce an image for the PINE64-LTS.
This image works on the PINE64-LTS and the Sopine with Baseboard.
## PocketBeagle Support

Contact: Emmanuel Vadot <manu@FreeBSD.org>, Tom Jones <thj@FreeBSD.org>

Link:	 [Pocket Beagle](https://www.beagleboard.org/pocket)

The Pocket Beagle is the latest member of the BeagleBoard family.
Support for it was added and the Beaglebone image can be used on it directly.
## Ports Collection ##

Contact: René Ladan, <portmgr-secretary@FreeBSD.org</email>

Contact: Ports Management Team, <portmgr@FreeBSD.org>

Link:	[About FreeBSD Ports](https://www.FreeBSD.org/ports/)

Link:	[Contributing to ports](https://www.freebsd.org/doc/en_US.ISO8859-1/articles/contributing/ports-contributing.html)

Link:	[FreeBSD ports monitoring](http://portsmon.freebsd.org/index.html)

Link:	[Ports management Team](https://www.freebsd.org/portmgr/index.html)

Link:	[FreeBSD portmgr (@freebsd_portmgr)](https://twitter.com/freebsd_portmgr/)

Link:	[FreeBSD Ports Management Team)](https://www.facebook.com/portmgr)

Link:	[FreeBSD Ports Management Team)](https://plus.google.com/communities/108335846196454338383)

During the last two quarters, the number of ports grew to just under
34,000.  The number of open PR grew to almost 2,500 with less than 600
of those unassigned. A total of 175 committers made almost 14,200 commits.
Compared to the first quarter, the number of commits dropped by 10% and
the number of PRs grew by 19%.

During the last two quarters, portmgr took five commit bits in for
safekeeping: ian@, nemysis@, daichi@, deichen@, and rea@. We welcomed
John Hixson (jhixson@), Kevin Bowling (kbowling@), Sergey Kozlov
(skozlov@), Fukang Chen (loader@), Gleb Popov (arrowd@),
Mateusz Piotrowski (0mp@), and Jesper Schmitz Mouridsen (jsm@) to the
team. itetcu@ and kevlo@ returned after a hiatus.

During the last two quarters, antoine@ ran 70 exp-runs. Most of them
were for port upgrades, but others include LLD progress, changing the
default port versions, improving support for armv6, armv7, and RISC-V,
removing old base system functionality, new USES,
and better matching pkg-plist with
Makefile options (DOCS and
EXAMPLES).

Three new USES were introduced during the last two quarters:

  * gl replaces the old USE_GL from bsd.port.mk
  * qt-dist, qt:4 and qt:5 replace the old USE_QT from bsd.qt.mk

The default version of PHP was changed from 5.6 to 7.1. The former
version is no longer supported by the developers. Furthermore, the
default versions of Samba and GCC are now respectively 4.7 and 7. The
Xorg ports have been reorganized and there have been changes to
net/openntpd, please read UPDATING if relevant.

Open tasks:
  * The number of commits dropped somewhat over the last two quarters,
    leaving more PRs unresolved. If you can, please pick up some PRs
    and improve everyone's experience.

## FreeBSD on PowerNV (ppc64) ##

Contact: Patryk Duda <pdk@semihalf.com>, Wojciech Macek <wma@FreeBSD.org>, Michal Stanek <mst@semihalf.com>, Nathan Whitehorn <nw@freebsd.org>

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
## Puppet ##

Contact: Puppet Team <puppet@FreeBSD.org>

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

## FreeBSD Release Engineering Team ##

Contact: FreeBSD Release Engineering Team, <re@FreeBSD.org>

Link:	[FreeBSD 12.0-RELEASE schedule](https://www.freebsd.org/releases/12.0R/schedule.html)
Link:	[FreeBSD development snapshots](https://download.freebsd.org/ftp/snapshots/ISO-IMAGES/)

The FreeBSD Release Engineering Team is responsible for setting
and publishing release schedules for official project releases
of FreeBSD, announcing code freezes and maintaining the
respective branches, among other things.

The 11.2-RELEASE cycle started April 20 with the code slush, and continued to
progress througout the rest of the quarter with the code freeze, followed by
three BETA builds and three RC builds, with the final release build announced
June 27.

The FreeBSD Release Engineering Team started the 12.0-RELEASE cycle August 10,
beginning with the code slush.  The code slush followed August 24, with the
*stable/12* branch expected to be created September 21.

However, due to unforseen circumstances related to upstream code that was
deemed necessary to include in 12.0-RELEASE, the schedule needed to be
adjusted several times to account for works-in-progress related to the
upstream code to be compatible with other base system utilities.  At the end
of the quarter, the *stable/12* branch had not been created due to this delay.

Throughout the remainder of the quarter, several development snapshots builds
were released for the *head*, *stable/11*, and *stable/10* branches.

Much of this work was sponsored by the FreeBSD Foundation.


## FreeBSD/RISC-V 2018Q4 update

Contact: Ruslan Bukin <br@freebsd.org>

FreeBSD/RISC-V has been one of the actively supported projects during the past year.

On a compiler front we have upstreamed FreeBSD OS-dependent bits for GNU toolchain. It was updated to GCC 8.1 and Binutils 2.30. FreeBSD packages are available.

FreeBSD Testsuite and required dependencies were successfully built for RISC-V and we did a test run: 152 tests failed out of 5186, which demonstrates a very good result for initial run and reveals areas to work on.

We have added support for compressed ISA extension to KDB debugger and DTrace FBT provider enabling C-compressed kernel and userland by default. The output of disassembling instructions in KDB is looking similar to objdump.

QEMU has updated to latest privilege spec allowing us to bringup FreeBSD on it. The emulation is quite fast: it takes one second only to boot FreeBSD to single-user mode in QEMU: https://www.youtube.com/watch?v=FnWpRBaWF18

Platform-Level Interrupt Controller (PLIC) driver was added. Interrupt support was converted to INTRNG.
PLIC is used in QEMU for virtio network and block devices (full FreeBSD distribution can be booted in QEMU).

Network virtualization support (VIMAGE) was fixed and enabled by default now.

In order to support RocketChip and derivatives we had to work on A(accessed), D(dirty) PTE (page table entry) bits management.
We have successfully tested this on a lowRISC board and it is booting to multiuser just fine. lowRISC UART driver was added.

Superuser-User-Modify (SUM) bit in sstatus register is now used: kernel can access userspace only within certain functions that explicitly handle crossing user/kernel boundary.
## RPI Firmware/DTB/U-Boot Update

Contact: Emmanuel Vadot <manu@FreeBSD.org>, U-Boot mailing list: <uboot@freebsd.org>

The RaspberryPi firmware loads the DTB from the fat partition based on
the model. U-Boot now uses this DTB and pass it to the FreeBSD loader/kernel
instead of using the one it embed.
This allow us to use the RaspberryPi Foundation provided DTB overlays to enable
HATs.
The Overlays can be obtained by installing the rpi-firmware package.

A new u-boot port for the W variant of the RPI0 was commited as u-boot-rpi-0-w.
Some experiments started by trasz@ show that we could maybe produce a generic
image for all armv6 RPI (RPI-B, RPI0 and RPI0W).
## scarab: CLI tool for Bugzilla-related workflows ##

Contact: Oleksandr Tymoshenko, <gonzo@FreeBSD.org>

Link:    [GitHub repo](https://github.com/gonzoua/scarab)

scarab is a CLI tool that makes some of Bugzilla functionality
available from the command line. Normally users interact with the
[bugtracker](https://bugs.freebsd.org/bugzilla/) using web browser
but for certain workflows, Web UI may be more of an obstacle
than help requiring to perform more steps compared to CLI tool.

Bugzilla provides XML-RPC interfaces that can be used for
automation/integration and there are several CLI tools like
[pybugz](https://github.com/williamh/pybugz) that can be used
with bugs.freebsd.org as-is. They are generic one-size-fits-all
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
## Various Documentation Bits ##

Contact: 
- Wiki:
  - wiki-admin@FreeBSD.org
  - #freebsd-wiki @ freenode IRC
- Quarterly reports:
  - Edward Tomasz Napierała, <trasz@FreeBSD.org>
  - Mateusz Piotrowski, <0mp@FreeBSD.org>

Links:	 
- [Wiki Fixit Group Website](https://wiki.freebsd.org/WikiFixitGroup/)

The FreeBSD Wiki used to be a scratch pad for the FreeBSD developers to
organize projects, store notes and publish articles that were about to be added
to the handbook. Recently, however, the FreeBSD wiki started to attract more
and more people from the wider FreeBSD community, which resulted in a change of
the character of the wiki.

As a result we decided to discuss the future of the tools we want to use for
documentation in FreeBSD (one of such discussions was held during BSDCam 2018, 
you may see some notes
[here](https://wiki.freebsd.org/DevSummit/201808/DeveloperTools)). The general
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
