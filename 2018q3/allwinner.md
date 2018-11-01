## Allwinner SoC Support

Contact: Emmanuel Vadot <manu@FreeBSD.org>

  * SPI driver added for A64 SoC
  * Thermal driver added/fixed for A64/H3/H5 SoCs
  * Lot of bugs where fixed in the mmc driver, stability should be better
  * New driver for AXXP803 which is the power chip companion of the A64 SoC
  * Add overlays to use another timer controller as the default one in A64 if faulty
    These overlay is enabled in the PINE64/LTS images by default
 