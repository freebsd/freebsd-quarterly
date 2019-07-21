# Aberdeen Hackathon

At BSDCam in Cambridge last year we had a discussion to create a template
Hackathon in the same way we have a template for Devsummits. To test out the
idea I was convinced (I swear tricked is the correct word) to host a Hackathon
in Aberdeen.

As a project I think we benefit a lot from hackathons, but they do take a
little organisation. The worst part of this is dealing with getting money from
attendees so you can pay for events. I spoke with Deb Goodkin from the
foundation at BSDCam and we arranged to use their new EventBrite based system
to handle ticketing.

Overall this system made it straight forward for attendees to register and get
me their details and requirements. After the event the expenses were then
recouped from the foundation. This was much easier than me putting together a
custom system or even setting up and using EventBrite myself.

The hackathon went well, you can read in Benedict and Kristof's reports that
follow, but it was less well attended than I originally expected. 

For hackers planning future hackathons remember to take heed of common national
holidays (we could have planned the event to not land at Easter) and expect
major geopolitical events to make things unpredictable (we knew Brexit would do
something, but not when).

I need to thank the University of Aberdeen for providing the location for the
Hackathon and to encourage you to run a hackathon where you are. The next one
should be in your home town.

## Benedict Reuschling 

The hackathon in Aberdeen was happening in the week of Easter at the University
of Aberdeen. Although only Kristof Provost (kp@) and myself joined our host Tom
Jones, I still consider it a productive week for us.  The overall theme of the
hackathon was networking and each of us provided something towards that goal
(be it PRs, submitting unfinished work, or other bits and pieces). We got
together the night of Tuesday, April 16 over dinner and talked about what our
plans were for the week.

Kristof and I had talked at AsiaBSDcon when I took his tutorial about Testing
in FreeBSD that we should add a chapter about it in the developers handbook. We
also used our first meeting to synchronize each other about the latest news in
FreeBSD from our developers viewpoint.

The next day, we met up at the Frazer Noble building where the hackathon was
taking place. It was one of the newer buildings on campus, nicely integrated
into the older houses of the city. Since we were only a handful, we sat in
Tom's office for the hackathon, which had plenty of room. He also showed us the
room where we are supposed to be having the hackathon if we were more people
and Tom gave us a little tour. Working in a university myself, I'm always
interested in how other education organizations are structured and the rooms
and equipment they provide for learning. Overall, my impression was that there
is a good amount of space and equipment available, which we could have used in
the hackathon.

After returning, we decided to use a special tag in the commits we would be
doing to identify them as coming from this hackathon. We chose "Event:" for it
as it is a general enough term to be used at other events like conferences,
too. The "Sponsored by:" line we used in the past is more for companies or
individuals sponsoring certain features, so I created a review to add this line
to the committers guide.

Kristof had a couple of changes to the pf chapter in the FreeBSD handbook for
me, so I started going through those. I created a review for him and the commit
was made there and then, making use of the short feedback cycle. Originally, we
thought about bringing in people via hangouts, but then resolved to contact
people via our usual IRC channel if we needed their input.

Kristof and Tom worked on some network specific stuff, whereas I started work
on creating an initial draft for the testing chapter. We would occasionally
start talking about something and then return to our work in silence. If we
needed to coordinate or had questions, we simply asked and could continue once
we got our answer. This provided a nice atmosphere to work in. I tackled some
doc PRs while Kristof found a bug in pf and fixed it.

The afternoons were spent at different locations within walking distance. Tom
made sure we got a good impression on how it is to be a student and that there
is both taste and variety of food available. In the evenings, Tom drove us into
town to have dinner at various restaurants over the week.

Aberdeen has a lot to offer as a city. Starting from the second day, Kristof
and I would meet up at my hotel, which was close to the Aberdeen beach and walk
along it to the University. According to Tom, it is possible to see Dolphins
when the weather is right and the gulf stream provides the city with enough
warmth that the winters aren't as bad as you'd think this far up north.

Tom also gave us a tour of the zoological department of the university, which
offered a beautiful garden with various plants and trees, as well as a museum
with zoological specimen. This offered a great spot for photographs and to
unwind a bit from the technical discussions we've had. Tom also had t-shirts
made for the event, which are already rare collectors items.

I had to return on Sunday, so Tom took us on a tour of the Scottish highlands
in his car the day before. We stopped at a couple of places to take pictures
and Tom would explain at lot to us having lived there all his life. We came to
Stonehaven and had fish and chips there from a take-out restaurant that had a
lot of awards for sustainable fishing.  This was certainly a highlight for the
week and even then, we couldn't stop talking about FreeBSD and networking.

Although more people would maybe have produced more output, the three of us
were certainly productive as a small group. It also made planning and
coordination easier and more flexible. Tom Jones had done a lot of preparation
and was an excellent guide. I would encourage him to host another such
hackathon in the future and hope that next time, more people will take a trip
to Aberdeen to spend some time hacking on FreeBSD

## Kristof Provost 

While I’d been to Scotland before I’d never seen Aberdeen. It’s a charming
city, and I enthusiastically recommend visiting.

I arrived a little while after Benedict, but made it to my hotel easily, and
turned up in time to join Benedict and Tom for dinner.

Despite being small (or perhaps because of it), the hackathon was remarkably
productive. Benedict and I went through the pf documentation in the handbook,
so that Benedict could rework and improve it. (Benedict’s doing the work, but
I’m going to take credit anyway.)

Tom and I looked at the GSoC proposals and tried to find potential mentors for
two promising proposals. Both of us are candidate mentors as well. We should
know soon if our students are awarded slots.

Tom also proposed a patch to eliminate RFC 2675 IPv6 Jumbograms. It has my
enthusiastic support.

I managed to look at a couple of open pf issues:

 * pfctl’s interface_group() function checks if a name is an interface or an interface group. It still thought that interface names always ended with a number, but this assumption has been wrong for several years now. That’s fixed in [r346370](https://svnweb.freebsd.org/changeset/base/346370).
 * The DIOCRSETTFLAGS ioctl() misused copyin() (It held a lock calling it), which could result in panics.
 * That previous issue was actually discovered by my local instance of syzcaller, which I’d set up to add pf support to it. That support has now been merged, so we may see more issues detected by syzcaller soon.
 * Also for the DIOCRSETTFLAGS problem I extended the pf tests to check for this issue.
 * The pf tests will now fail if the pft_set_rules call fails to set the rules. That didn’t actually cause issues yet, but it’ll make debugging tests slightly easier, and they may catch more problems now.

On Saturday Tom took us out to discover some of the pretty bits of Scotland. It
turns out there are a lot of them. I can’t really do it justice, but Tom has a
promising career at the Scottish tourism board when this computers fad blows
over.

On my way home I passed through Oslo, and took the opportunity to meet with
(have lunch with) two of the EuroBSDCon local organisers. EuroBSDCon is filling
up fast, make sure to register now to secure your place!
