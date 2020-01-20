#!/usr/bin/env python3
#
# Copyright (c) 2018 Edward Tomasz Napierala <trasz@FreeBSD.org>
# Copyright (c) 2019-2020 Lorenzo Salvadore <salvadore@FreeBSD.org>
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
# 1. Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in the
#    documentation and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
# OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
# HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
# OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
# SUCH DAMAGE.

#
# XXX: This should get rewritten by someone who actually knows Python.
#

import re
import sys
from email.utils import parseaddr
from xml.sax.saxutils import escape

class report_class:
    # This part is partly copy/pasted from en_US.ISO8859-1/htdocs/news/status/report-template.xml
    text = '''\
<?xml version="1.0" encoding="utf-8" ?>
<!DOCTYPE report PUBLIC "-//FreeBSD//DTD FreeBSD XML Database for
  Status Report//EN"
  "http://www.FreeBSD.org/XML/share/xml/statusreport.dtd" >

<!-- $FreeBSD: head/en_US.ISO8859-1/htdocs/news/status/report-template.xml 51132 2017-10-19 01:38:11Z bjk $ -->
<!-- This file was generated with https://github.com/trasz/md2docbook -->
<!--
     Variables to replace:
     %%START%%     - report month start
     %%STOP%%      - report month end
     %%YEAR%%      - report year
-->

<report>
  <date>
    <month>%%START%%-%%STOP%%</month>

    <year>%%YEAR%%</year>
  </date>

  <section>
    <title>Introduction</title>
    '''
    # This part is copy/pasted from en_US.ISO8859-1/htdocs/news/status/report-template.xml
    after_introduction = '''\
  </section>

  <category>
    <name>team</name>

    <description>&os; Team Reports</description>

    <p>Entries from the various official and semi-official teams,
      as found in the <a href="&enbase;/administration.html">Administration
        Page</a>.</p>
  </category>

  <category>
    <name>proj</name>

    <description>Projects</description>

    <p>Projects that span multiple categories, from the kernel and userspace
      to the Ports Collection or external projects.</p>
  </category>

  <category>
    <name>kern</name>

    <description>Kernel</description>

    <p>Updates to kernel subsystems/features, driver support,
      filesystems, and more.</p>
  </category>

  <category>
    <name>arch</name>

    <description>Architectures</description>

    <p>Updating platform-specific features and bringing in support
      for new hardware platforms.</p>.
  </category>

  <category>
    <name>bin</name>

    <description>Userland Programs</description>

    <p>Changes affecting the base system and programs in it.</p>
  </category>

  <category>
    <name>ports</name>

    <description>Ports</description>

    <p>Changes affecting the Ports Collection, whether sweeping
      changes that touch most of the tree, or individual ports
      themselves.</p>
  </category>

  <category>
    <name>doc</name>

    <description>Documentation</description>

    <p>Noteworthy changes in the documentation tree or new external
      books/documents.</p>
  </category>

  <category>
    <name>misc</name>

    <description>Miscellaneous</description>

    <p>Objects that defy categorization.</p>
  </category>

  <category>
    <name>third</name>

    <description>Third-Party Projects</description>

    <p>Many projects build upon &os; or incorporate components of
      &os; into their project.  As these projects may be of interest
      to the broader &os; community, we sometimes include brief
      updates submitted by these projects in our quarterly report.
      The &os; project makes no representation as to the accuracy or
      veracity of any claims in these submissions.</p>
  </category>
    '''

    # salvadore:
    # the keys of the following dictionary are all tags
    # EXCEPT introduction, wich is a key that takes track of when
    # we need to print the content of the after_introduction variable.
    inside = dict.fromkeys(['introduction',\
                            'project',\
                            'body',\
                            'p',\
                            'ul',\
                            'li',\
                            'code'])

    def __init__(self):
        self.inside['introduction'] = True

    def append(self, line):
        self.text += line

    def append_contacts(self, contacts):
        if not contacts:
            return self.text

        # You know, it's not that I don't know about templating
        # engines.  I do.  I just want to give you some additional
        # motivation :->
        self.text += '<contact>'
        for person in contacts:
            self.text += '''\
          <person>
            <name>%s</name>
            <email>%s</email>
          </person>
    ''' % (person[0], person[1])

        self.text += '''\
        </contact>

    '''

    def append_links(self, links):
        if not links:
            return self.text

        self.text += '''\
        <links>
    '''
        for link in links:
            self.text += '''\
          <url href="%s">%s</url>
    ''' % (link[1], link[0])

        self.text += '''\
        </links>

    '''

    def append_sponsors(self, sponsors):
        if not sponsors:
            return self.text

        for sponsor in sponsors:
            self.text += '''\

        <sponsor>
          %s
        </sponsor>
    ''' % sponsor

    def close(self, tag):
        self.text += '</' + tag + '>\n'
        self.inside[tag] = False
        if self.is_inside('introduction'):
            if tag == 'ul': self.close('p')
    
    def get(self):
        return self.text + '</report>'

    def is_inside(self, tag):
        return self.inside[tag]

    def newline(self):
        self.append('\n\t')
        
    # salvadore:
    # category and title should be set only for tag == 'project'
    # I do not check for it because if an error arises it is our fault,
    # not the input fault
    def open(self, tag, category='', title=''):
        if tag == 'project':
            extra = ' cat="' + category + \
            '"><title>' + title + '</title'
            if self.is_inside('project'):
                self.close('project')
            elif self.is_inside('introduction'):
                self.text += self.after_introduction
                self.inside['introduction'] = False
        else:
            extra = ''
            if self.is_inside('introduction'):
                if tag == 'body': return
                if tag == 'ul': self.open('p')

        self.text += '<' + tag + extra + '>'
        self.inside[tag] = True

