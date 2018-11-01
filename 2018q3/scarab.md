## scarab: CLI tool for Bugzilla-related workflows ##

Contact: Oleksandr Tymoshenko, <gonzo@FreeBSD.org>

Link:    [GitHub repo](https://github.com/gonzoua/scarab)

scarab is a CLI tool that makes some of Bugzilla functionality
available from the command line. Normally users interact with the
[bugtracker](https://bugs.freebsd.org/bugzilla/) using web browser
but for certain workflows, Web UI may be more of an obstacle
than help requiring to perform more steps compared to CLI tool.

Bugzilla provides XML-RPC interfaces that can be used for
automation/integration and there are several CLI tools like
[pybugz](https://github.com/williamh/pybugz) that can be used
with bugs.freebsd.org as-is. They are generic one-size-fits-all
tools which mean they can do a lot of thing at the cost of
more complex CLI.

scarab was created to be more specialized and less complex with following
principles in mind:

  * Be an auxiliary tool, not a replacement for the web UI
  * Move complexity to a configuration file, keep arguments as simple as possible
  * Optimize for most common/tedious tasks

Based on my experience with Bugzilla following tasks were identified as a
candidates for inclusion in the first release of the tool:

  * Downloading attachment on host machine and copying it to devbox
  * Creating a file on the devbox and copying it to a host machine to be attached through Web UI
  * Creating PRs with common fields' values

First two operations were implemented as *files*, *fetch*, *fetchall*, *attach*
commands of the tool.

The third operation was implemented by introducing PR templates, set of
predefined field/value pairs, that can be combined run-time to provide higher
flexibility. More information and usage examples can be found in the
[config file example](https://github.com/gonzoua/scarab/blob/master/examples/scarabrc)
