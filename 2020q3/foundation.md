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

### COVID-19 Impact to the Foundation ###

Like other organizations, we put policies in place for all of our staff members
to work from home.  We also put a temporary ban on travel for staff members.
We are continuing our work supporting the community and Project, but some of
our work and responses may be delayed because of changes in some of our
priorities and the impact of limited childcare for a few of our staff members.

### Partnerships and Commercial User Support ###

We help facilitate collaboration between commercial users and FreeBSD
developers.  We also meet with companies to discuss their needs and bring that
information back to the Project.  Not surprisingly, the stay at home orders,
combined with our company ban on travel during Q3 made in-person meetings
non-existent.  However, the team was able to continue meeting with our partners
and commercial users virtually.  These meetings help us understand some of the
applications where FreeBSD is used.

We are currently scheduling Zoom company meetings for Q4, please reach out if
you would like to schedule a meeting with us.

### Fundraising Efforts ###

Last quarter we raised $192,874.43!  Thank you to the individuals and
organizations that stepped in, to help fund our efforts.  We'd like to thank
Arm for their large contribution last quarter, which helped bring our 2020
fundraising effort to $521k.  We hope other organizations will follow their
lead and give back to help us continue supporting FreeBSD.

These are trying times, and we deeply appreciate every donation that has come
in from $5 to $150,000. We're still here giving 110% to supporting FreeBSD!

We are 100% funded by donations, and those funds go towards software
development work to improve FreeBSD, FreeBSD advocacy around the world, keeping
FreeBSD secure, continuous integration improvements, sponsoring BSD-related and
computing conferences (even the virtual events!), legal support for the
Project, and many other areas.

