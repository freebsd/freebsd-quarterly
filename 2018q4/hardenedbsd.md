## HardenedBSD 2018Q4 Update

* Contact: Shawn Webb <shawn.webb@hardenedbsd.org>
* URL: https://hardenedbsd.org/

### Introduction to HardenedBSD

HardenedBSD is a security-enhanced fork of FreeBSD that aims to
provide the BSD community with a clean-room reimplementation of the
publicly-documented parts of the grsecurity patchset for Linux. We
maintain close compatibility with FreeBSD by syncing every six hours
with FreeBSD.

### HardenedBSD Foundation Update

Through a generous donations by DEF CON, the computer security
conference held each year in Las Vegas, and an anonymous member of the
community, the HardenedBSD Foundation was able to provide the
HardenedBSD project with a new Cavium ThunderX2 server. HardenedBSD
has been working closely with FreeBSD's and Cavium's Jayachandran
(jchandra@freebsd) to gain working support for the ThunderX2. As soon
as the ThunderX2 becomes functional, HardenedBSD will be able to
support both 12-STABLE and 13-CURRENT for arm64.

We assisted OPNsense's migration from FreeBSD to HardenedBSD as the
base operating system. OPNsense's January 2019 release (19.1) will
complete the migration. Further work will be done to enable
HardenedBSD's PaX NOEXEC implementation in OPNsense. PaX NOEXEC is a
strong form of W^X, which prevents memory allocations from being both
writable and executable, and toggling between the two.

The HardenedBSD Foundation Corp is a registered 501(c)(3) tax-exempt
not-for-profit charitable organization in the United States. We look
forward to a productive 2019, with work to support Cross-DSO CFI still
ongoing.

### HardenedBSD 12-STABLE Released

In December 2018, HardenedBSD published is first official release of
[12-STABLE](https://hardenedbsd.org/article/op/2018-12-17/stable-release-hardenedbsd-stable-12-stable-v1200058).
From the release announcement:

Improvements in 12-STABLE from 11-STABLE:

* Non-Cross-DSO Control-Flow Integrity (CFI) for applications on
  amd64 and arm64. At this time, CFI is not applied to the kernel.
  More info on CFI is below.
* Jailed bhyve (upstreamed to FreeBSD)
* Per-jail toggles for unprivileged process debugging (the
  `security.bsd.unprivileged_process_debug` sysctl node. Upstreamed
  to FreeBSD.)
* Spectre v2 mitigation with retpoline applied to the entirety of
  base and ports (with only a few ports opting out.)
* Symmetric Multi-Threading (SMT) disabled by default (re-enable by
  setting `machdep.hyperthreading_allowed` to 1 in loader.conf(5)).
* Migration of more compiler toolchain components to llvm's
  implementations (llvm-ar, llvm-nm, and llvm-objdump).
* Compilation of applications with Link-Time Optimization (LTO).

#### Non-Cross-DSO CFI

Non-Cross-DSO CFI is an exploit mitigation technique that helps
prevent attackers from modifying the behavior of a program and
jumping to undefined or arbitrary memory locations. Microsoft has
implemented a variant of CFI, which they term Control Flow Guard,
or CFG. The PaX team has spent the last few years perfecting their
Reuse Attack Protector, RAP. CFI, CFG, and RAP all attempt to
accomplish the same goal, with RAP being the most complete and
effective implementation. Clang's CFI is stronger than Microsoft's
CFG and PaX Team's RAP is stronger than both CFI and CFG. RAP would
be a great addition to HardenedBSD; however, it requires a GPLv3
toolchain and is patented.

Clang's CFI requires a linker that supports Link-Time Optimization
(LTO). HardenedBSD 12-STABLE ships with lld as the default linker.
All CFI schemes have been enabled for nearly all applications in
base. Please note that any application that calls function pointers
resolved via dlopen + dlsym will require the cfi-icall scheme to be
disabled.

HardenedBSD is the first enterprise operating system to apply
Non-Cross-DSO CFI broadly to userland.
