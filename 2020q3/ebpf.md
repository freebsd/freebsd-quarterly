## Google Summer of Code’20 Project - eBPF XDP Hooks ##

Link: [Github diff link](https://github.com/Ankurk99/freebsd/tree/ebpf-import)
Link: [Project wiki](https://wiki.freebsd.org/SummerOfCode2020Projects/eBPFXDPHooksl)

Contact: Ankur Kothiwal <ankur@freebsd.org>

The eBPF eXpress Data Path (XDP) allows eBPF programs to be run to filter
received packets as early as possible, avoiding unnecessary processing
overhead before the filter is run. The goal of this project is to extend an
existing FreeBSD network driver (a virtual NIC like a VirtIO if_vtnet ) to
be able to call into an eBPF program when processing a newly received
packet. In short, XDP the driver must PASS (accept and process normally), DROP,
TX or REDIRECT the packet as specified by the program. eBPF helper
functions and maps for aiding in packet filtering will also be
implemented.

Implemented:
1. Register a eBPF probe when an interface is registered with pfil,
2. Activating eBPF probe,
3. Create hooks and link them to the pfil head when the eBPF XDP probe is
activated and successfully list the XDP probes,
4. Create a xdp_rx function which will pass the received packets to the
eBPF program where the packets can be further processed. This function will
return XDP actions: DROP and PASS,
5. Register the xdp hook and link it to the pfil head,
6. Write an eBPF program to process (currently drop and pass) ICMP traffic -
This is to test that the hook is working properly,
7. Write a loader function to load the ICMP filter program to the kernel.

Future Work:
- Currently we can only attach the XDP hook to PASS and DROP the packets -
The work on detaching the hook is left,
- The XDP action to “TX” and “REDIRECT” the packets.

Final Deliverables:
- Implemented XDP hook to pass and drop packets,
- Created a loader program to attach the eBPF program to the kernel,
- A test program to DROP ICMP filter.

This code was done under the Google Summer of Code 2020 under the guidance
of Ryan Stone (rstone@). The eBPF implementation for FreeBSD
is still a work in progress and FreeBSD doesn’t support eBPF yet. The
basic implementation for eBPF was a [GSoC’18 project](https://wiki.freebsd.org/SummerOfCode2018Projects/eBPF), 
and is still under development. This project is based on that implementation so the XDP
implementation for FreeBSD can only be merged into the FreeBSD source code
once it supports eBPF.

Currently this code is a work in progress and is merged to Ryan Stone’s
[branch with support for the eBPF implementation](https://github.com/rysto32/freebsd/tree/ebpf-import).

Sponsor: Google Summer of Code
