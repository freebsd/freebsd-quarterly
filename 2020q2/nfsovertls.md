## NFS over TLS implementation ##

Contact: Rick Macklem, <rmacklem@freebsd.org>  

In an effort to improve NFS security, an internet draft
which I expect will become an RFC soon specifies the
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

The project to implement this has largely been completed.
The code will slowly be merged into head/current and at least
the kernel portion should be in FreeBSD-13.

To support clients such as laptops, the daemons that perform the TLS
handshake may optionally handle client X.509 certificates from a
site local CA. There are now exports(5) options to require client(s) to
provide a valid X.509 certificate.

The code is now available for testing. See:
https://people.freebsd.org/~rmacklem/nfs-over-tls-setup.txt
Setting up system(s) for testing is still a little awkward, as explained
by the above rough document.

The main limitation in the current implementation is that it uses TLS1.2
and not TLS1.3. This should change once the KERN_TLS rx patch includes
TLS1.3 support.
Also, testing of pNFS configurations has not yet been done, but will
be tested soon.

Third party testing would be appreciated.

