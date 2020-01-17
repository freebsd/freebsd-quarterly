## FreeBSD Foundation ##

Contact: Deb Goodkin <deb@FreeBSDFoundation.org>  

The FreeBSD Foundation is a 501(c)(3) non-profit organization dedicated to
supporting and promoting the FreeBSD Project and community worldwide. Funding
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

### Partnerships and Commercial User Support ###

We help facilitate collaboration between commercial users and FreeBSD
developers. We also meet with companies to discuss their needs and bring that
information back to the Project. In Q4, Ed Maste and Deb Goodkin met with a
few commercial users in the US. It's not only beneficial for the above, but it
also helps us understand some of the applications where FreeBSD is used. We
were also able to meet with a good number of commercial users at the Bay Area
Vendor/Developer Summit and Open Source Summit Europe. These venues provide an
excellent opportunity to meet with commercial and individual users and
contributors to FreeBSD.

### Fundraising Efforts ###

In 2019, we focused on supporting a few key areas where the Project needed the
most help. The first area was software development. Whether it was contracting
FreeBSD developers to work on projects like wifi support, to providing internal
staff to quickly implement hardware workarounds, we've stepped in to help keep
FreeBSD innovative, secure, and reliable. Software development includes
supporting the tools and infrastructure that make the development process go
smoothly, and we're on it with team members heading up the Continuous
Integration efforts, and actively involved in the clusteradmin and security
teams.

Our advocacy efforts focused on recruiting new users and contributors to the
Project. We attended and participated in 38 conferences and events in 21
countries. From giving FreeBSD presentations and workshops to staffing tables,
we were able to have 1:1 conversations with thousands of attendees.

Our travels also provided opportunities to talk directly with FreeBSD
commercial and individual users, contributors, and future FreeBSD
users/contributors. We've seen an increase in use and interest in FreeBSD from
all of these organizations and individuals. These meetings give us a chance to
learn more about what organizations need and what they and other individuals
are working on. The information helps inform the work we should fund.

In 2019, your donations helped us continue our efforts of supporting critical
areas of FreeBSD such as:

- Operating System Improvements: Providing staff to immediately respond to
  urgent problems and implement new features and functionality allowing for
  the innovation and stability you've come to rely on.

- Improving and increasing test coverage, continuous integration, and automated
  testing with a full-time software engineer to ensure you receive the highest
  quality, secure, and reliable operating system.

- Security: Providing engineering resources to bolster the capacity and
  responsiveness of the Security team providing you with peace of mind when
  security issues arise.

- Growing the number of FreeBSD contributors and users from our global FreeBSD
  outreach and advocacy efforts, including expanding into regions such as
  China, India, Africa, and Singapore.

- Offering FreeBSD workshops and presentations at more conferences, meetups,
  and universities around the world.

- Providing opportunities such as developer and vendor summits and company
  visits to help facilitate collaboration between commercial users and FreeBSD
  developers, as well as helping to get changes pushed into the FreeBSD source
  tree, and creating a bigger and healthier ecosystem.

We've accomplished a lot this year, but we are still only a small 501(c)3
organization focused on supporting FreeBSD and not a trade organization like
many other open source Foundations.

