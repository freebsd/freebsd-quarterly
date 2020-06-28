## i.MX 8M support ##

Link:	 [D25274](https://reviews.freebsd.org/D25274)

Contact: Oleksandr Tymoshenko <gonzo@FreeBSD.org>

i.MX 8M is the family of application processors from NXP based on Arm® Cortex®-A53 and Cortex-M4 cores.
The initial code drop for the platform support includes CCM driver and clock implementation, GPC driver,
clock tree for i.MX 8M Quad. Most of the drivers from i.MX 6 can be reused for i.MX 8M systems with relatively minor modifications.
Common changes include adding clock support and extending list of FDT compat strings.

With the linked patch FreeBSD successfully booted to multiuser with NFS root on Nitrogen8M SBC.