Please consider making a
[donation to help us continue and increase our support for FreeBSD](https://www.FreeBSDfoundation.org/donate/.).

We also have the Partnership Program, to provide more benefits for our larger
commercial donors.  Find out more information about the
[partnership program](https://www.FreeBSDfoundation.org/FreeBSD-foundation-partnership-program/)
and share with your companies!

### OS Improvements ###

A number of FreeBSD Foundation grant recipients started, continued working on,
or completed projects during the third quarter.  These include:
 - Ongoing WiFi and Linux KPI layer improvements.
 - Linuxulator application compatibility.
 - DRM / Graphics driver updates.
 - Zstd compression for OpenZFS.
 - Online RAID-Z expansion.
 - Modernized LLDB target support for FreeBSD.

You can find more details about most of these projects in other quarterly
reports.

Staff members also worked on a number of larger projects, including:
 - Run-Time Dynamic Linker (rtld) and kernel ELF loader improvements.
 - Rewritten UNIX domain socket locking.
 - Build infrastructure.
 - Open system call path handling support for O_BENEATH, O_RESOLVE_BENEATH.
 - arm64 support.
 - Migration to a Git repository.

Many of these projects also have detailed entries in other quarterly report
entries.

Staff members also put in significant effort in many ways other than larger,
individual projects.  These include assisting with code reviews, bug report
triage, security report triage and advisory handling, addressing syzkaller
reports, and ongoing maintenance and bug fixes in functional areas such as the
tool chain, developer tools, virtual memory kernel subsystem, low-level x86
infrastructure, sockets and protocols, and others.

### University of Waterloo Co-op ###

With the transition to working from home, the Foundation decided to again take
on three University of Waterloo Co-op students for the Fall 2020 term
(September to December).  Tiger returns for a second term, joined by new
students Yang and Zac.  Projects for the term include more work on
ELF Tool Chain, application of Capsicum to additional utilities, testing and
integration of FreePBX and Asterisk VOIP software, pkgbase, and exploring
containerization tooling.

### Continuous Integration and Quality Assurance ###

The Foundation provides a full-time staff member and funds projects on
improving continuous integration, automated testing, and overall quality
assurance efforts for the FreeBSD project.

During the third quarter of 2020, Foundation staff continued improving and
monitoring the Project's CI infrastructure, and working with experts to fix
the failing builds and the regressions found by tests.  The setting up of
dedicated VM host for running tests is completed.  New feature developments
and the CI staging environment is in progress.  We are also working with
other teams in the Project for their testing needs. For example, tests of
non-x86 architectures now run periodically, and improve the CI of the
embedded systems. We are also working with many external projects and
companies to improve the CI between their products and FreeBSD.

See the FreeBSD CI section of this report for completed work items and detailed
information.

### Supporting FreeBSD Infrastructure ###

The Foundation provides hardware and support to improve the FreeBSD
infrastructure.  Last quarter, we continued supporting FreeBSD hardware located
around the world.  We coordinated efforts between the new NYI Chicago facility
and clusteradm to start working on getting the facility prepared for some of
the new FreeBSD hardware we are planning on purchasing.  NYI generously
provides this for free to the Project.  We also worked on connecting with the
new owners of the Bridgewater site, where most of the FreeBSD infrastructure is
located.

Some of the purchases we made for the Project last quarter to support
infrastructure includes:
 - Spamhaus spam filtering software to limit the amount of spam on the mailing
   lists.
 - 5 application servers to run tasks like bugzilla, wiki, website, cgi,
   Phabricator, host git, etc.
 - 1 server to replace the old pkg server and provide a lot more IOPS to
   avoid the slowdowns seen during peak times of the day where the disks just
   cannot keep up with the request volume.
 - 1 server for exp-runs to make them faster.
 - 1 server to build packages more frequently.

### FreeBSD Advocacy and Education ###

A large part of our efforts are dedicated to advocating for the Project.  This
includes promoting work being done by others with FreeBSD; producing advocacy
literature to teach people about FreeBSD and help make the path to starting
using FreeBSD or contributing to the Project easier; and attending and getting
other FreeBSD contributors to volunteer to run FreeBSD events, staff FreeBSD
tables, and give FreeBSD presentations.

The FreeBSD Foundation sponsors many conferences, events, and summits around
the globe.  These events can be BSD-related, open source, or technology events
geared towards underrepresented groups.  We support the FreeBSD-focused events
to help provide a venue for sharing knowledge, to work together on projects,
and to facilitate collaboration between developers and commercial users.  This
all helps provide a healthy ecosystem.  We support the non-FreeBSD events to
promote and raise awareness of FreeBSD, to increase the use of FreeBSD in
different applications, and to recruit more contributors to the Project.  As is
the case for most of us in this industry, COVID-19 has put our in-person events
on hold.  In addition to attending virtual events, we are continually working
on new training initiatives and updating our selection of how-to guides to
facilitate getting more folks to try out FreeBSD.

Check out some of the advocacy and education work we did last quarter:
 - Launched our FreeBSD Fridays series of 101 classes.  Topics included an
   Introduction to FreeBSD, FreeBSD Installfest, Introduction to Security,
   Introduction to ZFS and more.  Videos of the past sessions and a schedule of
   upcoming events can be found [here](https://freebsdfoundation.org/freebsd-fridays/).
 - Attended and presented at OSI's State of the Source conference.  The event
   was held virtually, September 9-11, 2020.
 - Launched the
   [redesign](https://freebsdfoundation.org/blog/weve-got-a-new-look/)
   of the FreeBSD Foundation Website.
 - [Announced](https://freebsdfoundation.org/news-and-events/latest-news/freebsd-foundation-celebrates-20th-anniversary/)
   the 20th Anniversary of the FreeBSD Foundation.
 - Participated as an Admin for Google Summer of Code 2020
 - Continued to promote the FreeBSD Office Hours series including holding our
   own Foundation led office hours.  Videos from the one hour sessions can be
   found on the Project's
   [YouTube Channel](https://www.youtube.com/c/FreeBSDProject).  You can watch
   ours [here](https://www.youtube.com/watch?v=Ji4ux4FWpRU).
 - [Interviewed](https://freebsdfoundation.org/blog/freebsd-core-team-10-in-review/)
   members of the outgoing FreeBSD Core Team to get their thoughts on their
   term.
 - Began working with the FreeBSD Vendor Summit planning committee on the
   [November 2020 Vendor Summit](https://wiki.freebsd.org/DevSummit/202011).
 - Promoted the Foundation's 20th Anniversary and our work to support the
   FreeBSD Project in the It's FOSS Article.
   [FreeBSD Foundation Celebrates 20 Years of Promoting and Supporting FreeBSD Project](https://itsfoss.com/freebsd-foundation-20-years/).
 - Authored a [Beginners Guide to FreeBSD](https://www.fosslife.org/beginners-guide-freebsd) for Fosslife.
 - Committed to sponsoring All Things Open as a media Sponsor.
 - Committed to sponsoring the OpenZFS Developers Summit at the Bronze level.
 - Became an International RISC-V Member.
 - Committed to giving a FreeBSD talk at the nerdear.la conference on
   October 20th.

Keep up to date with our latest work in our
[monthly newsletters](https://www.freebsdfoundation.org/news-and-events/newsletter/).

Netflix provided an update on how and why they use FreeBSD in our latest
[Contributor Case Study](https://freebsdfoundation.org/wp-content/uploads/2020/10/netflixcasestudy_final.pdf).

We help educate the world about FreeBSD by publishing the professionally
produced FreeBSD Journal.  As we mentioned previously, the FreeBSD Journal is
now a free publication.  Find out more and access the latest issues at
https://www.FreeBSDfoundation.org/journal/.

You can find out more about events we attended and upcoming events at
https://www.FreeBSDfoundation.org/news-and-events/.

### Legal/FreeBSD IP ###

The Foundation owns the FreeBSD trademarks, and it is our responsibility to
protect them.  We also provide legal support for the core team to investigate
questions that arise.  We updated our
[Trademark Usage Terms and Conditions](https://freebsdfoundation.org/legal/trademark-usage-terms-and-conditions/)
on July 1, 2020.

Go to [the FreeBSD Foundation's web site](http://www.FreeBSDfoundation.org/) to
find out how we support FreeBSD and how we can help you!

### Other

We welcomed Andrew Wafaa and Kevin Bowling to our board of directors, to help
govern the Foundation and guide us with our strategic direction.  We have
[more information about our new board members](https://freebsdfoundation.org/blog/freebsd-foundation-welcomes-new-board-members-2/)
on our website.
