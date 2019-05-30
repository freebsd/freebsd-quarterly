## PCI Express Resets ##

Contact: Konstantin Belousov <konstantinb@mellanox.com>  

Sometimes the need to reset a device attached to the system presents
itself.  Preferrably this device reset can be accomplished without
causing the whole machine to reboot.  It is easy to do with USB
devices if the physical access is available -- you can just re-plug
the device.  For in-chassis devices, built-in, or on add-on cards,
it is not possible to reset the device with physical action, unless
the device is hot-plugged.  Nonetheless, for typical modern PCIe
devices, and most built-in PCI-emulation devices, the reset can be
initiated using software actions.

If device is a real plugged-in PCIe device, then reset can be
initiated by disabling and then re-training PCIe-link by the upstream
port controls.  For most PCI devices, which support the PCI power
management specification, the proven way to accomplish the reset
is to put the device into state D3 (off) and then return to the
previous power state.

FreeBSD was missing a way to conveniently request user- or
driver-initiated reset of devices. While it was possible to manually
fiddle with registers using pciconf, this is impractical for users,
and requires a lot of boilerplate code from drivers.

A new BUS_RESET_CHILD() method was added to the newbus bus interface,
and implementations added for PCIe bridges and PCI devices.  The
libdevctl(3) library call and devctl(8) command  provide convenient
userspace accessors for applications and administrators.

During the reset, the device driver must stop its operations with
the device.  One way to achieve this is to detach drivers before
reset, and re-attach after the device afterwards.  This is mostly
fine for network interfaces, but other devices require more
coordination to handle properly.  For example, an NVMe disk device
being detached it means that all mounted volumes abruptly disapper
from VFS view.  Due to this, the BUS_RESET_CHILD() method allows
the caller to  select either detach/re-attach or suspend/resume
driver actions around the reset.

Mellanox uses the infrastructure to perform reset of the mlx(5) card
after firmware reset without server reboot.  It is believed that
'devctl reset' will be more widely useful.

Sponsor: Mellanox Technologies  
