## if\_bridge ##

Contact: Kristof Provost <kp@FreeBSD.org>  

The current implementation of if\_bridge uses a single mutex to protect its
internal data structures. As a result it’s nowhere near as fast as it could be.
This is relevant for users who want to run many vnet jails or virtual machines
bridged together, for example.

As part of this project several new tests have already been added for
if\_bridge. These are generally very useful for validating any locking changes,
and will also help to prevent regressions for other future changes.  These
tests live in /usr/tests/sys/net/if\_bridge\_test.

The current work is concentrating on investigating if it's possible to leverage
the ConcurrencyKit epoch code for the datapath (i.e. `bridge_input()`,
`bridge_output()`, `bridge_forward()`, ...).

Sponsor:  The FreeBSD Foundation
