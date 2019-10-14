## FreshPorts ##

Contact: Dan Langille, <dvl@FreeBSD.org>  

Link:	 [FreshPorts](https://www.FreshPorts.org/)  
Link:	 [git_proc_commit code](https://github.com/FreshPorts/git_proc_commit)
Link:	 [Things you didn’t know FreshPorts can do](https://news.freshports.org/2019/09/03/things-you-didnt-know-freshports-can-do/)

FreshPorts consolidates commits into an easy-to-follow
format so you can track changes to your favorite ports.
It also processes src, doc, and www commit. FreshPorts parses
incoming emails refreshes the database with what it finds.

In early September I started looking at how FreshPorts
could use a git repository for processing commits. The 
result was [an approach](https://news.freshports.org/2019/09/02/git-and-freshports/) for identifying new commits and
for iterating through them.

The next idea was [commit hooks](https://news.freshports.org/2019/09/18/moving-towards-commit-hooks/) but the most interesting
bit of that exercise was commit iteration.

At the EuroBSDCon 2019 FreeBSD Developer summit, I wrote
up a small requirements section and then received great 
help from two sources:

* Jan-Piet MENS recommended a [Python library](https://www.freshports.org/devel/py-gitpython/) and
  turned out to be great

* Sergey Kozlov wrote Python code to create xml using
  that Python library

On the trip home, I was able to get the code to parse
a git commit into XML and loaded into a FreshPorts database.

Returning home from the conference, I created a new
FreshPorts instance for processing git based on the above.
The website has needed no changes related to git.

The remaining tasks:

  * automate the script (git pull, etc)
  * detect new commits (for later iteration)
  * design a light-weight git hook

Event:	EuroBSDCon 2019 Hackathon
Sponsored by:	Intel Corporation (work done by Sergey Kozlov)
