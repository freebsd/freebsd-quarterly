## libvdsk - QCOW2 implementation ##

Contact: Sergiu Weisz, <sergiu121@gmail.com>
Contact: Marcel Molenaar, <marcel@freebsd.org>
Contact: Marcelo Araujo, <araujo@freebsd.org>
Contact: Mihai Carabas, <mihai@freebsd.org>

Link:	[Github - libvdsk repo](https://github.com/xcllnt/libvdsk)

Add support for using QCOW in bhyve using the libvdsk library. Libvdsk was used
to substitute the regular disk operations from bhyve with a call to libvdsk
which will in turn call the disk-specific handler for the operation.

To use this feature one has to install the libvdsk-enabled bhyve version along
with libvdsk from the libvdsk repo linked above.

New features added:

   * Extend libvdsk to make it easier to implement new formats
   * Improve read/write performance and stability
   * Add support for Copy-On-Write

Future tasks:

   * Integrate libvdsk in bhyve

Sponsor: Matthew Grooms
