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

The FreeBSD CI team maintains continuous integration system and related tasks
for the FreeBSD project.  The CI system regularly checks the committed changes
can be successfully built, then performs various tests and analysis of the
results.  The results from build jobs are archived in an artifact server, for
the further testing and debugging needs.  The CI team members examine the
failing builds and unstable tests, and work with the experts in that area to
fix the code or adjust test infrastructure.  The details are of these efforts
are available in the weekly CI reports.

The
[FCP for CI policy](https://github.com/freebsd/fcp/blob/master/fcp-20190401-ci_policy.md)
is in "feedback" state, please provide any comments to freebsd-testing@ or
other suitable lists.

We had a testing working group in [201905 DevSummit](https://wiki.freebsd.org/DevSummit/201905/TestingCI)

Please see freebsd-testing@ related tickets for more information.

Work in progress:
  * Fixing the failing test cases and builds
  * Adding drm ports building test against -CURRENT
  * Adding powerpc64 tests job: (https://github.com/freebsd/freebsd-ci/pull/33)
  * Implementing automatic tests on bare metal hardware
  * Extending and publishing the embedded testbed
  * Planning for running ztest and network stack tests
  * Help more 3rd software get CI on FreeBSD through a hosted CI solution
