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

The FreeBSD CI team maintains the continuous integration system and related tasks
for the FreeBSD project.  The CI system regularly checks the committed changes
can be successfully built, then performs various tests and analysis of the
results.  The artifacts from the build jobs are archived in the artifact server for
further testing and debugging needs.  The CI team members examine the
failing builds and unstable tests and work with the experts in that area to
fix the codes or adjust test infrastructure.  The details of these efforts
are available in the [weekly CI reports](https://hackmd.io/@FreeBSD-CI).

During the first quarter of 2020, we continue working with the contributors and developers in the project for their testing needs and also keep working with external projects and companies to improve their support of FreeBSD.

Important changes:
  * All the -head jobs are using clang/lld toolchain
  * All the -head test are using kyua in the base
  * RISC-V jobs now generate full disk image and run tests in QEMU with OpenSBI
  * freebsd-doc job also checks building of www.freebsd.org

New jobs added:
  * https://ci.freebsd.org/job/FreeBSD-head-amd64-test_ltp/
  * https://ci.freebsd.org/job/FreeBSD-head-powerpc64-images/
  * https://ci.freebsd.org/job/FreeBSD-head-powerpc64-testvm/

Work in progress:
  * Collecting and sorting CI tasks and ideas [here](https://hackmd.io/@FreeBSD-CI/freebsd-ci-todo)
  * Setup the CI stage environment and put the experimental jobs on it
  * Implementing automatic tests on bare metal hardware
  * Adding drm ports building test against -CURRENT
  * Testing and merging pull requests in [the FreeBSD-ci repo](https://github.com/freebsd/freebsd-ci/pulls)
  * Planning for running ztest and network stack tests
  * Helping more 3rd software get CI on FreeBSD through a hosted CI solution
  * Adding non-x86 test jobs.
  * Adding external toolchain related jobs.
  * Adding more hardware to the hardware lab

Please see freebsd-testing@ related tickets for more WIP information, and join the efforts

Sponsor: The FreeBSD Foundation
