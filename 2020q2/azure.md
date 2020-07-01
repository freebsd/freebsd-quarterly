## FreeBSD on Microsoft HyperV and Azure ##

Link: [FreeBSD on MicrosoftAzure wiki](https://wiki.freebsd.org/MicrosoftAzure)  
Link: [FreeBSD on Microsoft HyperV](https://wiki.freebsd.org/HyperV)  

Contact: FreeBSD Integration Services Team <bsdic@microsoft.com>  
Contact: Wei Hu <whu@FreeBSD.org>  
Contact: Li-Wen Hsu <lwhsu@FreeBSD.org>  

HyperV socket for FreeBSD implemented by Wei was checked into FreeBSD head
branch on May 20th as
[r361275](https://svnweb.freebsd.org/changeset/base/r361275). It supports
guest/host communications without need of network.  Some HyperV and Azure
features rely on this to be available in guest.

Details of HyperV Socket is available [here](https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/user-guide/make-integration-service).

This project is sponsored by Microsoft.

Li-Wen is working on the FreeBSD release code related to Azure for the -CURRENT, 12-STABLE and 11-STABLE branches.
The work-in-progress is available [here](https://reviews.freebsd.org/D23804)
The 12.1-RELEASE image on Azure Marketplace is waiting certification from Microsoft and will be published soon.
The work for 11.4-RELEASE image on Azure is in progress.

This project is sponsored by The FreeBSD Foundation.
