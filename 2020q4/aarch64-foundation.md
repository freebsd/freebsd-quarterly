## arm64 platform updates ##q

Contact: Mitchell Horne <mhorne@FreeBSD.org>  

In the interest of seeing the arm64 architecture promoted to Tier-1 status, an
effort was undertaken to test building and serving of release and patch-level
updates via `freebsd-update(1)`. The conclusion of this investigation is that
the process works with very few changes required; a small tweak is needed for
the update build scripts, and a minor bugfix in the `bsdiff(1)` utility was
committed. The hope is that the project can begin providing security updates for
the platform with the release of FreeBSD 13.0, removing the requirement that
users compile these updates from source.

Added this quarter was arm64 support for the new `ossl(4)` crypto driver. This
driver provides acceleration of SHA-1 and SHA-2 cryptographic operations by
leveraging OpenSSL's assembly routines. These routines will detect and use
optimized instructions, as supported by the CPU. This support benefits userland
applications via the `cryptodev(4)` device, and in-kernel consumers of the
`crypto(9)` interface, such as the IPSec Authentication Header protocol and
kernel TLS.

Finally, work was done to add the necessary machine-dependent bits for the
kernel's `gdb(4)` interface. This enables remote debugging of the kernel with
`gdb(1)` over a serial line.

Sponsor: The FreeBSD Foundation
