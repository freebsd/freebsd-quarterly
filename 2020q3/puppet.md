## Puppet ##

Link:    [Puppet](https://puppet.com/docs/puppet/latest/puppet_index.html)
Link:    [Puppet's FreeBSD slack channel](https://puppetcommunity.slack.com/messages/C6CK0UGB1/)
Link:    [Bolt](https://puppet.com/docs/bolt/latest/bolt.html)
Link:    [Choria](https://choria.io/)

Contact: Puppet Team <puppet@FreeBSD.org>  

Since out last status report a few years ago, the puppet@ team regularly
updated the various Puppet ports to follow upstream releases of Puppet
4, Puppet 5 and Puppet 6.  Puppet 4 was removed when it reached EOL.

More recently, an effort was made to enhance Facter 4 so that it can be
used as a drop-in replacement of Facter 3 on FreeBSD.  Facter 4 is a
Ruby rewrite of Facter 3, the C++ rewrite of Facter 2 which was
initially in Ruby.  As a consequence we have two ports for Facter:
sysutils/facter is the C++ implementation (Facter 3) and
sysutils/rubygems-facter is the Ruby implementation (updated from Facter
2 to Facter 4 a few weeks ago).  The Puppet 5 and Puppet 6 ports already
allow to choose which version of Facter to use.  Facter 4 will be the
default version of Facter with Puppet 7 which is expected to be released
soon.

We are getting ready to add a port for Puppet 7 as sysutils/puppet7
when it is available, along with PuppetServer 7 (sysutils/puppetserver7),
and PuppetDB 7 (databases/puppetdb7).

Regarding orchestration, most Marionette Collective ports have been
deprecated for a long time, and the last component sysutils/mcollective
is expected to be deprecated soon: Marionette Collective was not shipped
anymore with Puppet 6 and Bolt has been made available as a lightweight
replacement.

Bolt is already available in the ports tree as sysutils/rubygems-bolt),
but if you are using Marionette Collective, you are invited to look into
Choria which will reach the ports tree soon as sysutils/choria.  Choria
is a direct evolution of Marionette Collective allowing a smooth
transition from MCollective.  Once Choria is available in the ports
tree, Marionette Collective will be deprecated.
