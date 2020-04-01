## FreeBSD on Microsoft HyperV and Azure ##

Link: [FreeBSD on MicrosoftAzure wiki](https://wiki.freebsd.org/MicrosoftAzure)  
Link: [FreeBSD on Microsoft HyperV](https://wiki.freebsd.org/HyperV)  

Contact: FreeBSD Integration Services Team <bsdic@microsoft.com>  
Contact: Wei Hu <whu@FreeBSD.org>  
Contact: Li-Wen Hsu <lwhsu@FreeBSD.org>  

Wei is working on HyperV Socket support for FreeBSD.  HyperV Socket provides a way for the HyperV host and guest to communicate using a common socket interface without networking required.  Some features in Azure require HyperV Socket support in the guest.

Details of HyperV Socket is available at https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/user-guide/make-integration-service

The WIP is available at https://reviews.freebsd.org/D24061

This project is sponsored by Microsoft.

Li-Wen is working on the FreeBSD release code related to Azure for the -CURRENT and 12-STABLE branches.  The release of 12.1-RELEASE on Azure is also in progress.

The WIP is available at https://reviews.freebsd.org/D23804

This project is sponsored by The FreeBSD Foundation.
