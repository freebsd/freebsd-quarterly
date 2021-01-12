## FreeBSD Foundation

Contact: Deb Goodkin <deb@FreeBSDFoundation.org>

The FreeBSD Foundation is a 501(c)(3) non-profit organization dedicated to
supporting and promoting the FreeBSD Project and community worldwide.  Funding
comes from individual and corporate donations and is used to fund and manage
software development projects, conferences and developer summits, and provide
travel grants to FreeBSD contributors. The Foundation purchases and supports
hardware to improve and maintain FreeBSD infrastructure and provides resources
to improve security, quality assurance, and release engineering efforts;
publishes marketing material to promote, educate, and advocate for the FreeBSD
Project; facilitates collaboration between commercial vendors and FreeBSD
developers; and finally, represents the FreeBSD Project in executing contracts,
license agreements, and other legal arrangements that require a recognized
legal entity.

Here are some highlights of what we did to help FreeBSD last quarter:

### COVID-19 Impact to the Foundation

Like most organizations, we transitioned all of our staff to work from home.
We also put a temporary ban on travel for staff members, which didn't affect
our output too much, since most conferences went virtual.  We continued
supporting the community and Project, even though some of our work and
responses may have been delayed because of changes in some of our priorities
and the impact of limited childcare for a few of our staff members.

### Partnerships and Commercial User Support

We help facilitate collaboration between commercial users and FreeBSD
developers. We also meet with companies to discuss their needs and bring that
information back to the Project. Not surprisingly, the stay at home orders,
combined with our company ban on travel during Q4 made in-person meetings
non-existent. However, the team was able to continue meeting with our partners
and commercial users virtually. These meetings help us understand some of the
applications where FreeBSD is used.

An event we help plan and organize, that helps with vendor/developer
engagement, is the annual Bay Area Vendor Summit.  We weren't going to let a
pandemic stop us for holding this invaluable yearly event, so we went virtual!
From the feedback we received from the vendor community on how we should run
this, so it would be beneficial for them, we decided to hold this over 3 half
days in November.  One unexpected result was that more commercial users from
around the world attended.  Since a Vendor/Developer Summit is typically
invitation only, we opened this up to FreeBSD contributors from around the
world to watch the livestream. Because of the success and excitement of this
event, we are planning to hold another one around June or July.

### Fundraising Efforts

We want to take a moment to say thank you to all the individuals and
corporations that stepped up to help fund our efforts last year.  As of this
writing, we raised $1,235,926, and will have the final tally by mid-January.
The companies that gave generous financial contributions include Arm, NetApp,
Netflix, Juniper Networks, Beckhoff, VMware, Stormshield, Tarsnap, and Google.
We also want to say thank you to the Koum Family Foundation for awarding us a
large grant, and to "the employees of Ngnix" who also made generous financial
contributions.

We truly appreciate these large contributions, which makes the most impact on
how much we can contribute back to the Project.  However, it's the individual
donations that have the most meaning to us.  Those are the folks who are giving
because they trust we will invest their personal donations, whether large or
small, into improving the operating system and Project.  As stewards of your
donations, we want to thank you for your trust in us and your commitment to
making FreeBSD the best platform for products, education, research, computing,
and more.

You'll find out how we used your donations for Q4 in our report, as well as in
individual reports throughout this status report.

Though we know this is a Q4 status report, we are excited about our plans for
2021, including growing our software development team!  We'll be posting two
job descriptions for a Senior Software Developer and Project Coordinator soon.

Please consider making a donation to help us continue and increase our support
for FreeBSD in 2021: https://www.FreeBSDfoundation.org/donate/.

We also have the Partnership Program, to provide more benefits for our larger
commercial donors.  Find out more information at
https://www.FreeBSDfoundation.org/FreeBSD-foundation-partnership-program/
and share with your companies!

### OS Improvements

The Foundation provided many project grants over the last quarter, and you
can read about OpenZFS Zstd support, Linuxulator application compatibility
improvements, LLDB target support, test lab infrastructure, and WiFi projects
in other entries in this quarterly report.

The Foundation hired six co-op students from the University of Waterloo during
the 2020 fall term, as well as one intern.  Former co-op student Tiger
returned, and new students Yang and Zac joined us for the first time.

