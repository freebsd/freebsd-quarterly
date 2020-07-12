## Git Migration Working Group ##

Link: [Git converstion tooling repo](https://github.com/freebsd/git_conv)
Link: [FreeBSD-git mailing list](https://lists.freebsd.org/mailman/listinfo/freebsd-git)
Link: [Beta doc git repo](https://cgit-beta.FreeBSD.org/doc)
Link: [Beta ports git repo](https://cgit-beta.FreeBSD.org/ports)
Link: [Beta src git repo](https://cgit-beta.FreeBSD.org/src)

Contact: Ed Maste <emaste@FreeBSD.org>  
Contact: Warner Losh <imp@FreeBSD.org>  
Contact: Ulrich Spörlein<uqs@FreeBSD.org>  

Work continues on FreeBSD's migration from Subversion to Git.  Ulrich has
iterated on updates to svn2git in order to improve the fidelity of the
converstion, particularly in regards to vendor (contrib) code updates.
We believe the conversion is now at an acceptible state, but may make minor
adjustments if additional issues are found.  We expect to push modifications
to the converter every two weeks.  This means that commit hashes in the beta
repo will remain stable for at least two weeks at a time, to allow others to
test and experiment with the beta repo.

We are now working on updating FreeBSD processes and documentation.
This includes:
 - Writing a Git Primer, akin to the existing Subversion primer
 - Updates to the Security Team's tools and processes
 - Release engineering updates
 - Ports and packages process updates

Those with an interest in the migration to Git are encouraged to subscribe
to the
[FreeBSD-git mailing list](https://lists.freebsd.org/mailman/listinfo/freebsd-git)
and test out the beta src, ports, and/or doc repositories.

Sponsor: The FreeBSD Foundation (in part)
