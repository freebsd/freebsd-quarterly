## Continuous Integration ##

Link: [FreeBSD Jenkins Instance](https://ci.FreeBSD.org)  
Link: [FreeBSD Hardware Testing Lab](https://ci.FreeBSD.org/hwlab)  
Link: [FreeBSD CI artifact archive](https://artifact.ci.FreeBSD.org)  
Link: [FreeBSD CI weekly report](https://hackmd.io/@FreeBSD-CI)  
Link: [freebsd-testing Mailing List](https://lists.FreeBSD.org/mailman/listinfo/freebsd-testing)  
Link: [FreeBSD Jenkins wiki](https://wiki.freebsd.org/Jenkins)  
Link: [Hosted CI wiki](https://wiki.freebsd.org/HostedCI)  
Link: [3rd Party Software CI](https://wiki.freebsd.org/3rdPartySoftwareCI)  
Link: [Tickets related to freebsd-testing@](https://preview.tinyurl.com/y9maauwg)  
Link: [FreeBSD CI Repository](https://github.com/freebsd/freebsd-ci)  

Contact: Jenkins Admin <jenkins-admin@FreeBSD.org>  
Contact: Li-Wen Hsu <lwhsu@FreeBSD.org>  

The FreeBSD CI team maintains continuous integration system and related tasks
for the FreeBSD project.  The CI system regularly checks the committed changes
can be successfully built, then performs various tests and analysis of the
results.  The results from build jobs are archived in an artifact server, for
the further testing and debugging needs.  The CI team members examine the
failing builds and unstable tests, and work with the experts in that area to
fix the code or adjust test infrastructure.  The details are of these efforts
are available in the [weekly CI reports](https://hackmd.io/@FreeBSD-CI).

During the fourth quarter of 2019, we worked with the contributors and
developers in the project for their testing needs and also worked with many
external projects and companies to improve their support of FreeBSD.  The
[FreeBSD Hardware Testing Lab](https://ci.freebsd.org/hwlab) is online in this
quarter.  It's still in work in progress stage and we are merging the different
versions and will integrate more tightly to the main CI server.  We are also
working on make this work more easierly to be reproduced.

Work in progress:
  * Collecting and sorting CI tasks and ideas at https://hackmd.io/bWCGgdDFTTK_FG0X7J1Vmg
  * Setup the CI stage environment and put the experimental jobs on it
  * Implementing automatic tests on bare metal hardware
  * Adding drm ports building test against -CURRENT
  * Testing and merging pull requests at https://github.com/freebsd/freebsd-ci/pulls
  * Planning for running ztest and network stack tests
  * Helping more 3rd software get CI on FreeBSD through a hosted CI solution
  * Adding LTP test jobs.
  * Adding non-x86 test jobs.
  * Adding external toolchin related jobs.

Please see freebsd-testing@ related tickets for more WIP information.

Sponsor: The FreeBSD Foundation
