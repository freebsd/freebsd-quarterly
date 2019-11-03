## FreeBSD Foundation ##

Contact: Deb Goodkin <deb@FreeBSDFoundation.org>

The FreeBSD Foundation is a 501(c)(3) non-profit organization dedicated to
supporting and promoting the FreeBSD Project and community worldwide.
Funding comes from individual and corporate donations and is used to fund
and manage software development projects, conferences and developer summits,
and provide travel grants to FreeBSD contributors. The Foundation purchases
and supports hardware to improve and maintain FreeBSD infrastructure and
provides resources to improve security and quality assurance efforts;
publishes marketing material to promote, educate, and advocate for the
FreeBSD Project; facilitates collaboration between commercial vendors and
FreeBSD developers; and finally, represents the FreeBSD Project in executing
contracts, license agreements, and other legal arrangements that require a
recognized legal entity.

Here are some highlights of what we did to help FreeBSD last quarter:

### Partnerships and Commercial User Support ###
We help facilitate collaboration between commercial users and FreeBSD
developers. We also meet with companies to discuss their needs and bring
that information back to the Project. In Q3, Ed Maste and Deb Goodkin met
with a few commercial users in the US. It is not only beneficial for the
above, but it also helps us understand some of the applications where
FreeBSD is used. We were also able to meet with a good number of commercial
users at vBSDCon and EuroBSDCon. These venues provide an excellent
opportunity to meet with commercial and individual users and contributors
to FreeBSD.

### Fundraising Efforts ###
Our work is 100% funded by your donations. We are continuing to work hard
to get more commercial users to give back to help us continue our work
supporting FreeBSD. More importantly, we'd like to thank our individual
donors for making $10-$1,000 donations last quarter, for more than $16,000!

