## ARMv6 and ARMv7 image now use EFI loader

Contact: Emmanuel Vadot <manu@FreeBSD.org>

Instead of using the ubldr version of the loader which uses the U-Boot
API, all images now use loader.efi as their primary FreeBSD loader.
This allow us to have a common boot path for all arm and arm64 image.
