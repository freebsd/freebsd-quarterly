## Git Migration Working Group ##

Link: [Git conversion tooling repo](https://github.com/freebsd/git_conv)  
Link: [FreeBSD-git mailing list](https://lists.freebsd.org/mailman/listinfo/freebsd-git)  
Link: [Beta doc git repo](https://cgit-beta.FreeBSD.org/doc)  
Link: [Beta ports git repo](https://cgit-beta.FreeBSD.org/ports)  
Link: [Beta src git repo](https://cgit-beta.FreeBSD.org/src)  

Contact: Ed Maste <emaste@FreeBSD.org>  
Contact: Warner Losh <imp@FreeBSD.org>  
Contact: Ulrich Spörlein <uqs@FreeBSD.org>  

Work continues on FreeBSD's migration from Subversion to Git.  Ulrich has
addressed all known issues with svn2git and has been able to work around the
inconsistent metadata and forced commit issues in the Subversion history.

We still have additional documentation to write, and need to finish installing
commit hooks (e.g. restricting branch creation, or ensuring appropriate data
exists on cherry-pick commits).

We expect to open the beta repository to test commits before the end of
October.  This is to allow testing of the commit hooks, and to allow developers
to test access and become familiar with git operation.  Commits in this
repository will be deleted and the repository will be recreated at least once
prior to the final migration.

Those with an interest in the migration to Git are encouraged to subscribe
to the
[FreeBSD-git mailing list](https://lists.freebsd.org/mailman/listinfo/freebsd-git)
and test out the beta src, ports, and/or doc repositories.

You are also welcome check out the wiki, issues, README and other documentation
at the [Git conversion tooling repo](https://github.com/freebsd/git_conv).

We currently expect to transition the src and doc repositories in mid-November.
Additional investigation and experimentation with the ports repository is still
underway.

Sponsor: The FreeBSD Foundation (in part)
