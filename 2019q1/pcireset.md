## PCI Express Resets ##

Contact: Konstantin Belousov <konstantinb@mellanox.com>

Sometimes the need appears to reset a device attached to the system,
preferrably without causing the whole machine reboot.  It is easy to
do with USB devices if the physical access is available, you can
re-plug them.  For in-chassis devices, built-in or on add-on cards, it
is not possible to make reset with physical action, unless the device
is hot-plugged.  Nonetheless, for typical modern PCIe device, and most
built-in PCI-emulation devices, the reset can be initiated using
software actions.

If device is real plugged-in PCIe device, then reset can be initiated
by disabling and then re-training PCIe-link by the upstream port
controls.  For most PCI devices, which support PCI power management
specification, proven way is to put the device into D3 (off) and then
return to the previous power state.

FreeBSD missed a way to request user- or driver-initiated reset
conveniently, except by manually fiddle with registers using pciconf,
which is impractival for users, and require a lot of boilerplate code
from drivers.

BUS_RESET_CHILD() method was added to the newbus bus interface, and
implementations added for PCIe bridges and PCI devices.  libdevctl(3)
and devctl(8) provide convenient userspace accessors for applications
and administrators.

During the reset, device driver must stop its operations with the
device.  One way to achieve this is to detach drivers before reset,
and re-attach after.  This is mostly fine for network interfaces, but
e.g. for the NVMe disk it means that all mounted volumes abruptly
disapper from VFS view.  Due to this, BUS_RESET_CHILD() allows
consumer to select either detach/re-attach or suspend/resume driver
actions around the reset.

Mellanox uses the infrastructure to perform reset of the mlx(5) card
after firmware reset without server reboot.  It is believed that
'devctl reset' will be more widely useful.

Sponsor: Mellanox Technologies
