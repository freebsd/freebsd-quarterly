## PWM Kernel API and userland utility ##

Contact: Emmanuel Vadot, <manu@FreeBSD.org>

A new subsystem was added to the kernel for PWM drivers to register themselves.
In pair with the kernel subsystem, a pwm(8) utility is also available so users
can configure PWM on their embedded boards.
For now the only PWM driver compatible with this subsystem is for ARM Allwinner SoCs.
