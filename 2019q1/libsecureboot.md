## FreeBSD boot security improvements ##

Contact: Michal Stanek, <mst@semihalf.com>, Marcin Wojtas, <mw@semihalf.com>, Kornel Duleba, <mindal@semihalf.com>  

Link:	 [Veriexec manifest verification in kernel](https://svnweb.freebsd.org/changeset/base/345830)  
Link:	 [TPM as entropy source](https://svnweb.freebsd.org/changeset/base/345438)  
Link:	 [UEFI support in libsecureboot](https://svnweb.freebsd.org/changeset/base/344840)  

FreeBSD gained TPM 2.0 (Trusted Platform Module) support at the end
of 2018.  A kernel configuration option, TPM_HARVEST, was also added
to use the TPM RNG as system entropy source.  When used this way,
the TPM can be harvested every ten seconds for entropy which is
mixed into the OS entropy pool.  The kernel option is currently
disabled by default in amd64 GENERIC kernel configuration.

UEFI Secure Boot support, developed by Semihalf, has been merged
with sjg's Veriexec support, resulting in a unified library named
libsecureboot.  This library is used for verification of kernel and
modules by the loader. The library uses BearSSL as the cryptographic
backend.  The library supports loading trusted and blacklisted
certificates from UEFI (DB/DBx databases) and can use them as trust
anchors for the verification.

The library is also used by Veriexec to verify and parse the manifest
[XXX what  manifest?] in the kernel. Previously the manifest was
verified and parsed by a userspace application, then sent to the
kernel via /dev/veriexec, which was a significant limitation and a
security weakness.

To do:

* Backport to stable branches.

Work sponsored by: Stormshield

Special thanks to sjg and Juniper for fruitful cooperation around
Veriexec and the libsecureboot development.
