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
for the FreeBSD project.  The CI system firstly checks the committed changes
can be successfully built, then performs various tests and analysis over the
newly built results.
The artifacts from the build jobs are archived in the artifact server for
further testing and debugging needs.  The CI team members examine the
failing builds and unstable tests and work with the experts in that area to
fix the codes or adjust test infrastructure.  The details of these efforts
are available in the [weekly CI reports](https://hackmd.io/@FreeBSD-CI).

During the second quarter of 2020, we continue working with the contributors and developers in the project for their testing needs and also keep working with external projects and companies to improve their support of FreeBSD.

Important changes:
 * All -test jobs will run tests under `/usr/tests`, previously only x86 architectures doing this. See the Continuous Integration on !x86 section in this report for more information.
 * Compression algorithm of disk images on the [artifact server](https://artifacts.ci.freebsd.org) has been changed to zstd to speed up compression and decompression.
 * The build and test results will be sent to the [dev-ci mailing list](https://lists.freebsd.org/mailman/listinfo/dev-ci) soon. Feedback and help with analysis is very appreciated!

New jobs added:
 * https://ci.freebsd.org/job/FreeBSD-head-armv7-test/
 * https://ci.freebsd.org/job/FreeBSD-head-aarch64-test/
 * https://ci.freebsd.org/job/FreeBSD-head-mips64-test/
 * https://ci.freebsd.org/job/FreeBSD-head-powerpc64-test/

Work in progress:
  * Collecting and sorting CI tasks and ideas [here](https://hackmd.io/@FreeBSD-CI/freebsd-ci-todo)
  * Testing and merging pull requests in the [the FreeBSD-ci repo](https://github.com/freebsd/freebsd-ci/pulls)
  * Setting up a builder dedicated to run jobs using provisioned VMs.
  * Setting up the CI stage environment and putting the experimental jobs on it
  * Implementing automatic tests on bare metal hardware
  * Adding drm ports building tests against -CURRENT
  * Planning to run ztest and network stack tests
  * Adding external toolchain related jobs
  * Improving the hardware lab to be more mature and adding more hardware
  * Helping more 3rd software get CI on FreeBSD through a hosted CI solution
  * Working with hosted CI providers to have better FreeBSD support

Please see freebsd-testing@ related tickets for more WIP information, and don't hesistate to join the effort!

Sponsor: The FreeBSD Foundation