Please consider [making a donation](https://www.FreeBSDfoundation.org/donate/)
at https://www.FreeBSDfoundation.org/donate/ to help us continue and increase
our support for FreeBSD.

We also have the Partnership Program, to provide more benefits for our larger
commercial donors.
Find out more information at
https://www.FreeBSDfoundation.org/FreeBSD-foundation-partnership-program/
and share with your companies!

### OS Improvements ###

The Foundation supports software development projects to improve FreeBSD
through our full time technical staff, contractors, and project grant
recipients. They maintain and improve critical kernel subsystems, add new
features and functionality, and fix bugs.

Between October and December there were 236 commits to the FreeBSD source
repository tagged with FreeBSD Foundation sponsorship.  This is about 10%
of all commits during this period.  Some of these projects have their own
entries in the quarterly report, and are not repeated here, while others
are briefly described below.

As usual, Foundation staff member Konstantin Belousov committed a large
number of UFS, NFS, tmpfs, VM system, and low-level Intel x86 bug fixes and
improvements.  Kostik also committed improvements to the run-time linker
(rtld), and participated in very many code reviews, helping to get changes
from other developers integrated into the tree.

Following on from his work to improve debugging tools in the Linuxulator
environment, Edward Napierała integrated the Linux Test Project (LTP) with
FreeBSD's CI system, and committed a number of small bug fixes to the
Linuxulator itself.

Mark Johnston continued working on infrastructure for the Syzkaller system
call fuzzing tool, and committed fixes for many issues identified by it.
Mark committed improvements to RISC-V infrastructure, the network stack,
performance and locking, and x86 pmap.

Mark also added support for newer Intel WiFi chipsets to the iwm driver,
enabling WiFi support for the Lenovo X1 Carbon 7th generation, and other
contemporary laptops.

Ed Maste committed a number of improvements and cleanups in build
infrastructure, vt console fixes including issues with keyboard maps,
some blacklistd updates, documentation updates, and other small changes.
Ed also committed some work to prepare for the removal of GCC 4.2.1 from
the FreeBSD source tree, currently planned for Q1 2020.

### Continuous Integration and Quality Assurance ###

The Foundation provides a full-time staff member who is working on improving
our automated testing, continuous integration, and overall quality assurance
efforts.

During the fourth quarter of 2019, Foundation staff continued to improve the
project's CI infrastructure, worked with contributors to fix the failing build
and test cases.  We worked with other teams in the project for their testing
needs and also worked with many external projects and companies to improve
their support of FreeBSD. We added several new CI jobs and brought the
[FreeBSD Hardware Testing Lab](https://ci.freebsd.org/hwlab) online.

We published
[2019 in Review: CI and Testing Advancements](https://www.freebsdfoundation.org/blog/2019-in-review-ci-and-testing-advancements/)
on the Foundation's blog.  

See the FreeBSD CI section of this report for completed work items and detailed
information.

### Supporting FreeBSD Infrastructure ###

The Foundation provides hardware and support to improve the FreeBSD
infrastructure. Last quarter, we continued supporting FreeBSD hardware located
around the world.

### FreeBSD Advocacy and Education ###

A large part of our efforts are dedicated to advocating for the Project. This
includes promoting work being done by others with FreeBSD; producing advocacy
literature to teach people about FreeBSD and help make the path to starting
using FreeBSD or contributing to the Project easier; and attending and helping
other FreeBSD contributors volunteer to run FreeBSD events, staff FreeBSD
tables, and give FreeBSD presentations.

The FreeBSD Foundation sponsors many conferences, events, and summits around the globe. These events can be BSD-related, open source, or technology events geared towards underrepresented groups. We support the FreeBSD-focused events to help provide a venue for sharing knowledge, to work together on projects, and to facilitate collaboration between developers and commercial users. This all helps provide a healthy ecosystem. We support the non-FreeBSD events to promote and raise awareness of FreeBSD, to increase the use of FreeBSD in different applications, and to recruit more contributors to the Project.


Check out some of the advocacy and education work we did last quarter:

- Organized the 2019 Bay Area FreeBSD Vendor and Developers Summit
  in Santa Clara, CA
- Presented at COSCON '19 in Shanghai, China
- Represented FreeBSD at All Things Open 2019, in Raleigh, North Carolina
- Industry Partner Sponsor for LISA '19 in Portland, OR
- Silver Sponsor of OpenZFS in San Francisco, CA
- Gave a technical presentation at School of Mines in Golden, CO
- Presenting and representing FreeBSD at Seagl, in Seattle, WA
- Presented at Open Source Summit Europe in Lyon France
- Committed to sponsoring LinuxConfAu 2020, in Gold Coast, Australia in
  addition to holding a FreeBSD Mini-Conf
- Accepted to present at the BSD Dev Room at FOSDEM '20, in Brussels, Belgium
- Accepted to have a stand at FOSDEM '20, in Brussels, Belgium
- Committed to sponsoring FOSSASIA 2020, in Singapore
- Committed to hold FreeBSD Day at SCALE 18x, in Pasadena, CA

We continued producing FreeBSD advocacy material to help people promote
FreeBSD. Learn more about our efforts in 2019 to advocate for FreeBSD:
https://www.freebsdfoundation.org/blog/2019-in-review-advocacy/

Our Faces of FreeBSD series is back. Check out the latest post: Mahdi Mokhtari.
https://www.freebsdfoundation.org/blog/faces-of-freebsd-2019-mahdi-mokhtari/

Read more about our conference adventures in the conference recaps and trip
reports in our monthly newsletters:
https://www.freebsdfoundation.org/news-and-events/newsletter/

We help educate the world about FreeBSD by publishing the professionally
produced FreeBSD Journal. As we mentioned previously, the FreeBSD Journal is
now a free publication. Find out more and access the latest issues at
https://www.FreeBSDfoundation.org/journal/.

You can find out more about events we attended and upcoming events at
https://www.FreeBSDfoundation.org/news-and-events/.

We have continued our work with a new website developer to help us improve our
website. Work has begun to make it easier for community members to find
information more easily and to make the site more efficient.

### Legal/FreeBSD IP ###

The Foundation owns the FreeBSD trademarks, and it is our responsibility to
protect them. We also provide legal support for the core team to investigate
questions that arise.

Go to http://www.FreeBSDfoundation.org to find out how we support FreeBSD and
how we can help you!
