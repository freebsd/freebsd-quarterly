### FreeBSD Foundation Update ###
Contact: Deb Goodkin <deb@FreeBSDFoundation.org>

The FreeBSD Foundation is a 501(c)(3) non-profit organization dedicated to supporting and promoting the FreeBSD Project and community worldwide. Funding comes from individual and corporate donations and is used to fund and manage software development projects, conferences and developer summits, and provide travel grants to FreeBSD contributors. The Foundation purchases and supports hardware to improve and maintain FreeBSD infrastructure and provides resources to improve security, quality assurance, and release engineering efforts; publishes marketing material to promote, educate, and advocate for the FreeBSD Project; facilitates collaboration between commercial vendors and FreeBSD developers; and finally, represents the FreeBSD Project in executing contracts, license agreements, and other legal arrangements that require a recognized legal entity.

Here are some highlights of what we did to help FreeBSD last quarter:

We held our annual board meeting in Ottawa on May 14. Board Director and Officer elections take place each year at this meeting.  Justin Gibbs was elected as the new President of the Board of Directors. The new FreeBSD Foundation Board of Directors includes President and Founder Justin T. Gibbs, Vice President Benedict Reuschling, Secretary Philip Paeps, Treasurer Marshall Kirk McKusick, and Directors Hiroki Sato, George Neville-Neil and Robert N. M. Watson. You can read more about the elections at: <https://www.freebsdfoundation.org/news-and-events/latest-news/freebsd-foundation-names-justin-gibbs-as-new-board-president/>.

After the elections, our management team gave updates to the board on their respective areas. We then discussed the key areas of the Project that need help, and where we can step in to fill those holes. We reviewed and updated our 12 month goals, and identified projects we should support. We then discussed conferences we are likely to attend, and went over the latest on our fundraising efforts. We followed that up with a discussion on how to get more users to contribute back to the Project. While discussing how to increase the number of users and contributors, we talked about methods for making for more training material available.


### Partnerships and Commercial User Support ###
We help facilitate collaboration between commercial users and FreeBSD developers. We also meet with companies to discuss their needs and bring that information back to the Project. In Q2, Ed Maste and Deb Goodkin met with a few commercial users in Germany. It’s not only beneficial for the above, but it also helps us understand some of the applications where FreeBSD is used. Because BSDCan brings in a high number of commercial users, we have an excellent opportunity to have similar discussions about their needs during the four-day FreeBSD Summit and BSDCan.


### Fundraising Efforts ###
Our work is 100% funded by your donations. We are grateful for the generous donations from Intel, NetApp, VMware and Stormshield last quarter. We are working hard to get more commercial users to give back to help us continue our work supporting FreeBSD. More importantly, we’d like to thank our individual donors, for making $10-$1,000 donations last quarter, for a total of $16,000! 

Please consider making a donation to help us continue and increase our support for FreeBSD: https://www.FreeBSDfoundation.org/donate/.

We also have the Partnership Program, to provide more benefits for our larger commercial donors. Find out more information at https://www.FreeBSDfoundation.org/FreeBSD-foundation-partnership-program/ 
and share with your companies!

### OS Improvements ###
The Foundation improves the FreeBSD operating system by employing our technical staff to maintain and improve critical kernel subsystems, add features and functionality, and fix problems. The foundation also provides grants to fund individual projects.

There were 243 commits to the FreeBSD base system repository sponsored by the Foundation during the quarter. These include improvements to the tmpfs in-memory, MSDOS, and UFS filesystems, device driver and hardware compatibility fixes, virtual memory (VM), tool chain, documentation, and testing and continuous integration improvements. 

We fixed a number of race conditions and security issues found by Syzkaller, Google’s code-coverage-guided system call fuzzer.

Alan Somers’ work on updating FreeBSD’s support for FUSE (userspace filesystems) continued during the quarter; the full details are elsewhere in this quarterly report. At this point most of the work has been committed to the project branch but some bug fixes and improvements have been committed directly to the FreeBSD development branch.

