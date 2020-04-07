## FreeBSD Foundation ##

Contact: Deb Goodkin <deb@FreeBSDFoundation.org>  

The FreeBSD Foundation is a 501(c)(3) non-profit organization dedicated to
supporting and promoting the FreeBSD Project and community worldwide.  Funding
comes from individual and corporate donations and is used to fund and manage
software development projects, conferences and developer summits, and provide
travel grants to FreeBSD contributors.  The Foundation purchases and supports
hardware to improve and maintain FreeBSD infrastructure and provides resources
to improve security, quality assurance, and release engineering efforts;
publishes marketing material to promote, educate, and advocate for the FreeBSD
Project; facilitates collaboration between commercial vendors and FreeBSD
developers; and finally, represents the FreeBSD Project in executing contracts,
license agreements, and other legal arrangements that require a recognized
legal entity.

Here are some highlights of what we did to help FreeBSD last quarter:

### General ###

We moved! Our new address is:
> The FreeBSD Foundation
> 3980 Broadway St. STE #103-107
> Boulder, CO 80304
> USA

In February, the board of directors had an all-day board meeting in Berkely, CA,
where FreeBSD began!  We put together our strategic plans for the next 2 years,
which includes software developments projects we want to support and some
educational initiatives.

COVID-19 impacts the Foundation.  We put policies in place for all of our staff
members to work from home.  We also put a temporary ban on travel for staff
members.  We are continuing our work supporting the community and Project, but
some of our work and responses are delayed because of changes in some of our
priorities and the impact of limited childcare for a few of our staff members.

### Partnerships and Commercial User Support ###

We help facilitate collaboration between commercial users and FreeBSD
developers.  We also meet with companies to discuss their needs and bring that
information back to the Project.  In Q1, Deb Goodkin met with commercial users
at LinuxConfAu in Australia, FOSDEM in Belgium, and SCALE18x in the US.  These
venues provide an excellent opportunity to meet with commercial and individual
users and contributors to FreeBSD. It's not only beneficial for the above, but
it also helps us understand some of the applications where FreeBSD is used.
In addition to meeting with commercial users at conferences, we continued
discussions over email or on calls over the quarter.

### Fundraising Efforts ###

Last quarter we raised $57,000!  Thank you to everyone who came through,
especially in this economic crisis we have found ourselves in.  It heartens us
deeply that individuals and organizations have supported our efforts, when there
are so many people, animals, and businesses in need right now.  We also want to
extend a big thank you to Tarsnap, VMWare, and Stormshield for leading the way
with Silver level donations.  We hope other organizations will follow their lead
and give back to help us continue supporting FreeBSD.

We are 100% funded by donations, and those funds go towards software development
work to improve FreeBSD, FreeBSD advocacy around the world, keeping FreeBSD
secure, continuous integration improvements, sponsoring BSD-related and
computing conferences, legal support for the Project, and many other areas.

Please consider making a donation to help us continue and increase our support
for FreeBSD: https://www.FreeBSDfoundation.org/donate/.

We also have the Partnership Program, to provide more benefits for our larger
commercial donors.  Find out more information at
https://www.FreeBSDfoundation.org/FreeBSD-foundation-partnership-program/ and
share with your companies!

### OS Improvements ###

The Foundation supports software development projects to improve the FreeBSD
operating system through our full time technical staff, contractors, and project
grant recipients.  They maintain and improve critical kernel subsystems, add new
features and functionality, and fix problems.

Over the last quarter there were 273 commits to the FreeBSD base system source
repository tagged with FreeBSD Foundation sponsorship, about 12% of base system
commits over the quarter.  Many of these are part of sponsored or staff projects
that have their own entries in this FreeBSD Quarterly Report, but Foundation
staff and contractors (Ed Maste, Konstantin Belousov, Mark Johnston, Li-Wen Hsu)
also support the project with an ongoing series of bug fixes, build fixes, and
miscellaneous improvements that don't warrant a separate entry.

Ed committed miscellaneous improvements to various parts of FreeBSD's build
infrastructure, largely prompted by the work to retire the obsolete GCC 4.2.1.
This included removal of the _LLVM\_LIBUNWIND_ option (now always set), and
the removal of unused gperf, gcov, and the GPL devicetree compiler (dtc).  Ed
committed sendfile support for the Linuxulator, submitted by previous intern
Bora Özarslan, and tested and committed a number of submitted bug fixes for
the Microchip USB-Ethernet controller _if\_muge_ driver.  Ed also updated the
copy of OpenSSH in the base system to 7.9p1, with additional updates in
progress, and worked on a number of security advisories released during the
quarter.

Konstantin Belousov and Mark Johnston both performed a large number of code
reviews during the quarter under Foundation sponsorship.  This work helps
developers in the FreeBSD community and those working at companies using
FreeBSD to integrate their work into FreeBSD.

In addition to work described elsewhere in this report Konstantin also
continued his usual series of bug fixes and improvements.  This quarter this
included low-level x86 support, fixing sendfile bugs, file system and vfs
bug fixes, and dozens of other miscellaneous improvements.  Additional work
included a variety of commits to support Hygon x86 CPUs and improvements to
the runtime linker (rtld)'s direct execution mode.

