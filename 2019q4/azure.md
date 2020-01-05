## FreeBSD on Microsoft HyperV and Azure

Link: [FreeBSD on MicrosoftAzure wiki](https://wiki.freebsd.org/MicrosoftAzure)  
Link: [FreeBSD on Microsoft HyperV](https://wiki.freebsd.org/HyperV)  

Contact: FreeBSD Integration Services Team <bsdic@microsoft.com>  
Contact: Wei Hu <whu@FreeBSD.org>  
Contact: Li-Wen Hsu <lwhsu@FreeBSD.org>  

Wei is working on HyperV Socket support for FreeBSD. HyperV Socket provides a way for host and guest to communicate using common socket interfaces without networking support.  Some features in Azure require HyperV Socket support in guest.

It is planned to commit the code by the end of February.

This project is sponsored by Microsoft.  Details of HyperV Socket is available at https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/user-guide/make-integration-service

Li-Wen and Wei are working on improving FreeBSD release on Azure.  During this quarter, Wei has published the [11.3-RELEASE on Azure](https://azuremarketplace.microsoft.com/en-us/marketplace/apps/microsoftostc.freebsd-11-3?tab=Overview).  Li-Wen is working on the FreeBSD release codes related to Azure for the -CURRENT and 12-STABLE branches.

This project is sponsored by Microsoft and FreeBSD Foundation.
