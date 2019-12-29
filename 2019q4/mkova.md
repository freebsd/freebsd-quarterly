## Creating virtual FreeBSD appliances from RE VMDK images ##

Link:    [freebsd-mkova](https://github.com/gonzoua/freebsd-mkova)

Contact: Oleksandr Tymoshenko <gonzo@FreeBSD.org>

OVA is a file format for packaging and distributing virtual appliances: pre-configured virtual machine images. Virtual appliance file contains full VM information like the number of CPUs, amount of memory, list of virtual devices, it also includes disk images. Applications like VirtualBox or VMWare can import OVA files; this process can be easily automated.

freebsd-mkova is a CLI tool to create OVA files using VMDK images provided by FreeBSD RE. For now, only a limited set of attributes can be specified: VM name, number of CPU, amount of memory, and disk size. The tool also does only cursory sanity checks on the VMDK file format, assuming it's a monolithic sparse file and that it has to be converted to the stream-optimized format. The script can be extended to make hardware configuration more flexible and VMDK parser more robust.
