## FreeBSD/RISC-V 2018Q4 update

Contact: Ruslan Bukin <br@freebsd.org>

FreeBSD/RISC-V has been one of the actively supported projects during the past year.

On a compiler front we have upstreamed FreeBSD OS-dependent bits for GNU toolchain. It was updated to GCC 8.1 and Binutils 2.30. FreeBSD packages are available.

FreeBSD Testsuite and required dependencies were successfully built for RISC-V and we did a test run: 152 tests failed out of 5186, which demonstrates a very good result for initial run and reveals areas to work on.

We have added support for compressed ISA extension to KDB debugger and DTrace FBT provider enabling C-compressed kernel and userland by default. The output of disassembling instructions in KDB is looking similar to objdump.

QEMU has updated to latest privilege spec allowing us to bringup FreeBSD on it. The emulation is quite fast: it takes one second only to boot FreeBSD to single-user mode in QEMU: https://www.youtube.com/watch?v=FnWpRBaWF18

Platform-Level Interrupt Controller (PLIC) driver was added. Interrupt support was converted to INTRNG.
PLIC is used in QEMU for virtio network and block devices (full FreeBSD distribution can be booted in QEMU).

Network virtualization support (VIMAGE) was fixed and enabled by default now.

In order to support RocketChip and derivatives we had to work on A(accessed), D(dirty) PTE (page table entry) bits management.
We have successfully tested this on a lowRISC board and it is booting to multiuser just fine. lowRISC UART driver was added.

Superuser-User-Modify (SUM) bit in sstatus register is now used: kernel can access userspace only within certain functions that explicitly handle crossing user/kernel boundary.
