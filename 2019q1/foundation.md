## FreeBSD Foundation Update ##

Contact: Deb Goodkin <deb@FreeBSDFoundation.org>

The FreeBSD Foundation is a 501(c)(3) non-profit organization dedicated to
supporting and promoting the FreeBSD Project and community worldwide.
Funding comes from individual and corporate donations and is used to fund
and manage software development projects, conferences and developer summits,
and provide travel grants to FreeBSD contributors.

The Foundation purchases and supports hardware to improve and maintain
FreeBSD infrastructure and provides resources to improve security,
quality assurance, and release engineering efforts; publishes
marketing material to promote, educate, and advocate for the FreeBSD Project;
facilitates collaboration between commercial vendors and FreeBSD developers;
and finally, represents the FreeBSD Project in executing contracts,
license agreements, and other legal arrangements that require
a recognized legal entity.

Here are some highlights of what we did to help FreeBSD last quarter:

We kicked off the year with an all-day board meeting in Berkeley,
where FreeBSD began, to put together high-level plans for 2019.
This included prioritizing technologies and features we should support,
long-term planning for the next 2-5 years, and philosophical discussions
on our purpose and goals.

### Partnerships and Commercial User Support ###

We began the year by meeting with a few commercial users, to help them
navigate working with the Project, and understanding how they are using
FreeBSD.  We're also in the process of setting up meetings for Q2 and
throughout the rest of 2019. Because we're a 501(c)(3) non-profit, we
don't directly support commercial users.
However, these meetings allow us to focus on facilitating collaboration
with the community.

### Fundraising Efforts ###

