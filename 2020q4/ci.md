## Continuous Integration ##

Link: [FreeBSD Jenkins Instance](https://ci.FreeBSD.org)  
Link: [FreeBSD Hardware Testing Lab](https://ci.FreeBSD.org/hwlab)  
Link: [FreeBSD CI artifact archive](https://artifact.ci.FreeBSD.org)  
Link: [FreeBSD CI weekly report](https://hackmd.io/@FreeBSD-CI)  
Link: [FreeBSD Jenkins wiki](https://wiki.freebsd.org/Jenkins)  
Link: [Hosted CI wiki](https://wiki.freebsd.org/HostedCI)  
Link: [3rd Party Software CI](https://wiki.freebsd.org/3rdPartySoftwareCI)  
Link: [Tickets related to freebsd-testing@](https://preview.tinyurl.com/y9maauwg)  
Link: [FreeBSD CI Repository](https://github.com/freebsd/freebsd-ci)  

Contact: Jenkins Admin <jenkins-admin@FreeBSD.org>  
Contact: Li-Wen Hsu <lwhsu@FreeBSD.org>  
Contact: [freebsd-testing Mailing List](https://lists.FreeBSD.org/mailman/listinfo/freebsd-testing)  
Contact: IRC #freebsd-ci channel on EFNet  

The FreeBSD CI team maintains the continuous integration system
of the FreeBSD project.  The CI system firstly checks the committed changes
can be successfully built, then performs various tests and analysis over the
newly built results.
The artifacts from those builds are archived in the artifact server for
further testing and debugging needs.  The CI team members examine the
failing builds and unstable tests and work with the experts in that area to
fix the codes or adjust test infrastructure.  The details of these efforts
are available in the [weekly CI reports](https://hackmd.io/@FreeBSD-CI).

During the fourth quarter of 2020, we continued working with the contributors and
developers in the project to fulfill their testing needs and also keep
collaborating with external projects and companies to improve their products
and FreeBSD.

Important changes:

  * doc jobs are chnage to use git to follow VCS migration:
    * https://ci.freebsd.org/job/FreeBSD-doc-main/
    * https://ci.freebsd.org/job/FreeBSD-doc-main-igor/
    Thanks Brandon Bergren (bdragon@)
  * head and stable/12 build environment have been upgrade to 12.2-RELEASE

New jobs added:
  * [LINT kernel of head on riscv64](https://ci.freebsd.org/job/FreeBSD-head-riscv64-LINT)

Work in progress:
  * Follow VCS migration, change src jobs to use Git. PRs are available:
    https://github.com/freebsd/freebsd-ci/pull/121
    Thanks Brandon Bergren (bdragon@)
  * Collecting and sorting CI tasks and ideas
    [here](https://hackmd.io/@FreeBSD-CI/freebsd-ci-todo).
  * Testing and merging pull requests in the
    [the FreeBSD-ci repo](https://github.com/freebsd/freebsd-ci/pulls).
  * Designing and implementing pre-commit CI building and testing.
  * Reduce the procedures of CI/test environment setting up for contributors and
    developers.
  * Setting up the CI stage environment and putting the experimental jobs on it.
  * Setting up public network access for the VM guest running tests.
  * Implementing automatic tests on bare metal hardware.
  * Adding drm ports building tests against -CURRENT.
  * Planning to run ztest and network stack tests.
  * Adding more external toolchain related jobs.
  * Improving the hardware lab to be more mature and adding more hardware.
  * Helping more software get FreeBSD support in their CI pipelilne
    Wiki pages: [3rdPartySoftwareCI](https://wiki.freebsd.org/3rdPartySoftwareCI),
    [HostedCI](https://wiki.freebsd.org/HostedCI)
  * Working with hosted CI providers to have better FreeBSD support.
 * The build and test results will be sent to the
   [dev-ci mailing list](https://lists.freebsd.org/mailman/listinfo/dev-ci)
   soon. Feedback and help with analysis is very appreciated!

Please see freebsd-testing@ related tickets for more WIP information, and don't hesitate to join the effort!

Sponsor: The FreeBSD Foundation
