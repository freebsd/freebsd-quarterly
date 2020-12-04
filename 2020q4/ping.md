## Dual-stack ping command ##

Contact: Alan Somers <asomers@FreeBSD.org>  

The venerable ping command has until now only supported IPv4.  A separate
utility, ping6, was originally written by WIDE as a research tool to develop
IPv6.  As a research tool, it didn't need IPv4 support, but since then, it's
been put to practical use by countless developers and sysadmins everywhere.

The ping/ping6 split has been a perennial complaint.  It's annoying that two
separate commands are needed, even though they do almost exactly the same
thing.  This quarter, I merged Ján Sučan's GSoC work, which merged the two
commands.  Now ping can handle either protocol, based on the -4 and -6
switches, or based on the format of the target.  A ping6 hard link is provided
for backwards compatibility.

Sponsor: Google Summer of Code  
