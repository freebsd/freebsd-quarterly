## Fenestras X random(4) ##

Link:	 [SVN revision 1/3](https://svnweb.freebsd.org/base?view=revision&revision=366620)  
Link:	 [SVN revision 2/3](https://svnweb.freebsd.org/base?view=revision&revision=366621)  
Link:	 [SVN revision 3/3](https://svnweb.freebsd.org/base?view=revision&revision=366622)  
Link:	 [FX Design (PDF)](https://aka.ms/win10rng)  
Link:	 [Fortuna Design](https://www.schneier.com/academic/fortuna/)

Contact: Conrad Meyer <cem@FreeBSD.org>  
Contact: FreeBSD CSPRNG group <csprng@FreeBSD.org>  

Since FreeBSD 11, the default `random(4)` implementation is based on the
*Fortuna* (2003) design by Ferguson and Schneier.  At a high level, *Fortuna*
accumulates entropy into a series of pools, and reseeds a single generator from
some of these pools according to some criteria.

In 2019, Ferguson (at Microsoft) published a whitepaper on the design of the
*Windows 10* system random number generator.  *Fenestras X* is a `random(4)`
implementation based on the published *Windows 10* design.

The *Fenestras X* / *Windows 10* design is similar to *Fortuna*, so it is
probably most interesting to describe their differences:

  * *Fenestras X* has per-CPU generators seeded from a root generator.
    *Fortuna* only has the root generator.  This change eliminates lock
    contention between `random(4)` readers running on multiple cores.
  * Generators in *Fenestras X* form a tree from the root RNG.  When read,
    generators efficiently check if their parent generator has been seeded with
    newer entropy.  If so, child generators reseed themselves before serving
    the read operation.  This is integrated with `arc4random(9)`, as well as
    userspace `arc4random(3)`.
  * *Fenestras X* generators are buffered.  Requests smaller than some
    arbitrary threshold (currently 128 bytes) are served from the buffer.
    Bytes read from the buffer are securely erased when they are consumed.  The
    buffer is refreshed if the request consumes more bytes than were available
    in the buffer.  This amortizes the cost of rekeying and generating output
    from a cryptographic CTR-mode cipher, which is especially slow with AES.

There are other important differences, and readers interested in system CSPRNGs
should read Ferguson's whitepaper.  It is short and accessible.  For more
information on the FreeBSD implementation, please see the SVN commit messages
— especially `r366620`.

The *Fenestras X* implementation is available in `CURRENT`, but disabled by
default.  (The default remains *Fortuna*.)  At this time, you must set the
`RANDOM_FENESTRASX` option in your custom kernel configuration and rebuild your
kernel to use the new design.  There are no known bugs or weaknesses relative
to the *Fortuna* implementation.

Future work and call to action:

  * Additional design review, implementation review, and testing is welcome.
  * Additional entropy sources: we could use implementations of some of the
    sources described in the whitepaper, in both *Fortuna* and *Fenestras X*.
    In particular, we're missing a jitter entropy source.
