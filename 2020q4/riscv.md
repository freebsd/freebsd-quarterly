## FreeBSD/RISC-V Project ##

Link:	 [Wiki](https://wiki.freebsd.org/riscv)  

Contact: Mitchell Horne <mhorne@FreeBSD.org>  
Contact: [freebsd-riscv Mailing List](https://lists.FreeBSD.org/mailman/listinfo/freebsd-riscv)  
Contact: IRC #freebsd-riscv on freenode  

The FreeBSD/RISC-V project is providing support for running FreeBSD on the
[RISC-V Instruction Set Architecture](https://riscv.org/).

This quarter saw a number of improvements and bugfixes from committers and
contributors alike. A few small items from this quarter:
 - Added riscv64 LINT kernel config plus CI job (`FreeBSD-head-riscv64-LINT`)
 - Switched `emulators/riscv-isa-sim` to official upstream and updated to
   2020-11-02 snapshot
 - Created `sysutils/u-boot-sifive-fu540`, a u-boot port for the HiFive
   Unleashed
 - Improved SBI extension support

Further progress was made this quarter in building ports for RISC-V. Build and
runtime issues with large dependencies `devel/python-setuptools` and
`devel/glib20` were fixed, enabling several thousand skipped ports. There is
some in-progress work to address failures in other significant ports, such as
`devel/nspr` and `databases/sqlite3`. By addressing some of these small-effort
issues, some 15000+ ports can now be built for the platform with
qemu-user-static.

Finally, December saw the arrival of the first `riscv64` weekly development
snapshots. This includes the usual memstick installer, a virtual machine image,
and a generic SD card image. There are still some minor tweaks to be made, but
this marks a significant step forward for the platform, and lowers the barrier
of entry for running a FreeBSD/RISC-V system. This also means that FreeBSD 13
will likely be the first downloadable release for the architecture. For those
interested in trying out the VM image for themselves, see the [Quick
Start](https://wiki.freebsd.org/riscv#Quick_Start) instructions on the wiki.
