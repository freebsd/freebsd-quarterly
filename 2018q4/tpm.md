## Improving FreeBSD boot security ##

Contact: Michal Stanek, <mst@semihalf.com>, Marcin Wojtas, <mw@semihalf.com>, Kornel Duleba, <mindal@semihalf.com>

Link:	 [TPM 2.0 driver](https://svnweb.freebsd.org/base/head/sys/dev/tpm/tpm20.c?revision=342084&view=markup)
Link:	 [Loader Secure Boot support](https://reviews.freebsd.org/D18798)
Link:	 [Secure Boot library](https://reviews.freebsd.org/D18797)
Link:	 [binsign utility](https://reviews.freebsd.org/D18799)

FreeBSD now supports TPM 2.0 devices. TPM (Trusted Platform Module) is a discrete chip which provides secure computation and secure NVRAM storage. It is most
commonly associated with Measured Boot i.e. providing hash measurements of boot elements such as firmware images and boot configuration to the OS. In FreeBSD,
the TPM can be used to strengthen security of services such as Strongswan IPsec, SSH or TLS by performing cryptographic operations in the TPM chip itself using
embedded keys inaccessible to software. TPM facilities such as secure NVRAM storage, data sealing, random number generation and others are also available to any
software via the IBM TSS library.

UEFI Secure Boot is a technology which provides authentication of images that are executed on the host during boot. This prevents persistence of
unauthorized malicious boot code such as rootkits. UEFI stores a list of allowed and blacklisted certificates and verifies signatures of all boot images and
UEFI applications before they are executed on the CPU. Semihalf has developed support for X509 certificates and signature
verification code in EFI loader with the help of the minimal BearSSL library. Lists of allowed and forbidden certificates are retrieved from UEFI environmental
variables. This allows users to sign kernel binaries with a self-signed certificate, append the signature and let the loader verify its authenticity.

UEFI Secure Boot support code will most likely be integrated with sjg's Veriexec support which is currently being reviewed on Phabricator.

Semihalf is also working on improving security of Veriexec by moving manifest signature verification to the kernel.

Work sponsored by: Stormshield
