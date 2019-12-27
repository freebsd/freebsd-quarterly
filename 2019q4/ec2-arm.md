## FreeBSD on EC2 ARM64 ##

Link:	 [FreeBSD/ARM 12 in AWS Marketplace](https://aws.amazon.com/marketplace/pp/B081NF7BY7)  
Link:	 [FreeBSD/EC2 Patreon](https://www.patreon.com/cperciva)  
Link:  [M6G vs M5 buildworld cost/time performance](https://twitter.com/cperciva/status/1206688489518985216)

Contact: Colin Percival <cperciva@FreeBSD.org>

In November 2018, Amazon Web Services announced the first Elastic
Compute Cloud (EC2) instances built around the ARM64 platform.
While FreeBSD supported the ARM64 platform, running on this specific
virtual machines took some additional work, but by April 2019 the
weekly snapshot builds performed by the Release Engineering Team
included ARM64 AMIs for FreeBSD HEAD.

In November 2019 FreeBSD 12.1 was released, including the first
"RELEASE" FreeBSD EC2/ARM64 AMIs.  A few weeks later, FreeBSD/ARM64
was added as a new "product" to the AWS Marketplace.

At the re:Invent 2019 conference in December 2019, Amazon announced
a second family of ARM64 instances, known variously as "Graviton 2"
and "M6G".  These are far more powerful than the first-generation
ARM64 EC2 instances, and have a roughly 40% price/performance advantage
over the "M5" family of x86 EC2 instances; and existing FreeBSD 12.1
and HEAD AMIs run "out of the box" on these instances.

Work is currently underway to improve kernel locking scalability on
these instances; with high levels of parallelism (e.g. buildworld -j64)
the G6M instances have approximately 1.5x higher sys:user ratios than
equally-sized M5 instances, suggesting that there is room for improvement
here.

Two issues have been recently identified, both likely relating to ACPI:

  * EC2 "StopInstance" API calls, which translate to ACPI "power button"
  notifications, do not trigger FreeBSD to shut down; this results in a
  timeout from EC2 and a "hard poweroff".
  * Hotplugging/unplugging EBS volumes, which normally operates via ACPI
  device notifications, does not work.

Help from developers familiar with ARM64 and ACPI would be much
appreciated.

Sponsor: FreeBSD/EC2 Patreon
