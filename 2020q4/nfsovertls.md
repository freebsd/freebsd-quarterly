## NFS over TLS implementation ##

Contact: Rick Macklem, <rmacklem@freebsd.org>  

In an effort to improve NFS security, an Internet Draft titled
"Towards Remote Procedure Call Encryption By Default" specifies
use of TLS 1.3 to encrypt all data traffic on a Sun RPC
connection used for NFS.

Although NFS has been able to use sec=krb5p to encrypt data
on the wire, this requires a Kerberos environment and, as
such, has not been widely adopted.
It also required that
encryption/decryption be done in software, since only the
RPC message NFS arguments are encrypted.
Since Kernel TLS is capable of using hardware assist to
improve performance and does not require Kerberos, NFS
over TLS may be more widely adopted, once implementations
are available.

The coding for this project has now been completed.
All required changes to the NFS and kernel RPC code have
been committed to the head/current kernel and will be in FreeBSD13.
The daemons can now be built from a port that depends
upon the security/openssl-devel port of Openssl3 that
includes patches for support of the ktls.
The port for the daemons is called sysutils/nfs-over-tls
and should be committed to /usr/ports soon.
In the meantime, the port can easily be fetched,
as described in
https://people.freebsd.org/~rmacklem/nfs-over-tls-setup.txt.

To support clients such as laptops, the daemons that perform the TLS
handshake may optionally handle client X.509 certificates from a
site local CA.
There are now exports(5) options to require client(s) to
provide a valid X.509 certificate.
The case where a "user" name is stored in the certificate and is used
to map all RPC credentials to that user is probably in violation of
the Internet Draft.
This is only enabled when the "-u" command line
option is provided to rpc.tlsservd(8).

The code is now available for testing. See:
https://people.freebsd.org/~rmacklem/nfs-over-tls-setup.txt
Setting up system(s) for testing still requires building a custom kernel
with "options KERN_TLS" from recent head/FreeBSD13 sources plus installing
the port for the daemons, as explained by the above document.

The main limitation in the current implementation is that it uses TLS1.2
and not TLS1.3, as required by the Internet Draft.
This should change once the KERN_TLS rx patch includes TLS1.3 support.

Third party testing would be appreciated.

