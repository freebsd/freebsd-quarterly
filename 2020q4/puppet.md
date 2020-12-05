## Puppet ##

Link:    [Puppet](https://puppet.com/docs/puppet/latest/puppet_index.html)
Link:    [Puppet's FreeBSD slack channel](https://puppetcommunity.slack.com/messages/C6CK0UGB1/)
Link:    [Bolt](https://puppet.com/docs/bolt/latest/bolt.html)
Link:    [Choria](https://choria.io/)

Contact: Puppet Team <puppet@FreeBSD.org>  

Since our last status report a few months ago, the FreeBSD ports tree
has seen the addition of the Choria (sysutils/choria) orchestration
tool, and the Puppet Plaform 7 with the Puppet Agent (sysutils/puppet7),
Puppet Server (sysutils/puppetserver7) and PuppetDB
(databases/puppetdb7).

Older versions of Puppet (5 and 6) are still in the ports tree, allowing
a smooth transition, but please note that Puppet 5 will reach EOL soon,
and as it is not compatible with the recent ecosystem provided by
FreeBSD (i.e. it is not compatible with the latest version of Ruby and
depends on old FreeBSD primitives not available anymore), it is
recommended to update at least to Puppet 6 as soon as possible.

Ports depending on Puppet (e.g. sysutils/rubygem-bolt) have been updated
to add options allowing to choose which version of Puppet to depend on.
For now, the default is Puppet 6, but we plan to switch the default to
Puppet 7 in a few weeks, probably when Puppet 5 will have reached EOL.
