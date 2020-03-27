## FreeBSD on the ARM Morello platform ##

Link:	 [The Arm Morello Board](https://www.cl.cam.ac.uk/research/security/ctsrd/cheri/cheri-morello.html)
Link:	 [The CHERI Project](https://www.cl.cam.ac.uk/research/security/ctsrd/cheri/)

Contact: Andrew Turner <andrew@FreeBSD.org>
Contact: Ruslan Bukin <br@FreeBSD.org>
Contact: Brooks Davis <brooks@FreeBSD.org>

CHERI (Capability Hardware Enhanced RISC Instructions) extends
conventional hardware Instruction-Set Architectures (ISAs) with new
architectural features to enable fine-grained memory protection and
highly scalable software compartmentalization. The CHERI
memory-protection features allow historically memory-unsafe programming
languages such as C and C++ to be adapted to provide strong, compatible,
and efficient protection against many currently widely exploited
vulnerabilities. The CHERI scalable compartmentalization features enable
the fine-grained decomposition of operating-system (OS) and application
code, to limit the effects of security vulnerabilities in ways that are
not supported by current architectures. CHERI is a hybrid capability
architecture in that it is able to blend architectural capabilities with
conventional MMU-based architectures and microarchitectures, and with
conventional software stacks based on virtual memory and C/C++. This
approach allows incremental deployment within existing ecosystems, which
we have demonstrated through hardware and software prototyping.

On 18 October 2019, Arm announced Morello, an experimental
CHERI-extended, multicore, superscalar ARMv8-A processor, System-on-Chip
(SoC), and prototype board to be available from late 2021. Morello is a
part of the UKRI £187M Digital Security by Design Challenge (DSbD)
supported by the UK Industrial Strategy Challenge Fund, including a
commitment of over £50M commitment by Arm.  The aim is to test and
validate CHERI extensions to the Arm ISA at scale with the idea that
"successful concepts are expected to be carried forward into the
architecture."

Over the past decade we have developed CheriBSD, a version of FreeBSD
supporting CHERI.  Our public facing work has been performed on MIPS64
and more recently on RISC-V.  Andrew has also developed a port to an
earlier version of the Morello ISA which we will be merging into
our public repository as simulators and compilers become available.

The Morello board is based on the Arm Neoverse N1 platform and derived
from the N1SDP development platform.  Ruslan and Andrew are currently
working to enable all relevant features of the N1 and the N1SDP to give
us a solid baseline for work on Morello.  These features include the
PCI root complex, system memory management unit (SMMU), and CoreSight.
To the extent practical we are upstreaming these features to FreeBSD.

Sponsor: DARPA, UKRI
