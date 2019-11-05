## TPM2 Software Stack (TSS2) ##

Contact: D Scott Phillips <scottph@FreeBSD.org>

Link: [tpm2-tss Documentation](https://tpm2-tss.readthedocs.io/en/latest/index.html)
Link: [tpm2 Source Repository](https://github.com/tpm2-software/)
Link: [tpm2 mailing list](https://lists.01.org/postorius/lists/tpm2.lists.01.org/)
Link: [tpm2 irc channel](ircs://chat.freenode.net:6697/tpm2.0-tss)

Intel has contributed ports of the TPM2 Software Stack to the ports tree, with
the new ports securtity/tpm2-tss, security/tpm2-tools, security/tpm2-abrmd.
`tpm2-tss` contains a set of libraries which expose various TPM2 APIs for using
a TPM conforming to the TCG TPM 2.0 specification. `tpm2-tools` provides a set
of command line tools which use the `tpm2-tss` libraries to perform tpm
operations. Finally, `tpm2-abrmd` is a userspace daemon which acts as a TPM
Access Broker and Resource Manager, multiplexing many TPM users onto a single
TPM device.

Sponsored by:	Intel Corporation
