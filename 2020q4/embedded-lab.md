## Embedded Lab Project

Link:	 [FreeBSD Embedded Lab Design](https://www.funkthat.com/gitea/jmg/fbsdembdev)  
Link:	 [Lab API code](https://www.funkthat.com/gitea/jmg/bitelab)  

Contact: John-Mark Gurney <jmg@FreeBSD.org>  

The Embedded Lab Project's goal is to make SBCs and other devices more
accessible to developers.  Despite SBCs often being inexpensive, it is
not inexpensive to maintain them, in terms of the cost of time to keep
them up to date, infrastructure to support them, etc.

The goal of this project is to support and enhance the existing CI work
but also make it easier for developers to test their code and changes
on one, or many different boards.

Once the work is [mostly] complete, I will host a lab that will be freely
available to everyone who has a FreeBSD.org account.  Information about
this will be sent once it is closer to launch.

The core part of the architecture is each time a board is reserved via
the API, a new jail is created which contains the serial console tty,
an interface for internet access, and an interface that is connected
to the board's ethernet port (assuming it has one).  This allows a
clean system for each run, and allows complete control over the network
interfaces to support netbooting and other development.  The jail will
have a basic set of FreeBSD packages installed that matches the board.

Part of the API will also allow power cycling the board to aid in
debugging.  This part is relatively extensible, so adding additional
modules to provide additional support should not be difficult.

The API includes support for running interactive commands in the jail.
This will make it easy to script control of the environment, such as
directly running an expect script against the serial console, or even
just running a script in the jail.

The work is progressing well, and currently a single board, a Pine64
A64-LTS, is integrated and working.  Board reserves and releases are
working, along with the ability to run commands in the jail via the API.
Power control is functional, and is currently using a PoE smart switch
to control power.

Work has stalled on being able to use the [SDWire](https://wiki.tizen.org/SDWire)
with an environment due to power issues.  USB is not made for power
isolation, which is causing issues w/ power control.  The existing
board, the A64-lTS, is using a USB serial console adapter that is
optionally isolated, ensuring that there is no problems w/ power control.  But
there I have not found a solution for high speed USB.  I believe that
cutting the VBUS (power) line of a USB cable would allow fine grain
power control, but tests have not been conducted yet.

Sponsor: The FreeBSD Foundation
