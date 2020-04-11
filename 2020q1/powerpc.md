## FreeBSD/powerpc Project ##

Contact:  Mark Linimon <linimon@FreeBSD.org>
Contact:  Justin Hibbits <jhibbits@FreeBSD.org>
Contact:  Piotr Kubaj <pkubaj@FreeBSD.org>

The FreeBSD/powerpc project continues to mature.

In addition to the above listed people, we want to acknowledge
contributions from adalava, bdragon, luporl, and mikael, among
others.

Key points:

  * On -CURRENT, all platforms have been switched to the
    LLVM 10.0 compiler and lld10.  Thus, ld.bfd has been removed
    from base.
  * On powerpc64, -CURRENT has been switched to the ELFv2 ABI.
    Older versions of -CURRENT that either used GCC, or LLVM with
    the ELFv1 ABI, are no longer supported.
  * On powerpc64 FreeBSD-STABLE (11 and 12), the platforms still
    remain on the antique gcc4.2.1 in base.  Note: that version of
    GCC has been removed from the -CURRENT src tree.  Support for
    this configuration is now a "best-effort" status.
  * On powerpc (32-bit), the ABI did not change as with powerpc64,
    so upgrading should be easier than with powerpc64.

Hardware status:

  * The aacraid(4) driver has been been fixed for big-endian, thanks
    to luporl.  This means that Talos customers who got the SAS option
    can now use the onboard SAS.
  * The ixl(4) driver has also been fixed for big-endian, also thanks
    to luporl.

Software status:

  * As a result of -CURRENT switching to LLVM/ELFv2, ifuncs became
    available, meaning that we now have optimized memcpy/bcopy and
    strncpy functions when running on processors that supports VSX
    instructions.
  * powerpc64 is now able to run on QEMU without the need of
    Huge Pages support.
  * The virtio drivers have been fixed.
  * kernel minidump has been fixed.

Package status:

  * A FreeBSD.org package set is available for powerpc64/12
    (quarterly).  The -quarterly build has just been rebased
    from 12.0 to 12.1, per the desupport of the older 12.0.
    The first rebased build has been completed, with 29776
    packages being available.
  * We are currently working on the upgrade of the package
    builder to a recent -CURRENT.  Therefore, the available
    packages for -CURRENT are still ELFv1, which are not useful.
    Please contact Mark Linimon for more information.
  * mesa has been switched to llvm90, which fixes certain
    problems.
  * Work continues on firefox and related ports.
  * More ports fixes are being committed every day.

The team would like to thank IBM for the loan of two POWER8 and one
POWER9 machines, and Oregon State University (OSU) for providing the
hosting.  As well, we would like to thank the clusteradm team for
keeping the Tyan POWER8 machines online that are hosted at
[NYI](https://www.nyi.net).

Also, Piotr would like to thank the FreeBSD Foundation for
funding his personal Talos, and Raptor (via its IntegriCloud
subsidiary) for loaning a server on which talos.anongoth.pl runs.
