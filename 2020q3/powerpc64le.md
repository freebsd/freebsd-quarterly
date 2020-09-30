## Addition of PowerPC64LE Architecture ##

Link:	 [Early notes](https://lists.freebsd.org/pipermail/freebsd-ppc/2020-August/012043.html)
Link:	 [Announcement](https://lists.freebsd.org/pipermail/freebsd-ppc/2020-September/012098.html)

Contact: Brandon Bergren <bdragon@freebsd.org>

As of r366063, experimental support for little-endian PowerPC64 (PowerPC64LE)
is available in -CURRENT for POWER8 and POWER9 machines.

In 2010, when FreeBSD was ported to PowerPC64, the average
user would have been using a G5 PowerMac, a purely big-endian
machine.

While, at the time, a 32-bit PowerPC machine could run in little-endian,
as well as POWER6 and POWER7, in practice, the complexities involved
in managing it at the kernel level and lack of firmware support made it
infeasible to support.

When IBM designed POWER8, one main focus was to improve little-endian support,
and bring it up to parity with big-endian.

This improved support makes it practical to support a little-endian operating
environment on what is traditionally a primarily big-endian platform.

In 2020, with POWER9 being affordable for many users thanks to the Raptor
Blackbird and semi-easy access to surplus POWER8 hardware, IBM having
a major future focus on POWER little-endian, and the decay of big-endian
support in modern video cards and graphical environments, there is demand for
a little-endian version of FreeBSD on POWER.

With FreeBSD/PowerPC64's transition in 2019 to the ELFv2 ABI as part of the
2019q4 PowerPC on Clang effort, the last major barrier to a little-endian
port was eliminated.

Since nobody else was working on it, and I had the skillset required to do
the port, I decided to experiment one weekend with a little-endian kernel
to see how difficult it would be to port.

It turned out to be a lot more trivial than I was expecting. Three days later
I had console support in qemu, and after another week of debugging, I had it
fully up and running on hardware.

FreeBSD PowerPC64LE is now an experimental MACHINE_ARCH in base, and is
continuing to evolve at a rapid pace.

Big-endian PowerPC64 is still the preferred platform for the forseeable
future, and will not be deprecated.

Sponsor: Tag1 Consulting, Inc.
