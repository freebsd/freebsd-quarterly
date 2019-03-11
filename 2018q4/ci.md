## Continuous Integration ##

Contact: Jenkins Admin, <jenkins-admin@FreeBSD.org>
Contact: Li-Wen Hsu, <lwhsu@FreeBSD.org>

Link:
  * [FreeBSD Jenkins Instance](https://ci.FreeBSD.org)
  * [FreeBSD CI artifact archive](https://artifact.ci.FreeBSD.org/)
  * [FreeBSD Jenkins wiki](https://wiki.freebsd.org/Jenkins)
  * [freebsd-testing Mailing List](https://lists.FreeBSD.org/mailman/listinfo/freebsd-testing)
  * [freebsd-ci Repository](https://github.com/freebsd/freebsd-ci)
  * [Tickets related to freebsd-testing@](https://preview.tinyurl.com/y9maauwg)
  * [Hosted CI wiki](https://wiki.freebsd.org/HostedCI)

The FreeBSD CI team maintains continuous integration system and related tasks
for the FreeBSD project.  The CI system regularly checks the changes committed
to the project's Subversion repository can be successfully built, and performs
various tests and analysis over the results.  The results from build jobs are
archived in artifact server, for the further testing and debugging needs.

The members on the CI team examine the failing builds and unstable tests, and
work with the experts in that area to fix the code or build and test
infrastructure, to improve the software quality of the FreeBSD base system.
The CI team member and the FreeBSD foundation staff Li-Wen is the maintainer of
Jenkins and Jenkins related ports.

In this quarter, we worked on extending test executing environment to improve
the coverage, temporarily disabling flakey test cases (and opening tickets to
work with domain experts).  Please see freebsd-testing@ related tickets for
more information.

In addition to that, starting from this quarter, we also work on collaboration
with external projects to extend their CI to cover FreeBSD.  See "HostedCI"
wiki page for more information.

Work in progress:
  * Fixing the failing test cases and builds
  * Adding drm ports building test against -CURRENT
  * Adding tests for selected project branches, e.g.: clang800-import
  * Implementing automatic tests on bare metal hardware
  * Planning the embedded testbed
  * Planning running ztest and network stack tests
