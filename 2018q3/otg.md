## Device Mode USB

Contact: Edward Tomasz Napierala, <trasz@FreeBSD.org>

Link:	 [Handbook chapter](https://www.freebsd.org/doc/en_US.ISO8859-1/books/handbook/usb-device-mode.html)

Many embedded boards include hardware which supports device
side USB - the ability for the board to present itself to another
system as a USB drive, network adapter, or a virtual serial port.
FreeBSD USB stack has supported this functionality for quite some
time, but it wasn't used to its full extent.

The goal of this project was to fix that - to document the
functionality, possibly fix some bugs, and to make it easy
to use, automating it as much as possible.

Starting with FreeBSD 12.0, this functionality is enabled
out of the box.  This means you can connect your BeagleBone
Black's (using its USB client socket) or a Raspberry Pi 0
(using the OTG port) to your laptop, and you'll get a virtual
USB serial port, which serves as a system console, with getty(8)
waiting for you to log in.  This means you no longer need to
look for a keyboard and a screen, or mess with the console
cables just to configure your system.  You can also switch
it to provide network interface, or present itself as a USB
drive - it's all documented in the FreeBSD Handbook.