Edward Napierala’s Linuxulator project continued through the quarter, resulting in a number of improvements to the Linuxulator and linux-specific functionality such as linsysfs. This work is part of the path to supporting the Linux strace debugging tool in order to facilitate debugging failures of other Linux binaries under the Linuxulator. Mateusz Guzik continued with scalability and performance improvements during the quarter, and Bjoern Zeeb integrated the SDIO stack (with details elsewhere in the quarterly report).

Progress was made on the online RAID-Z expansion project over the quarter. Matt Ahrens posted an [alpha preview](https://github.com/zfsonlinux/zfs/pull/8853) of the feature for further experimentation and review, and the FreeBSD Foundation will make an alpha release image available for testing in the near future.
 
Foundation staff contributed to nine FreeBSD security advisories and errata updates over the quarter, including CPU vulnerability workarounds. Related work included improving Intel microcode update loading.

### Continuous Integration and Quality Assurance ###
The Foundation provides a full-time staff member who is working on improving our automated testing, continuous integration, and overall quality assurance efforts.

During the second quarter of 2019, Foundation staff continued to improve the project's CI infrastructure, worked with contributors to fix the failing build and test cases, and worked with other teams in the Project for their testing needs.  We hosted a CI-focused working group at BSDcan and continue to publish the  CI weekly report at [freebsd-testing@](https://lists.freebsd.org/mailman/listinfo/freebsd-testing) mailing list.

See the FreeBSD CI section of this report for more information.


### Supporting FreeBSD Infrastructure ###
The Foundation provides hardware and support to improve the FreeBSD infrastructure. Last quarter, we continued supporting FreeBSD hardware located around the world.

### FreeBSD Advocacy and Education ###
A large part of our efforts are dedicated to advocating for the Project. This includes promoting work being done by others with FreeBSD; producing advocacy literature to teach people about FreeBSD and help make the path to starting using FreeBSD or contributing to the Project easier; and attending and getting other FreeBSD contributors to volunteer to run FreeBSD events, staff FreeBSD tables, and give FreeBSD presentations.

The FreeBSD Foundation sponsors many conferences, events, and summits around the globe. These events can be BSD-related, open source, or technology events geared towards underrepresented groups. We support the FreeBSD-focused events to help provide a venue for sharing knowledge, to work together on projects, and to facilitate collaboration between developers and commercial users. This all helps provide a healthy ecosystem. We support the non-FreeBSD events to promote and raise awareness of FreeBSD, to increase the use of FreeBSD in different applications, and to recruit more contributors to the Project.

Check out some of the advocacy and education work we did last quarter:
* Represented FreeBSD at LinuxFest Northwest In Bellingham, Washington
* Sponsored and helped organize the FreeBSD Developers Summit at BSDCan, in Ottawa, Canada
* Sponsored and attended BSDCan 2019
* Set up registration and attended the Vienna FreeBSD Security Hackathon in Vienna, Austria
* Represented FreeBSD at HKOSCON
* Attended the Berlin FreeBSD Developers Summit
* Presented at 2019 Comcast Labs Connect Open Source Conference
* Sponsored, presented and represented FreeBSD at RootConf 2019 in Bangalore, India
* Committed to attend OSCON, and All Things Open
* Committed to sponsor and help organize a Bay Area Developers Summit
* Provided FreeBSD advocacy material
* Provided travel grants to FreeBSD contributors to attend many of the above events

We continued producing FreeBSD advocacy material to help people promote FreeBSD around the world.

Read more about our conference adventures in the conference recaps and trip reports in our monthly newsletters: https://www.freebsdfoundation.org/news-and-events/newsletter/

We help educate the world about FreeBSD by publishing the professionally produced FreeBSD Journal. As we mentioned previously, the FreeBSD Journal is now a free publication. Find out more and access the latest issues at https://www.FreeBSDfoundation.org/journal/.

You can find out more about events we attended and upcoming events at https://www.FreeBSDfoundation.org/news-and-events/.

We have continued our work with a new website developer to help us improve our website. Work has begun to make it easier for community members to find information more easily and to make the site more efficient.

### Legal/FreeBSD IP ###
The Foundation owns the FreeBSD trademarks, and it is our responsibility to protect them. We also provide legal support for the core team to investigate questions that arise.

Go to http://www.FreeBSDfoundation.org to find out how we support FreeBSD and how we can help you!
