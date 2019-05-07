## Continuous Integration ##

Contact: Jenkins Admin, <jenkins-admin@FreeBSD.org>  
Contact: Li-Wen Hsu, <lwhsu@FreeBSD.org>  

Link: [FreeBSD Jenkins Instance](https://ci.FreeBSD.org)  
Link: [FreeBSD CI artifact archive](https://artifact.ci.FreeBSD.org/)  
Link: [FreeBSD Jenkins wiki](https://wiki.freebsd.org/Jenkins)  
Link: [freebsd-testing Mailing List](https://lists.FreeBSD.org/mailman/listinfo/freebsd-testing)  
Link: [freebsd-ci Repository](https://github.com/freebsd/freebsd-ci)  
Link: [Tickets related to freebsd-testing@](https://preview.tinyurl.com/y9maauwg)  
Link: [Hosted CI wiki](https://wiki.freebsd.org/HostedCI)  
Link: [FreeBSD CI weekly report](https://hackfoldr.org/freebsd-ci-report/)  

The FreeBSD CI team maintains continuous integration system and
related tasks for the FreeBSD project.  The CI system regularly
checks the changes committed to the project's Subversion repository
can be successfully built, and performs various tests and analysis
of the results.  The results from build jobs are archived in an
artifact server, for the further testing and debugging needs.  The
CI team members examine the failing builds and unstable tests, and
work with the experts in that area to fix the code or adjust test
infrastructure.

Starting from this quarter, we started to publish CI weekly report at
[freebsd-testing@](https://lists.freebsd.org/mailman/listinfo/freebsd-testing)
mailing list.  The archive is available at
https://hackfoldr.org/freebsd-ci-report/

We also worked on extending test executing environment
to improve the code coverage, temporarily disabling flakey test cases,
and opening tickets to work with domain experts.  The details are
of these efforts are available in the weekly CI reports.

We published the
[draft FCP for CI policy](https://github.com/freebsd/fcp/blob/master/fcp-20190401-ci_policy.md)
and are ready to accept comments.

Please see freebsd-testing@ related tickets for more information.

Work in progress:
  * Fixing the failing test cases and builds
  * Adding drm ports building test against -CURRENT
  * Implementing automatic tests on bare metal hardware
  * Implementing the embedded testbed
  * Planning for running ztest and network stack tests
  * Help more 3rd software get CI on FreeBSD through a hosted CI solution