Please consider
[making a donation](https://www.FreeBSDfoundation.org/donate/) to help us
continue and increase our support for FreeBSD!

We also have the Partnership Program, to provide more benefits for our
larger commercial donors.  Find out more information at
[www.FreeBSDfoundation.org/FreeBSD-foundation-partnership-program/](https://www.FreeBSDfoundation.org/FreeBSD-foundation-partnership-program/) 
and share with your companies.

### OS Improvements ###
The Foundation supports software development projects to improve the FreeBSD
operating system through our full time technical staff, contractors, and
project grant recipients. They maintain and improve critical kernel
subsystems, add new features and functionality, and fix problems. 

Over the last quarter there were 345 commits to the FreeBSD base system
repository sponsored by the FreeBSD Foundation - this represents about
one fifth of all commits during this period.  Many of these projects have
their own entries in this quarterly report (and are not repeated here).

Foundation staff member Konstantin Belousov committed many improvements to
multiple kernel subsystems, as well as low-level 32- and 64-bit x86
infrastructure.  These included fixes for robust mutexes, unionfs, the
out of memory (OOM) handler, and per-cpu allocators.

Additional work included fixes for security issues and introduction and
maintenance of vulnerability mitigations, and improving POSIX conformance.

Ed Maste committed a number of minor security bug fixes and improvements,
as well as the first iteration of a tool for editing the mitigation control
ELF note. Additional work included effort on build infrastructure and the
tool chain.

Clang's integrated assembler (IAS) is now used more widely, as part of the
path to retiring the assembler from GNU bintuils 2.17.50. The readelf tool
now decodes some additional ELF note information.

Ed also enabled the Linuxulator (Linux binary support layer) on arm64, and
added a trivial implementation of the renameat2 system call (handling common
options).

Mark Johnston added Capsicum support to a number of ELF Tool Chain utilities,
and committed a number of other Capsicum kernel and userland fixes.

Mark worked on a number of changes related to security improvements, including
integration and support of the Syzkaller automated system call fuzzer, and
fixing issues identified by Syzkaller.  Other changes included addressing
failures caused by refcount wraparound, improvements to the `prot_max` memory
protection.  Other work included NUMA, locking, kernel debugging, RISC-V and
arm64 kernel improvements.

Edward Napierala continued working on Linuxulator improvements over the
quarter.  The primary focus continued to be tool improvements - strace is now
more usable for diagnosing issues with Linux binaries running under the
Linuxulator.  That said, as with previous work a number of issues have been
fixed along the way.  These are generally minor issues with a large impact -
for example, every binary linked against up-to-date glibc previously
segfaulted on startup.  This is now fixed.

### Continuous Integration and Quality Assurance ###
The Foundation provides a full-time staff member who is working on improving
our automated testing, continuous integration, and overall quality assurance
efforts.

During the third quarter of 2019, Foundation staff continued to improve the
project's CI infrastructure, worked with contributors to fix the failing build
and test cases, and worked with other teams in the Project for their testing
needs.  We added several new CI jobs and worked on getting the hardware
regression testing lab ready.

Li-Wen Hsu gave presentations "Testing/CI status update" and "How to work with
the FreeBSD CI system" at the
[201909 DevSummit](https://wiki.freebsd.org/DevSummit/201909).
Slides are available at the DevSummit page.

We continue publishing the CI weekly report on the
[freebsd-testing@](https://lists.freebsd.org/mailman/listinfo/freebsd-testing).
mailing list, and an [archive](https://hackmd.io/@freebsd-ci) is available.

See the FreeBSD CI section of this report for completed work items and
detailed information.

### Supporting FreeBSD Infrastructure ###
The Foundation provides hardware and support to improve the FreeBSD
infrastructure.  Last quarter, we continued supporting FreeBSD hardware
located around the world.

### FreeBSD Advocacy and Education ###
A large part of our efforts are dedicated to advocating for the Project.
This includes promoting work being done by others with FreeBSD; producing
advocacy literature to teach people about FreeBSD and help make the path to
starting using FreeBSD or contributing to the Project easier; and attending
and getting other FreeBSD contributors to volunteer to run FreeBSD events,
staff FreeBSD tables, and give FreeBSD presentations.

The FreeBSD Foundation sponsors many conferences, events, and summits around
the globe.  These events can be BSD-related, open source, or technology events
geared towards underrepresented groups.  We support the FreeBSD-focused events
to help provide a venue for sharing knowledge, to work together on projects,
and to facilitate collaboration between developers and commercial users.
This all helps provide a healthy ecosystem. We support the non-FreeBSD events
to promote and raise awareness of FreeBSD, to increase the use of FreeBSD in
different applications, and to recruit more contributors to the Project.

Check out some of the advocacy and education work we did last quarter:
* Sponsored USENIX 2019 Annual Technical Conference as an Industry Partner
* Represented FreeBSD at OSCON 2019 in Portland, OR
* Represented FreeBSD at COSCUP 2019 in Taiwan
* Presented at the Open Source Summit, North American in San Diego, CA
* Executive Director Deb Goodkin was interviewed by TFiR https://www.freebsdfoundation.org/news-and-events/latest-news/tfir-interview-freebsd-meets-linux-at-the-open-source-summit/
* Sponsored FreeBSD Hackathon at vBSDcon 2019 in Reston, VA
* Sponsored the attendee bags and attended vBSDcon 2019 in Reston VA
* Represented FreeBSD at APNIC-48 in Chiang Mai, Thailand
* Represented FreeBSD at MNNOG-1 in Ulaanbaatar, Mongolia
* Served as an administrator for the Project’s Google Summer of Code Session. See the Google Summer of Code section of this report for more information.
* Sponsored FreeBSD Developers Summit at EuroBSDCon in Lillehammer, Norway
* Sponsored and attended EuroBSDcon 2019 in Lillehammer, Norway
* Applied and was accepted for a FreeBSD Miniconf at linux.conf.au, in Gold Coast, Australia, Jan 14, 2020
* Our FreeBSD talk was accepted at seaGL, Seattle, WA, November 15 and 16.

We continued producing FreeBSD advocacy material to help people promote
FreeBSD.  Learn more about our recent efforts to advocate for FreeBSD
around the world: https://www.freebsdfoundation.org/blog/freebsd-around-the-world/

Our Faces of FreeBSD series is back. Check out the latest post:
[Roller Angel](https://www.freebsdfoundation.org/blog/faces-of-freebsd-2019-roller-angel/).

Read more about our conference adventures in the conference recaps and trip
reports in our monthly newsletters:
https://www.freebsdfoundation.org/news-and-events/newsletter/

We help educate the world about FreeBSD by publishing the professionally
produced FreeBSD Journal. As we mentioned previously, the FreeBSD Journal
is now a free publication. Find out more and access the latest issues at
https://www.FreeBSDfoundation.org/journal/.

You can find out more about
[events we attended and upcoming events](https://www.FreeBSDfoundation.org/news-and-events/).

We opened our official FreeBSD Swag Store.  Get stickers, shirts, mugs and
more at [ShopFreeBSD](https://www.zazzle.com/store/shopfreebsd).

We have continued our work with a new website developer to help us improve
our website.  Work has begun to make it easier for community members to find
information and to make the site more efficient.

### Legal/FreeBSD IP ###
The Foundation owns the FreeBSD trademarks, and it is our responsibility to
protect them.  We also provide legal support for the core team to investigate
questions that arise.

Go to http://www.FreeBSDfoundation.org to find out how we support FreeBSD and
how we can help you!
