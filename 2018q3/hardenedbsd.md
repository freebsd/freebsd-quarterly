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

We taught `bhyve(8)` how to live in a jailed environment, allowing
users to jail the hypervisor. We hardened the virtual address space of
`bhyve(8)` by using guard pages. This work made it upstream to
FreeBSD. We are grateful to those in FreeBSD who provided insight to
increase the quality and efficiency of our patches.
