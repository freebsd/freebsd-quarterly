## Prometheus NFS Exporter ##

Link: https://github.com/Axcient/freebsd-nfs-exporter  

Contact: Alan Somers <asomers@FreeBSD.org>  

FreeBSD's nfsstat(8) utility provides a wealth of statistics, but I wanted to
monitor them with Prometheus.  Screen-scraping the --libxo output would've been
possible, but some of the stats are preprocessed in a way that interferes with
my Prometheus processing.  So I wrote a separate utility that publishes the raw
stats provided by the kernel.  Along the way I found and fixed a few bugs in
nfsstat, too.  If anybody is interested, I can add a port for it.

Sponsor: Axcient  