Our work is 100% funded by your donations. We kicked off the year with many
individual and corporate donations, including donations and commitments from
NetApp, Netflix, Intel, Tarsnap, Beckhoff Automation, E-Card, VMware, and
Stormshield. We are working hard to get more commercial users to give back
to help us continue our work supporting FreeBSD.
Please consider
[making a donation](https://www.FreeBSDfoundation.org/donate/)
to help us continue and increase our support for FreeBSD:
https://www.FreeBSDfoundation.org/donate/.

We also have the Partnership Program, to provide more benefits for our
larger commercial donors. Find out more information at
https://www.FreeBSDfoundation.org/FreeBSD-foundation-partnership-program/
and share with your companies!

### OS Improvements ###

The Foundation improves the FreeBSD operating system by employing our
technical staff to maintain and improve critical kernel subsystems,
add features and functionality, and fix problems. This also includes funding
separate project grants like
the arm64 port, porting the blacklistd access control daemon, and the
integration of VIMAGE support,
to make sure that FreeBSD remains a viable solution for research, education,
computing, products and more.

Over the quarter there were 241 commits from nine Foundation-sponsored staff
members and grant recipients.

We kicked off or continued the following projects last quarter:

 * FUSE file system kernel support (update and bug fixes)
 * Linuxulator testing and diagnostics improvements
 * SDIO and WiFi infrastructure improvements
 * x86-64 scalability and performance improvements
 * OpenZFS Online RAID-Z Expansion

Having software developers on staff has allowed us to jump in and
work directly on projects to improve FreeBSD like:

 * amd64 and i386 pmap improvements and bugfixes
 * address userland threading library issues
 * improve i386 support to keep the platform viable
 * improve FreeBSD on RISC-V
 * application of the Capsicum sandboxing framework
 * build system improvements and bug fixes
 * respond to reports of security issues
 * implement vulnerability mitigations
 * tool chain updates and improvements
 * adding kernel code coverage support for the
   [Syzkaller](https://github.com/google/syzkaller) coverage-guided system call
   fuzzer
 * improved Syzkaller support for FreeBSD
 * improve the usability of `freebsd-update`
 * improve network stack stability and address race conditions
 * ensure FreeBSD provides userland interfaces required by contemporary
   applications
 * implement support for machine-dependent optimized subroutines
 * update and correct documentation and manpages
 * DTrace bug fixes
 * update the FreeBSD Valgrind port and try to upstream the changes

### Continuous Integration and Quality Assurance ###

The Foundation provides a full-time staff member who is working on improving
our automated testing, continuous integration, and overall quality assurance
efforts.

During the first quarter of 2019, Foundation staff continued improving the
project's CI infrastructure, working with contributors to fix failing build
and test cases, and working with other teams in the project for their
testing needs.  In this quarter, we started publishing the
[CI weekly report](https://lists.freebsd.org/mailman/listinfo/freebsd-testing)
on the freebsd-testing@ mailing list.

See the FreeBSD CI section of this report for more information.

### Release Engineering ###

The Foundation provides a full-time staff member to oversee the
release engineering efforts. This has provided timely and reliable releases
over the last five years.

During the first quarter of 2019, the FreeBSD Release Engineering team
continued providing weekly development snapshots for 13-CURRENT, 12-STABLE,
and 11-STABLE.

In addition, the Release Engineering team published the schedule for the
upcoming 11.3-RELEASE cycle, the fourth release from the stable/11 branch,
which builds on the stability and reliability of 11.2-RELEASE.

The upcoming
[11.3-RELEASE schedule](https://www.freebsd.org/releases/11.3R/schedule.html)
can be found at: https://www.freebsd.org/releases/11.3R/schedule.html

FreeBSD 11.3 is currently targeted for final release in early July 2019.

Please see the FreeBSD Release Engineering Team section of this quarterly
status report for additional details surrounding the above mentioned work.  

### Supporting FreeBSD Infrastructure ###

The Foundation provides hardware and support to improve FreeBSD infrastructure. Last quarter, we continued supporting FreeBSD hardware located
around the world.

### FreeBSD Advocacy and Education ###

A large part of our efforts are dedicated to advocating for the Project.
This includes promoting work being done by others with FreeBSD; producing
advocacy literature to teach people about FreeBSD and help make the path to
starting using FreeBSD or contributing to the Project easier; and attending
and getting other FreeBSD contributors to volunteer to run FreeBSD events,
staff FreeBSD tables, and give FreeBSD presentations.

The FreeBSD Foundation sponsors many conferences, events, and summits
around the globe. These events can be BSD-related, open source,
or technology events geared towards underrepresented groups. We support
the FreeBSD-focused events to help provide a venue for sharing knowledge,
to work together on projects, and to facilitate collaboration between
developers and commercial users. This all helps provide a healthy ecosystem.
We support the non-FreeBSD events to promote and raise awareness of FreeBSD,
to increase the use of FreeBSD in different applications, and to recruit
more contributors to the Project.

Check out some of the advocacy and education work we did last quarter:

 * Attended FOSDEM 2019 where we: staffed the FreeBSD Stand, sponsored the
   co-located FreeBSD Developer Summit, and gave the 25 Years of FreeBSD
   presentation in the BSD Dev room.

 * Sponsored and presented at SANOG33 in Thimphu, Bhutan

 * Represented FreeBSD at APRICOT 2019 in Yuseong-gu, Daejeon South Korea

 * Sponsored the USENIX FAST conference in Boston, MA as an Industry Partner

 * Ran our first ever FreeBSD track at
   [SCALE 17x](https://www.socallinuxexpo.org/scale/17x), which included an
   all-day
   [Getting Started with FreeBSD](https://www.socallinuxexpo.org/scale/17x/presentations/getting-started-freebsd)
   workshop.  We were thrilled with the turnout of almost 30 participants and
   received a lot of positive feedback. Thanks to Roller Angel who taught the 
   class with the help of Deb Goodkin and Gordon Tetlow. We also promoted
   FreeBSD at the FreeBSD table in the Expo Hall.

 * Sponsored, presented, and exhibited at FOSSASIA in Singapore

 * Sponsored AsiaBSDCon 2019

 * Committed to sponsoring Rootconf, BSDCan, and EuroBSDcon

 * Created registration systems for the Aberdeen Hackathon and the upcoming
   2019 Vienna FreeBSD Security Hackathon

 * Provided FreeBSD advocacy material

 * Provided 3 travel grants to FreeBSD contributors to attend many
   of the above events.

We continued producing FreeBSD advocacy material to help people promote
FreeBSD around the world.

Read more about our conference adventures in the conference recaps and trip
reports in our
[monthly newsletters](https://www.freebsdfoundation.org/news-and-events/newsletter/).

We help educate the world about FreeBSD by publishing the
professionally produced FreeBSD Journal. We're excited to announce that with
the release of the January/February 2019 issue, the FreeBSD Journal is now a
free publication. Find out more and access the latest issues at
https://www.FreeBSDfoundation.org/journal/.

You can find out more about events we attended and upcoming events at
https://www.FreeBSDfoundation.org/news-and-events/.

We also engaged with a new website developer to help us improve our website
to make it easier for community members to find information more easily and
to make the site more efficient.

### Legal/FreeBSD IP ###

The Foundation owns the FreeBSD trademarks, and it is our responsibility to
protect them. We also provide legal support for the core team to investigate
questions that arise.

Go to http://www.FreeBSDfoundation.org to find out how we support FreeBSD and
how we can help you!
