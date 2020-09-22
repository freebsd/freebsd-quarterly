## FreeBSD Release Engineering Team ##

Contact: FreeBSD Release Engineering Team, <re@FreeBSD.org>

Link:	[FreeBSD 12.2-RELEASE schedule](https://www.freebsd.org/releases/12.2R/schedule.html)
Link:	[FreeBSD 12.2 test builds](https://www.freebsd.org/where.html#helptest)
Link:	[FreeBSD development snapshots](https://download.freebsd.org/ftp/snapshots/ISO-IMAGES/)

The FreeBSD Release Engineering Team is responsible for setting
and publishing release schedules for official project releases
of FreeBSD, announcing code freezes and maintaining the respective
branches, among other things.

During the third quarter of 2020, the Release Engineering Team started
work on the 12.2-RELEASE cycle, the third release from the stable/12
branch.

As of this writing, two BETA builds have been released, with the
expectation there will be a third BETA build currently remaining on the
schedule.

The 12.2-RELEASE cycle will continue throughout October, with two RC
builds currently planned, and RC3 scheduled on an as-needed basis.  The
12.2-RELEASE is so far scheduled for final release on October 27.

In addition to the 12.2-RELEASE, Glen Barber of the Release Engineering
Team finished work to the release build tools and scripts to prepare for
the conversion from Subversion to Git for the 13.0-RELEASE cycle.  There
are no plans to merge these changes to stable branches at this time, as
discussed within the Git working group, we feel such a change on a stable
branch would be too intrusive to our user base as well as downstream
FreeBSD consumers.  Development snapshot builds for 13.0-CURRENT have
recently been built from the Git tree within the project, and further
snapshot builds for 12.x and 11.x will continue to be built from Subversion.

Additionally throughout the quarter, several development snapshots builds
were released for the *head*, *stable/12*, and *stable/11* branches.

Finally, the Release Engineering Team would like to thank Marius Strobl
for his time serving on the team, who had recently stepped down from the
Deputy RE Lead role due to constraints on his time.  The Team welcomes
Colin Percival to the Team, who has accepted fulfilling this role.

Much of this work was sponsored by Rubicon Communications, LLC (netgate.com)
and the FreeBSD Foundation.
