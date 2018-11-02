## Various Documentation Bits ##

Contact: 
- Wiki:
  - wiki-admin@FreeBSD.org
  - #freebsd-wiki @ freenode IRC
- Quarterly reports:
  - Edward Tomasz Napierała, <trasz@FreeBSD.org>
  - Mateusz Piotrowski, <0mp@FreeBSD.org>

Links:	 
- [Wiki Fixit Group Website](https://wiki.freebsd.org/WikiFixitGroup/)

The FreeBSD Wiki used to be a scratch pad for the FreeBSD developers to
organize projects, store notes and publish articles that were about to be added
to the handbook. Recently, however, the FreeBSD wiki started to attract more
and more people from the wider FreeBSD community, which resulted in a change of
the character of the wiki.

As a result we decided to discuss the future of the tools we want to use for
documentation in FreeBSD (one of such discussions was held during BSDCam 2018, 
you may see some notes
[here](https://wiki.freebsd.org/DevSummit/201808/DeveloperTools)). The general
conclusion is that wiki is a great tool for what it was meant for: organizing
projects and notes in the community of developers. We should not move all our
documentation (especially handbooks) to Wiki as the quality and maintainability
would suffer. On the other hand, the current workflow of submitting
documentation patches, which involves checking out the doc tree and patching
XML files is not ideal for many end users. This is why we are trying to approach the problem from various directions:

1. The wiki is being cleaned up of old content. We are trying to define a clear
   hierarchy of subpages and categories to make navigating the wiki easier.
2. Some articles from the wiki are going to be migrated to either the doc tree
   or manual pages.
3. The quarterly reports project is testing out if using Markdown and GitHub as
   an alternative tool for submitting documentation lowers the barrier of
   entry.
