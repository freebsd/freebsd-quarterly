## RockChip Support ##

Contact: <freebsd-arm@FreeBSD.Org>
Contact: Emmanuel Vadot <manu@FreeBSD.Org>
Contact: Michal Meloun <mmel@FreeBSD.Org>

RockChip RK3399 now has USB3 support, some configuration such as device mode
are still not supported however host mode should work on any board.

Support for SPI has been committed which enables ability to interact with SPI
flash if present.

All regulators for the RK808 PMIC (Power Management IC) have been added.

All clocks are now supported which completes clock and reset implementation,
previously only clocks from devices with drivers were supported.

The TS-ADC (Temperature Sensor ADC) is now supported, this adds the ability
to read temperature of the CPU and GPU via sysctl hw.temperature .

Initial PCIe support has been committed and verified working on several
different boards.
Known working devices are NVMe devices and PCIe cards that doesn't utilize PCIe
switching or bridge functionality.

Card Detection for SDCard on RK3328 and RK3399 is now supported. There is still
some problems if the board is using a GPIO for CD instead of the internal detection
mechanism.
