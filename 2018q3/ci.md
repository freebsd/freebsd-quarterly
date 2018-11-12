## Continuous Integration ##

Contact:
  * Jenkins Admin <jenkins-admin@FreeBSD.org>
  * Li-Wen Hsu <lwhsu@FreeBSD.org>

Link:
  * [FreeBSD Jenkins Instance](https://ci.FreeBSD.org)
  * [FreeBSD CI artifact archive](https://artifact.ci.FreeBSD.org/)
  * [FreeBSD Jenkins wiki](https://wiki.freebsd.org/Jenkins)
  * [freebsd-testing Mailing List](https://lists.FreeBSD.org/mailman/listinfo/freebsd-testing)
  * [freebsd-ci Repository](https://github.com/freebsd/freebsd-ci)

The FreeBSD CI team maintains continuous integration tasks for FreeBSD.  The CI
system regularly checks the changes committed to the project's Subversion
repository can be successfully built, and performs various tests and analysis
with the build results.  The CI team also maintains the archive of the artifact
built by the CI system, for the further testing and debugging needs.

Starting from June 2018, the project is spnosred by the FreeBSD Foundation in
hardware and staff.  For more details of the sponsored projects, please refer
to:

https://www.freebsdfoundation.org/news-and-events/newsletter/freebsd-foundation-update-september-2018/

In addition to that, we also helped checking regressinos for OpenSSL 1.1.1
update and test continuously for 12-STABLE branch.

We had meetings and working groups at two developer summits during 2018Q3:

  * [BSDCam 2018](https://wiki.freebsd.org/DevSummit/201808/Testing)
  * [EuroBSDCon 2018](https://wiki.freebsd.org/DevSummit/201809)

Work in progress:
  * Fixing the failing test cases and builds
    * DTrace test: https://ci.freebsd.org/job/FreeBSD-head-amd64-dtrace_test/lastCompletedBuild/testReport/
    * ZFS test: https://ci.freebsd.org/job/FreeBSD-head-amd64-test_zfs/lastCompletedBuild/testReport/
    * GCC build: https://ci.freebsd.org/job/FreeBSD-head-amd64-gcc/
  * Adding drm ports building test against -CURRENT
  * Adding tests for selected project branches, e.g.: clang700-import
  * Adding new hardware to the embedded testbed
  * Implementing automatic tests on bare metal hardware
  * Planning running ztest and network stack tests