Mark Johnston continued his work on the
[Syzkaller](https://syzkaller.appspot.com/freebsd) system-call fuzzer, and
committed fixes for many issues reported by Syzkaller.  Mark triaged a large
number of submitted bug reports and in many cases committed attached patches
or developed fixes.  Mark also addressed dozens of Coverity Scan reports.

Mark's other changes included arm64 Large System Extensions (LSE) atomic
operations, low-level arm64 and x86 work, virtual memory (VM) work, and bug
fixes or other improvements to syslog, the lagg(4) link aggregation driver,
and build reproducibility.

Li-Wen Hsu committed many changes to tests in the base system, such as turning
off known failing tests tracked by PRs, test-related pkgbase fixes, and other
improvements.

### Continuous Integration and Quality Assurance ###

The Foundation provides a full-time staff member who is working on improving
our automated testing, continuous integration, and overall quality assurance
efforts.

During the first quarter of 2020, Foundation staff continued to improve the
Project's CI infrastructure, worked with contributors to fix the failing build
and test cases.  The building of a CI staging environment is in progress on the
new machine purchased by the Foundation.  We are also working with other teams
in the Project for their testing needs.  For example, we added a new job for
running LTP (Linux Testing Project) on the Linuxulator, to validate improvements
in the Foundation's sponsored Linux emulation work.  We are also working with
many external projects and companies to improve their support of FreeBSD.

See the FreeBSD CI section of this report for completed work items and detailed
information.

### Supporting FreeBSD Infrastructure ###

The Foundation provides hardware and support to improve the FreeBSD
infrastructure.  Last quarter, we continued supporting FreeBSD hardware located
around the world.  We purchased one server for a mirror in Malaysia, and signed
the MOU for the new NYI colocation facility in Illinois.  NYI generously
provides this as an in-kind donation to the Project.

### FreeBSD Advocacy and Education ###

A large part of our efforts are dedicated to advocating for the Project.  This
includes promoting work being done by others with FreeBSD; producing advocacy
literature to teach people about FreeBSD and help make the path to starting
using FreeBSD or contributing to the Project easier; and attending and getting
other FreeBSD contributors to volunteer to run FreeBSD events, staff FreeBSD
tables, and give FreeBSD presentations.

The FreeBSD Foundation sponsors many conferences, events, and summits around the
globe.  These events can be BSD-related, open source, or technology events
geared towards underrepresented groups.  We support the FreeBSD-focused events
to help provide a venue for sharing knowledge, to work together on projects, and
to facilitate collaboration between developers and commercial users.  This all
helps provide a healthy ecosystem.  We support the non-FreeBSD events to promote
and raise awareness of FreeBSD, to increase the use of FreeBSD in different
applications, and to recruit more contributors to the Project.

Check out some of the advocacy and education work we did last quarter:

- Organized and presented at the first ever FreeBSD Mini-Conf LinuxConfAu 2020,
  in Gold Coast, Australia in addition to sponsoring the conference itself.
  [The recap can be found here](https://www.freebsdfoundation.org/blog/freebsd-miniconf-at-lca2020-conference-recap/).

- Presented BSD Dev Room at FOSDEM '20, in Brussels, Belgium and represented
  FreeBSD at a stand along with other members of the community.  [Find out more
  here](https://www.freebsdfoundation.org/blog/fosdem-2020-conference-recap/).

- Represented FreeBSD at Apricot 2020 in Melbourne, Australia and sponsored the
  event.

- Industry Partner Sponsor for USENIX FAST '20 in Santa Clara, CA

- Sponsored FOSSASIA 2020, in Singapore

- Committed to hold FreeBSD Day at SCALE 18x, in Pasadena, CA

- Held a "Getting Started with FreeBSD Workshop" at SCALE 18x in addition to
  giving a talk, representing FreeBSD at the Expo and holding a "Why FreeBSD is
  Me" BoF.  Check out the [conference recap](https://www.freebsdfoundation.org/blog/scale-18x-conference-recap/).

We continued producing FreeBSD advocacy material to help people promote FreeBSD.
Learn more about our efforts in 2019 to [advocate for FreeBSD](https://www.freebsdfoundation.org/blog/2019-in-review-advocacy/).

In addition to the information found in the Development Projects update section
of this report, take a minute to check out the latest update blogs:

- [POWER to the People: Making FreeBSD a First Class Citizen on POWER](https://www.freebsdfoundation.org/blog/power-to-the-people-making-freebsd-a-first-class-citizen-on-power/).

- [Development Project Update: Toolchain Modernization](https://www.freebsdfoundation.org/blog/project-update-toolchain-modernization/).

Read more about our conference adventures in the conference recaps and trip
reports in [our monthly newsletters](https://www.freebsdfoundation.org/news-and-events/newsletter/).

We help educate the world about FreeBSD by publishing the professionally
produced FreeBSD Journal.  As we mentioned previously, the FreeBSD Journal is
now a free publication.  [Find out more and access the latest issues](https://www.FreeBSDfoundation.org/journal/).

[You can find out more about events we attended and upcoming events here](https://www.FreeBSDfoundation.org/news-and-events/). 
As is the case for most of
us in this industry, SCALE was the last event we will be attending for a few
months.  However, we're already working on how we can make more on-line
tutorials and how-to guides available to facilitate getting more folks to try
out FreeBSD.  In the meantime, please check out the how-to guides we already
have available!

We have continued our work with a new website developer to help us improve our
website.  Work has begun to make it easier for community members to find
information more easily and to make the site more efficient.

### Legal/FreeBSD IP ###

The Foundation owns the FreeBSD trademarks, and it is our responsibility to
protect them.  We also provide legal support for the core team to investigate
questions that arise.

Go to http://www.FreeBSDfoundation.org/ to find out how we support FreeBSD and
how we can help you!
