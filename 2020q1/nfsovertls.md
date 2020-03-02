## NFS over TLS implementation ##

Contact: Rick Macklem, <rmacklem@freebsd.org>

In an effort to improve NFS security, an internet draft
which I expect will become and RFC soon specifies the
use of TLS 1.3 to encrypt all data traffic on a Sun RPC
connection used for NFS.

Although NFS has been able to use sec=krb5p to encrypt data
on the wire, this requires a Kerberos environment and, as
such, has not been widely adopted. It also required that
encryption/decryption be done in software, since only the
RPC message NFS arguments are encrypted.
Since Kernel TLS is capable of using hardware assist to
improve performance and does not require Kerberos, NFS
over TLS may be more widely adopted, once implementations
are available.

Since FreeBSD's kernel TLS requires that data be in ext_pgs
mbufs for transmission, most of the work so far has been
modifying the NFS code that builds the protocol arguments
to optionally use ext_pgs mbufs.
Coding changes to handle received ext_pgs mbufs has also
been done, although this may not be required by the receive
kernel TLS.

The kernel RPC has also been modified to do the STARTTLS
Null RPC and to do upcalls to userland daemons that
perform the SSL_connect()/SSL_accept(), since the kernel
TLS does not do this initial handshake.
So far only a self signed certificate on the server,
with no requirement for the client to have a certificate
has been implemented.

Work is still needed to be done for the case where the NFS
client is expected to have a signed certificate. In particular,
it is not obvious to me what the correct solution is for
clients that do not have a fixed IP address/DNS name.
The code now is about ready for testing, but requires that
the kernel TLS be able to support receive as well as transmit.
Patches to the kernel TLS for receive are being worked on
by jhb@freebsd.org.

Once receive side kernel TLS becomes available, the code in
subversion under base/projects/nfs-over-tls will need third
party testing and a security evaluation by someone familiar
with TLS.
