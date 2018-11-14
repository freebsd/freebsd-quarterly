## FreeBSD Core Team

Contact: FreeBSD Core Team <core@FreeBSD.org>

Much of Core's focus for the past months has been on three items.

1. We have been coordinating between different groups to support the upcoming 12.0 release.  For example, the timing of the OpenSSL 1.1.1 release has posed challenges.  The new OpenSSL version includes API changes, so many components of the base system and ports require changes.  Staying with the older OpenSSL in 12.0 in not a feasible option, because it would mean backporting many changes to a version of OpenSSL that will soon be unsupported.

2. We have begun discussions with the release engineering team and Scott Long about updating our release process.  Topics we are exploring include having more frequent point releases, changing the support model, and revising and improving the tooling used to manage the tree and releases.  More to come.

3. We are working to gather information to make more data-driven decisions.  For example, we are planning developer and user surveys.  If you have questions that you think should be added to the survey, please discuss them on freebsd-arch@.  We are exploring ways for automated user-driven hardware usage data to understand the changing ways our software is used and to target better hardware support.

Here are other noteworthy events (in chronological order) since the last quarterly report.

2017 Q4
- Sean Eric Fagan's (sef) commit bit was reactivated with a period of re-mentoring under Alexander Motin (mav).
- The MIPS architecture was promoted to tier 2 status.
- Core approved changes to the Code of Conduct.
- All fortune data files, except freebsd-tips, were removed in r325828.
- Core approved the adoption of a policy requiring any license exceptions to be recorded alongside code.
- Gordon Tetlow (gordon) became the new security officer.
- Core approved the use of SPDX tags.

2018 Q1
- Jeb Cramer (jeb) was awarded a src commit bit under the mentorship of Sean Bruno (sbruno) and Eric Joyner (erj).
- Members of the CoC Review Team were approved.  The membership is to be reviewed once per year.
- A vendor commit bit was awarded to Slava Shwartsman (slavash) of Mellanox Technologies under the mentorship of Konstantin Belousov (kib) and Hans Petter Selasky (hselasky).
- Walter Schwarzenfeld was awarded project membership.
- Brad Davis (brd) was awarded a src commit bit under the mentorship of Allan Jude (allanjude) with Baptiste Daroussin (bapt) as co-mentor.
- Vincenzo Maffione (vmaffione) was awarded a src commit bit under the mentorship of Hiroki Sato (hrs).
- Ram Kishore Vegesna (ram) was awarded a src commit bit under the mentorship of Kenneth D. Merry (ken) and Alexander Motin (mav).

2018 Q2
- Tom Jones (thj) was awarded a src commit bit under the mentorship of Jonathan T. Looney (jtl).
- Matt Macy's (mmacy) commit bit was restored under the mentorship of Sean Bruno (sbruno).
- Breno Leitao (leitao) was awarded a src commit bit under the mentorship of Justin Hibbits (jhibbits) with Nathan Whitehorn (nwhitehorn) as co-mentor.
- Leandro Lupori (luporl) was awarded a src commit bit under the mentorship of Justin Hibbits (jhibbits) with Nathan Whitehorn (nwhitehorn) as co-mentor.
- The handover from the ninth to the tenth elected Core team took place.  The new Core members are: Allan Jude (allanjude), Benedict Reuschling (bcr), Brooks Davis (brooks), Hiroki Sato (hrs), Warner Losh (imp), Jeff Roberson (jeff), John Baldwin (jhb), Kris Moore (kmoore), and Sean Chittenden (seanc).
- Joseph Mingrone (jrm) was appointed the Core secretary under mentorship of the retiring Core secretary, Matthew Seaman (matthew).
- The new team liaisons were decided.  portmgr: Sean, doceng: Hiroki, secteam: Brooks, re: John, clusteradm: Allan, CoC: Warner, Foundation: Benedict, bugmeister: John, CI: Sean.
- David Maxwell (dwm) was awarded project membership.
- Daichi Goto's (daichi) commit bit was reactivated with a period of re-mentoring under George Neville-Neil (gnn).
- A vendor commit bit was awarded to Ben Widawsky (bwidawsk) of Intel under the mentorship of Ed Maste (emaste).

2018 Q3
- Core decided to begin meeting twice per month in an attempt to catch up with many new agenda items.
- Li-Wen Hsu (lwhsu) was awarded a src commit bit under the mentorship of Mark Johnston (markj) with Ed Maste (emaste) as co-mentor.
- Samy al Bahra was awarded project membership.
- George Neville-Neil (gnn) was approved to begin co-mentoring Vincenzo Maffione (vmaffione).
