## Bring more Security Intelligence to FreeBSD ##

Contact: Michael Muenz, <m.muenz@gmail.com>  

Link:	 [Maltrail - distributed Malware detection](https://github.com/stamparm/maltrail)  
Link:	 [Wazuh - thread detection and incident response](https://wazuh.com/)  

To bring more Security Intelligence we maintain the FreeBSD port
of `zmaltail`. This open source project based on Python can act 
as a sensor and/or as a central server. It listens in defined ports
or protocols and compares IP addresses and domains against static
and dynamic feeds, contributed by the community. 

As you can install this piece of software on multiple firewalls
and let them send to a central server, you are able to detect attacks
and compromises very fast. Within Q2 we updated the port to the latest 
version and are constantly in contact with the core developer 
(also co-author of `SQLmap`) to bring out new features.

The second project we are currently trying to add as a port is `Wazuh`.
Wazuh is a fork of `Ossec` which is already in the ports tree.
Compared to Ossec, Wazuh has some intelligent addition like full 
`ELK-Stack` integration with own apps and dashboards.

With Wazuh installed on your webserver, or even on your windows desktop
you can monitor file integrity or log files for most kind of attacks.
Active response features let you e.g. send API calls to your firewalls
to dynamically block this offender.

As Wazuh offers a complete ELK-Stack you can use it also as a central 
logging solution for better security insights into your network.

Sponsor: m.a.x. Informationstechnologie AG  