Tiger worked on improvements to the code-coverage guided kernel fuzzing tool
Syzkaller, adding new system call definitions so that Syzkaller can expand the
code it tests.  A number of FreeBSD kernel bug fixes have already resulted from
this work.  Tiger also contributed a number of improvements to the ELF Tool
Chain set of binary utilities, and worked on tooling to run tests from other
tool suites against ELF Tool Chain.

Zac worked on an improvement to the pkg package management tool, investigating
and upstreaming patches for FreeBSD support in FreePBX, and investigating
compiler support for addressing the stack clash vulnerability.

Yang investigated and fixed a compilation bug with the kernel's Skein-1024
assembly implementation (used by ZFS), and then a number of projects related to
Capsicum: applying Capsicum to sort(1), implementing a Capsicum service to
execute utilities, and finally working with developers of the Game of Trees
(got) version control system to adapt it for Capsicum support.

Our intern Ka Ho focused on improving the desktop experience of the FreeBSD.
He fixed and improved many items of OBS (Open Broadcaster Software) on
FreeBSD, worked on FreeBSD native audio support on Firefox, adding a facility
that user-space audio programs could make use of to enumerate a list of audio
devices.  He also ported the fcitx5 input method framework.

The five Foundation staff members continued contributions in 2020 in both
ongoing operational tasks (including the Git working group and security team)
and software development for a number of projects.

Staff members responded to reported security vulnerabilities and release
errata, prepared patches, and participated in the security advisory process.
We also worked on proactive security vulnerability mitigations.  Syzkaller
also provided many reports of kernel issues that resulted in
Foundation-sponsored bug fixes.  We worked on several issues relating to
FreeBSD/arm64 to move it along the path of being a Tier-1 architecture.

We participated in code reviews and supported community members in integrating
changes into FreeBSD, and triaged incoming bug reports.

We contributed enhancements to many kernel and userland subsystems, including
the x86 pmap layer, ELF run-time linker and kernel loader, the Capsicum
sandboxing framework and Casper services, the threading library, some RISC-V
changes, the build system, tool chain and freebsd-update, network stack
stability improvements, machine-dependent optimizations, new kernel interfaces,
DTrace bug fixes, documentation improvements, and others.

### Continuous Integration and Quality Assurance

The Foundation provides a full-time staff member and funds projects on
improving continuous integration, automated testing, and overall quality
assurance efforts for the FreeBSD Project.

During the fourth quarter of 2020, Foundation staff continued improving and
monitoring the Project's CI infrastructure, and working with experts to fix
the failing builds and the regressions found by tests.  The work was focused
on pre-commit tests and development of the CI staging environment.  The other
main working item is working on the VCS migration to change the src and doc
source from Subversion to Git.  There are also many work-in-progress tasks like
analysis and improve the tests of non-x86 platforms.

See the FreeBSD CI section of this report for completed work items and detailed
information.

### Supporting FreeBSD Infrastructure

The Foundation provides hardware and support to improve the FreeBSD
infrastructure.  Last quarter, we continued supporting FreeBSD hardware located
around the world.  We coordinated efforts between the new NYI Chicago facility
and clusteradm to start working on getting the facility prepared for some of
the new FreeBSD hardware we are planning on purchasing.  NYI generously
provides this for free to the Project.  We also worked on connecting with the
new owners of the NYI Bridgewater site, where most of the existing FreeBSD
infrastructure is located.

Some of the purchases we made for the Project last quarter to support
infrastructure includes:

  * 5 application servers to run tasks like bugzilla, wiki, website, cgi,
    Phabricator, host git, etc.
  * 1 server to replace the old pkg server, which will provide a lot more IOPS
    to avoid the slowdowns seen during peak times of the day where the disks
    simply cannot keep up with the request volume.
  * 1 server for exp-runs and make them faster.
  * 1 server to build packages more frequently

### FreeBSD Advocacy and Education

A large part of our efforts are dedicated to advocating for the Project.  This
includes promoting work being done by others with FreeBSD; producing advocacy
literature to teach people about FreeBSD and help make the path to starting
using FreeBSD or contributing to the Project easier; and attending and getting
other FreeBSD contributors to volunteer to run FreeBSD events, staff FreeBSD
tables, and give FreeBSD presentations.

