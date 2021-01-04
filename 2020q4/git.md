## Git Migration Working Group ##

Link: [src (base system) git repo](https://cgit.FreeBSD.org/src)  
Link: [doc git repo](https://cgit.FreeBSD.org/doc)  
Link: [Beta ports git repo](https://cgit-dev.FreeBSD.org/ports)  
Link: [Warner's git documentation repo](https://github.com/bsdimp/freebsd-git-docs)
Link: [FreeBSD-git mailing list](https://lists.freebsd.org/mailman/listinfo/freebsd-git)  
Link: [Git conversion tooling repo](https://github.com/freebsd/git_conv)  
Link: [Game of Trees](http://gameoftrees.org/)
Link: [gitup](https://github.com/johnmehr/gitup)

The Git working group largely completed the migration of the doc and src
(base system) trees from Subversion to Git in December 2020.  We are currently
working on some minor outstanding issues and preparing for the ports tree
migration.

We set up new hosts to serve as the Git repositories and mirrors, and developed
commit hooks for restrictions on commits to various branches, generation of
commit mail, and similar needs.

The doc tree migration occurred on December 8th and 9th.  After the conversion
some minor changes to the documentation build infrastructure were necesary.

The src tree migration occurred between December 20th and 23rd for the main
branch; some additional tasks occurred over the next week or so.  These
included enabling the stable branches, vendor (contrib) code updates, and
the git->svn gateway.  We are translating stable branch commits to Subversion
for the stable/11 and stable/12 branches and associated release branches.  This
allows FreeBSD users who follow stable branches or releases to continue using
existing processes and tooling.

An experimental Git conversion of the ports tree is available at the link
above.  There are some unique challenges in the ports tree (that do not impact
the doc or src repos in the same way), so additional work is ongoing.  The
window for migrating the ports tree is immediately prior to a quarterly
branch, so we anticipate a migration at the end of March 2021.  Over the next
few months testing of the experimental ports repo is very welcome.

Process documentation for developer and user interaction with FreeBSD's
repositories is currently available in Warner's GitHub repository at the link
above.  It will be moved to the FreeBSD developer's handbook and/or other
suitable locations following the documentation project's asciidoc conversion.

The working group is experimenting with two permissively-licensed tools that
are compatible with Git servers or repositories.  Game of Trees is a version
control system that is compatible with Git repositories.  It is being developed
by Stefan Sperling along with some OpenBSD developers and other contributions.

John Mehr's gitup is a minimal, dependency-free program that clones and
synchronizes a local tree with a remote repository.  It is intended for use
cases that would otherwise be served by tools like portsnap.

Contact: Li-Wen Hsu <lwhsu@FreeBSD.org>  
Contact: Warner Losh <imp@FreeBSD.org>  
Contact: Ed Maste <emaste@FreeBSD.org>  
Contact: Ulrich Spörlein <uqs@FreeBSD.org>  

Sponsor: The FreeBSD Foundation (in part)
