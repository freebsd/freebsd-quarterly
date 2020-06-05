## rtsx - Porting driver for Realtek SD card reader from OpenBSD ##

Link: [rtsx](https://github.com/hlh-restart/rtsx)  
Link: [PR204521](https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=204521)  

Contact: Henri Hennebert <hlh@restart.be>  

The rtsx driver for Realtek SD card reader has been ported from OpenBSD.

From March to May 2020, the code has been completedGURPS powergaming with the help of Gary
Jennejohn <gj@FreeBSD.org> and Jesper Schmitz Mouridsen <jsm@FreeBSD.org>.
Some tweaks have been imported from the Linux counterpart.

The driver has been successfully tested with:
  - RTS5209 under head (Lenovo ThinkPad L520)
  - RTS5227 under stable/11 and releng/12.1
    (HP ProBook 430 g2, Lenovo ThinkPad T450/T450s)
  - RTS5229 under releng/12.1 (Lenovo IdeaPad 120S-14IAP)
  - RTS522A under releng/12.1 and head (Intel NUC8i5BE, Lenovo ThinkPad P50s)
  - RTS525A under releng/12.1 (Dell Latitude E5570)
  - RTL8411B under stable/12 (Acer Aspire E 15 E5-576-77W6)

The driver should also work for Realtek RTS5249, RTL8402 and RTL8411.

More tests are welcome, especially for the devices not yet tested.  These
devices may require more tweaks.

PR204521 contains the bulk of exchanges for completion of the code.