The FreeBSD Foundation sponsors many conferences, events, and summits around
the globe. These events can be BSD-related, open source, or technology events
geared towards underrepresented groups. We support the FreeBSD-focused events
to help provide a venue for sharing knowledge, to work together on projects,
and to facilitate collaboration between developers and commercial users.  This
all helps provide a healthy ecosystem. We support the non-FreeBSD events to
promote and raise awareness of FreeBSD, to increase the use of FreeBSD in
different applications, and to recruit more contributors to the Project.

While we were still unable to attend in-person meetings due to COVID-19, we
were able to attend virtual events at new venues and facilitate the first
online FreeBSD Vendor Summit.  In addition to attending and planning virtual
events, we are continually working on new training initiatives and updating our
selection of [how-to guides](https://freebsdfoundation.org/freebsd-project/resources/) to facilitate getting more folks to try out FreeBSD.

Check out some of the advocacy and education work we did last quarter:

  * Continued our FreeBSD Fridays series of 101 classes. Topics included an
    Introduction to Capsicum, Introduction to Bhyve, Introduction to DTrace, and
    more.  Videos of the past sessions can be found [here](https://freebsdfoundation.org/freebsd-fridays/). We'll be back with new
    sessions in early 2021.
  * Gave a FreeBSD talk at the nerdear.la conference on October 20th.
  * Participated in the podcast: [What the Dev: A Dive into the FreeBSD Foundation
    on its 20th Anniversary](https://freebsdfoundation.org/news-and-events/latest-news/what-the-dev-podcast-a-dive-into-the-freebsd-foundation-on-its-20th-anniversary/)
  * Promoted the Foundation's 20th Anniversary in the FossBytes article:
    [20 Years of The FreeBSD Foundation](https://freebsdfoundation.org/news-and-events/latest-news/fossbytes-20-years-of-the-freebsd-foundation/)
  * Continued to promote the FreeBSD Office Hours series Videos from the one hour
    sessions can be found on the Project's [YouTube Channel](https://www.youtube.com/channel/UCxLxR_oW-NAmChIcSkAyZGQ)  See the Office Hours
    section of this report for more information.
  * Add two new How-To Guides: [Contributing FreeBSD Documentation](https://freebsdfoundation.org/contributing-freebsd-documentation/)
    and [How to Submit a Bug Report](https://freebsdfoundation.org/freebsd-project/resources/how-to-submit-a-bug-report/).
  * Worked with the organizing committee to host the [November 2020 Vendor Summit](https://wiki.freebsd.org/DevSummit/202011)
  * Promoted the [use of FreeBSD](https://freebsdfoundation.org/news-and-events/latest-news/freebsd-essential-to-bringing-cheri-and-arms-morello-processor-to-life/) in regards to CHERI and ARM's Morello Processor
  * Authored a [Beginners Guide to FreeBSD](https://www.fosslife.org/beginners-guide-freebsd) for Fosslife.
  * Sponsored All Things Open as a Media Sponsor.
  * Sponsored OpenZFS Developers Summit at the Bronze level.
  * Applied for a virtual stand at FOSDEM 2021.
  * Committed to attend the online Apricot 2021.

Keep up to date with our latest work in our newsletters:
https://www.freebsdfoundation.org/news-and-events/newsletter/

Netflix provided an update on how and why they use FreeBSD in our latest
[Contributor Case Study](https://freebsdfoundation.org/blog/freebsd-case-study-netflix/).

We help educate the world about FreeBSD by publishing the professionally
produced FreeBSD Journal.  As we mentioned previously, the FreeBSD Journal is
now a free publication.  Find out more and access the latest issues at
https://www.FreeBSDfoundation.org/journal/.

You can find out more about events we attended and upcoming events at
https://www.FreeBSDfoundation.org/news-and-events/.

### Legal/FreeBSD IP

The Foundation owns the FreeBSD trademarks, and it is our responsibility to
protect them.  We also provide legal support for the core team to investigate
questions that arise.

Go to http://www.FreeBSDfoundation.org to find out how we support FreeBSD and
how we can help you!
