## Continuous Integration ##

Link: [FreeBSD Jenkins Instance](https://ci.FreeBSD.org)  
Link: [FreeBSD CI artifact archive](https://artifact.ci.FreeBSD.org/)  
Link: [FreeBSD Jenkins wiki](https://wiki.freebsd.org/Jenkins)  
Link: [freebsd-testing Mailing List](https://lists.FreeBSD.org/mailman/listinfo/freebsd-testing)  
Link: [FreeBSD CI Repository](https://github.com/freebsd/freebsd-ci)  
Link: [Tickets related to freebsd-testing@](https://preview.tinyurl.com/y9maauwg)  
Link: [Hosted CI wiki](https://wiki.freebsd.org/HostedCI)  
Link: [FreeBSD CI weekly report](https://hackmd.io/@FreeBSD-CI)  

Contact: Jenkins Admin <jenkins-admin@FreeBSD.org>  
Contact: Li-Wen Hsu <lwhsu@FreeBSD.org>  

The FreeBSD CI team maintains continuous integration system and related tasks
for the FreeBSD project.  The CI system regularly checks the committed changes
can be successfully built, then performs various tests and analysis of the
results.  The results from build jobs are archived in an artifact server, for
the further testing and debugging needs.  The CI team members examine the
failing builds and unstable tests, and work with the experts in that area to
fix the code or adjust test infrastructure.  The details are of these efforts
are available in the weekly CI reports.

We had a testing working group at the [201909 DevSummit](https://wiki.freebsd.org/DevSummit/201909)
lwhsu@ has presented the Testing/CI project status and "how to work with the FreeBSD CI system", slides are available at the DevSummit page.
Some contents have been migrated to https://wiki.freebsd.org/Jenkins/Debug , extending is welcomed.

We continue publishing CI Weekly Report and moved the archive to https://hackmd.io/@FreeBSD-CI

Work in progress:
  * Collecting and sorting CI tasks and ideas at https://hackmd.io/bWCGgdDFTTK_FG0X7J1Vmg
  * Setup the CI stage environment and put the experimental jobs on it
  * Extending and publishing the embedded boards testbed
  * Implementing automatic tests on bare metal hardware
  * Adding drm ports building test against -CURRENT
  * Testing and merging pull requests at https://github.com/freebsd/freebsd-ci/pulls
  * Planning for running ztest and network stack tests
  * Help more 3rd software get CI on FreeBSD through a hosted CI solution

Please see freebsd-testing@ related tickets for more WIP information.

Sponsor: The FreeBSD Foundation
