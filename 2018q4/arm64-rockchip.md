## RockChip Support

Contact: Emmanuel Vadot <manu@FreeBSD.org>

Early support for the RockChip RK3399 has been commited.
For now it's only possible to netboot boards (Like the RockPro64).
Original patch was submitted by Greg V <greg@unrelenting.technology>.

Support for the RK805 and RK808 PMIC (Power Management IC) has been added.
This allow changing some regulators voltage such as the cores one so cpufreq
support works. You can change core frequencies with sysctl or powerd(8).
