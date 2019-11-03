## gets(3) retirement ##

Contact: Ed Maste <emaste@FreeBSD.org>  

gets is an obsolete C library routine for reading a string from standard
input.  It was removed from the C standard as of C11 because there was no
way to use it safely.  Prompted by a comment during Paul Vixie's talk at
vBSDCon 2017 I started investigating what it would take to remove gets
from libc.

[The patch](https://reviews.freebsd.org/D12298) was posted to Phabricator
and refined several times, and the portmgr team performed several
[exp-runs](https://bugs.freebsd.org/222796) to identify ports broken by
the removal.  Symbol versioning is used to preserve binary compatibility
for existing software that uses gets.  

The change was committed in September, and will be in FreeBSD 13.0.

Sponsor: The FreeBSD Foundation  
