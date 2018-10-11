## Puppet ##

Contact: Puppet Team <puppet@FreeBSD.org>

Link:	 [PuppetLab's FreeBSD slack channel](https://puppetcommunity.slack.com/messages/C6CK0UGB1/)
	 [BSDCan 2018: IT automation with Puppet](https://www.bsdcan.org/2018/schedule/events/930.en.html)

Since our last status report last year, the puppet@ team regularly updated the
Puppet ports to catch on upstream releases.  We have also held a Puppet talk at
BSDCan.

More recently, Puppet 6 was released, and a bunch of new ports appeared in the
FreeBSD ports tree: sysutils/puppet6, sysutils/puppetserver6,
databases/puppetdb6 being (obviously) the main ones. In this update, the Puppet
language has not been heavily modified. As a consequence, upgrading from Puppet
5 to Puppet 6 is an easy task compared to the experience you may have
encountered from previous major version bumps. If you are still using Puppet 4,
we recommend to schedule an upgrade soon: Puppet 4 is expected to be EOL by the
end of 2018.

Because distributing Marionette Collective modules via Puppet is more efficient
than using packages, the sysutils/mcollective-\*-{agent,client} ports have been
deprecated. Marionette Collective itself being phased out by PuppetLabs, the
sysutils/mcollective port is expected to be deprecated at some point in the
future, but we plan to keep it until an alternative is available. This
alternative, called Choria, is in active development by R.I.Pienaar the
original author of Marionette Collective. We are actively working with him to
support FreeBSD out of the box, and will commit sysutils/choria to the tree as
soon as it is considered a drop-in replacement for Marionette Collective.