def reflow(line):
    if not line:
        return ''

    text = ''
    textlen = 0

    for word in line.split():
        if textlen + len(word) >= 66 - 8:
            text = text + '\n' + '\t'
            textlen = 8
        elif textlen > 0:
            text = text + ' '
            textlen = textlen + 1

        text = text + word
        textlen = textlen + len(word)

    return text

def md2docbook(infile):
    cat = 'unknown' # For parsing individual submissions.
    contacts = []
    links = []
    sponsors = []
    report = report_class()

    for line in infile:
        line = line.rstrip()
        avoid_newline = False

        if line == '# FreeBSD Team Reports #':
            cat = 'team'
            continue
        if line == '# Projects #':
            cat = 'proj'
            continue
        if line == '# Kernel Projects #':
            cat = 'kern'
            continue
        if line == '# Ports #':
            cat = 'ports'
            continue
        if line == '# Architectures #':
            cat = 'arch'
            continue
        if line == '# Documentation #':
            cat = 'doc'
            continue
        if line == '# Third-Party Projects #':
            cat = 'third'
            continue
        if line == '# Miscellaneous #':
            cat = 'misc'
            continue
        if line == '# Userland Programs #':
            cat = 'bin'
            continue
        if line.startswith('# ') and not report.is_inside('code'):
            sys.exit('invalid category name "%s"; please consult %s source code"' \
                % (line, sys.argv[0]))

        if line.startswith('## '):
            title = line.strip('# ')

            # Start a new <project> entry.  But first finish
            # the old one.

            # XXX: As I've mentioned, this _really_ should get rewritten.
            # salvadore: I've rewritten this a bit, but I guess we can
            # still do better
            for tag in ['p', 'ul', 'body']:
                if report.is_inside(tag):
                    report.close(tag)

            if report.is_inside('project'):
                report.append_sponsors(sponsors)
                report.close('project')

            contacts = []
            links = []
            sponsors = []

            report.open('project', cat, title)
            continue

        # Translate '###' into '<p>', to match earlier reports.
        if line.startswith('### '):
            line = line.strip('# ')

        if line.startswith('Contact:'):
            # The comma in 'Name, <email>' confuses parseaddr().
            line = line.replace(',', '')
            contacts.append(parseaddr(line))
            continue

        if line.startswith('Link:'):
            href = re.search(r'\((.+)\)', line)
            if href:
                href = href.group(1)
            else:
                href = ''

            name = re.search(r'\[(.+)\]', line)
            if name:
                name = name.group(1)
            else:
                name = href

            links.append((name, href))
            continue

        if line.startswith('Sponsor:'):
            sponsor = line[len('Sponsor:'):].strip()
            sponsors.append(sponsor)
            continue

        if line.strip() == '':
            if not report.is_inside('body'):
                continue
            if report.is_inside('p'):
                report.close('p')
                continue

        if not report.is_inside('body'):
            report.append_contacts(contacts)
            report.append_links(links)
            report.open('body')

        # Unordered lists.
        if line.strip().startswith(('-', '*')):
            line = line.lstrip('*- ')
            if report.is_inside('p') and not report.is_inside('ul'):
                report.close('p')
            if report.is_inside('ul'):
                report.close('li')
            else:
                report.open('ul')
                inside_ul = True
            report.open('li')
            avoid_newline = True

        elif not line.startswith(' ') and report.is_inside('ul'):
            report.close('ul')

        if line.startswith('```'):
            line = line.lstrip('```')
            if report.is_inside('code'):
                if report.is_inside('p'):
                    report.close('p')
                report.close('code')
            else:
                report.open('code')

        # Here we paste the plain text.  Note that the text
        # in 'report' is generally _not_ followed by a newline,
        # so that we don't need to remove them when we append
        # '</p>'.
        if report.is_inside('p'):
            report.newline()
        elif report.is_inside('ul'):
            if not avoid_newline:
                report.newline()
        else:
            report.open('p')

        line = escape(line)

        # Handle inline links with the usual Markdown syntax.
        hrefs = re.findall(r'\(([^)]+)\)', line)
        for match in hrefs:
            if match.startswith('http'):
                href = match
                name = re.search(r'\[(.+)\]', line)
                if name:
                    name = name.group(1)
                    line = re.sub(r'\[.*\]', '', line)
                else:
                    name = href
                line = line.replace('(' + href + ')',\
                    '<a href="%s">%s</a>' % (href, name))

        # Handle *this*.
        line = re.sub(r'(^| )\*([^ ][^*]+)\*', r'\1<tt>\2</tt>', line)

        # Handle `this`.
        line = re.sub(r'(^| )\`([^ ][^`]+)\`', r'\1<tt>\2</tt>', line)

        report.append(reflow(line))

    for tag in ['p', 'ul']:
        if report.is_inside(tag):
            report.close(tag)

    report.append_sponsors(sponsors)
    report.close('body')
    report.close('project')

    return report.get()

def main():
    if len(sys.argv) > 3:
        sys.exit('usage: %s [input-file [output-file]]' % sys.argv[0])

    if len(sys.argv) > 2:
        outfile = open(sys.argv[2], 'w')
    else:
        outfile = sys.stdout

    if len(sys.argv) > 1:
        infile = open(sys.argv[1], 'r')
    else:
        infile = sys.stdin

    docbook = md2docbook(infile)
    outfile.write(docbook)

if __name__ == '__main__':
    main()
