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
combined with our company ban on travel during Q2 made in-person meetings
non-existent.  However, the team was able to continue meeting with our partners
and commercial users virtually. These meetings help us understand some of the
applications where FreeBSD is used.

### Fundraising Efforts ###

Last quarter we raised $268,400!  Thank you to the individuals and organizations
that stepped in to help fund our efforts.  We’d like to thank Netflix, employees
of Nginx, Beckhoff Automation, and Mozilla Foundation for their large
contributions last quarter, which helped bring our 2020 fundraising effort to
$339k.  We hope other organizations will follow their lead and give back to help
us continue supporting FreeBSD.

These are trying times, and we deeply appreciate every donation that has come in
from $5 to $150,000. We’re still here giving 110% to supporting FreeBSD!

We are 100% funded by donations, and those funds go towards software development
work to improve FreeBSD, FreeBSD advocacy around the world, keeping FreeBSD
secure, continuous integration improvements, sponsoring BSD-related and
computing conferences (even the virtual events!), legal support for the Project,
and many other areas.

Please consider making a
[donation to help us continue and increase our support for FreeBSD](https://www.FreeBSDfoundation.org/donate/.).

We also have the Partnership Program, to provide more benefits for our larger
commercial donors.  Find out more information about the
[partnership program](https://www.FreeBSDfoundation.org/FreeBSD-foundation-partnership-program/)
and share with your companies!

### OS Improvements ###

A number of FreeBSD Foundation grant recipients started, continued working on,
or completed projects during the second quarter.  These include:
 - WiFi improvements
 - Linuxulator application compatibility
 - DRM / Graphics driver updates
 - Zstd compression for OpenZFS
 - Online RAID-Z expansion
 - if\_bridge performance improvements

You can find more details about most of these projects in other quarterly
reports.

Staff members also worked on a number of larger projects, including:
 - Run-Time Dynamic Linker (rtld) improvements
 - Improved FreeBSD support on Microsoft HyperV and Azure
 - Fine-grained locking for amd64 pmap
 - 5-level paging structures for amd64
 - Non-transparent superpages
 - Migration to a Git repository
 - Tool chain modernization

Many of these projects also have detailed entries in other quarterly report
entries.

Staff members also put in significant effort in many ways other than larger,
individual projects.  These include assisting with code reviews, bug report
triage, security report triage and advisory handling, addressing syzkaller
reports, and ongoing maintenance and bug fixes in functional areas such as the
tool chain, developer tools, virtual memory kernel subsystem, low-level x86
infrastructure, sockets and protocols, and others.

### University of Waterloo Co-op ###

Foundation co-op students Colin, Tiger, and Yang completed their winter 2020
work term during the second quarter, and continued on with the next school term
in their respective programs.  Although COVID-19 presented a unique challenge
and prompted an abrupt transition to remote work just over half way through the
term, all three learned a lot and provided positive contributions to the FreeBSD
Project and to the Foundation.

A few projects that were in progress or completed during the work term were
committed to the FreeBSD tree in the second quarter.

### Continuous Integration and Quality Assurance ###

The Foundation provides a full-time staff member who is working on improving
continuous integration, automated testing, and overall quality assurance
efforts for the FreeBSD project.

During the second quarter of 2020, Foundation staff continued improving the
Project's CI infrastructure, monitoring regressions and working with
contributors to fix the failing build and test cases.  The setting up of VM host
for CI jobs and staging environment is in progress.  We are also working with
other teams in the Project for their testing needs.  For example, we added jobs
for running full tests on non-x86 architectures.  We are also working with many
external projects and companies to improve their support of FreeBSD.

See the FreeBSD CI section of this report for completed work items and detailed
information.

### Supporting FreeBSD Infrastructure ###

The Foundation provides hardware and support to improve FreeBSD infrastructure.
Last quarter, we continued supporting FreeBSD hardware located around the world.
We started working on getting the new NYI Chicago colocation facility prepared
for some of the new FreeBSD hardware we are planning on purchasing.
NYI generously provides this for free to the Project.

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
applications, and to recruit more contributors to the Project.  As is the case
for most of us in this industry, COVID-19 has put our in-person events on hold.
In addition to attending virtual events, we are continually working on new
training initiatives and updating our selection of how-to guides to facilitate
getting more folks to try out FreeBSD.

Check out some of the advocacy and education work we did last quarter:

 - Silver sponsor of BSDCan 2020.  The event was held virtually, June 2-6, 2020
 - Community Sponsor of Rootconf 2020.  The event was held virtually, June 19-20, 2020
 - Annual FreeBSD Day, June 19.  This year’s celebration was postponed in
   support of Juneteeth.  However the activities surrounding FreeBSD Day have
   been transformed into an ongoing series of online sessions.  See
   *FreeBSD Fridays* below for more information.
 - Presented
   [27 Years of FreeBSD and Why You Should Get Involved](https://www.youtube.com/watch?v=Wi5yMvavhQM)
   as part of a Linux Professional Institute series of webinars on June 24, 2020.
 - Attended and presented at the virtual Open Source Summit 2020.
 - Announced *FreeBSD Fridays*: A series of 101 classes designed to get you
   started with FreeBSD.  Find out more in the
   [announcement](https://www.freebsdfoundation.org/blog/announcing-freebsd-fridays-a-series-of-101-classes/)
 - Participated as an Admin for Google Summer of Code 2020
 - Participated in the new FreeBSD Office Hours series including holding our own
   Foundation led office hours.  Videos from the one hour sessions can be found
   on the [Project’s YouTube Channel](https://www.youtube.com/channel/UCxLxR_oW-NAmChIcSkAyZGQ).
   You can watch ours [here](https://www.youtube.com/watch?v=Ji4ux4FWpRU).

In addition to the information found in the Development Projects update section
of this report, take a minute to check out the latest update blogs:

 - [5x if\_bridge Performance Improvement](https://www.freebsdfoundation.org/blog/500-if_bridge-performance-improvement/)
 - [My Experience as a FreeBSD Foundation Co-Op Student](https://www.freebsdfoundation.org/blog/my-experience-as-a-freebsd-foundation-co-op-student/)

Keep up to date with our latest work in our
[Bi-Monthly newsletters](https://www.freebsdfoundation.org/news-and-events/newsletter/).

Mellanox provided an update on how and why they use FreeBSD in our latest
[Contributor Case Study](https://www.freebsdfoundation.org/freebsd-case-study-mellanox/).

We help educate the world about FreeBSD by publishing the professionally
produced FreeBSD Journal.  As we mentioned previously, the FreeBSD Journal is
now a free publication.  Find out more and
[access the latest issues](https://www.FreeBSDfoundation.org/journal/) on the
Journal site.

You can find out more about
[events we attended and upcoming events](https://www.FreeBSDfoundation.org/news-and-events/).

We have continued our work with a new website developer to help us improve our
website.  Work is nearly complete to make it easier for community members to
find information more easily and to make the site more efficient.  We look
forward to unveiling the refreshed site in Q3.

### Foundation Board Meeting ###

Our annual board meeting was held on Tuesday June 2, 2020.  We normally hold
this meeting the Tuesday before BSDCan, in Ottawa, Ontario, Canada, but with the
company travel ban, and the conference going virtual, our meeting went virtual
for the first time.  The purpose of the annual board meeting is to hold our
board director and officer elections, review work accomplished over the past
year, and put together strategic goals for the upcoming 12 months.

The board generally has two all-day board meetings each year, this one, and a
more informal one in January, typically held in Berkeley.  Both meetings allow
us to connect, reevaluate and discuss new ideas, while assessing what we should
do to help the Project.

Some of our longer-term goals include Growing User and Developer Communities,
Developing Training and OS Course Content, Improving desktop/laptop experience,
Promoting FreeBSD (as you can see in all the advocacy work listed above), and
Improving Testing Capabilities.

Results of the director and officer elections were:
 - Justin Gibbs (President)
 - Benedict Reuschling (Vice President)
 - Kirk McKusick (Treasurer)
 - Philip Paeps (Secretary)
 - Deb Goodkin (Assistant Secretary)
 - Robert Watson (Director)
 - Hiroki Sato (Director)
 - George Neville-Neil (Director)

Find out more about the
[FreeBSD Foundation Board of Directors](https://www.freebsdfoundation.org/about/board-of-directors/)
on our website.

### Legal/FreeBSD IP ###

The Foundation owns the FreeBSD trademarks, and it is our responsibility to
protect them.  We also provide legal support for the core team to investigate
questions that arise.

Go to [the FreeBSD Foundation's web site](http://www.FreeBSDfoundation.org/) to
find out how we support FreeBSD and how we can help you!
