# Copyright (c) 2022 Lorenzo Salvadore <salvadore@FreeBSD.org>
# All rights reserved.
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

import argparse

import Category

# ----------------------------------------------------------------------
# Parse arguments
# ----------------------------------------------------------------------

parser = argparse.ArgumentParser()

parser.add_argument("START",type=int)
parser.add_argument("STOP",type=int)
parser.add_argument("YEAR",type=int)
parser.add_argument("QUARTER",type=int)
parser.add_argument("TeamReports",type=str)
parser.add_argument("Projects",type=str)
parser.add_argument("Userland",type=str)
parser.add_argument("Kernel",type=str)
parser.add_argument("Architectures",type=str)
parser.add_argument("Documentation",type=str)
parser.add_argument("Ports",type=str)
parser.add_argument("ThirdParty",type=str)
parser.add_argument("Miscellaneous",type=str)

args = parser.parse_args()

# ----------------------------------------------------------------------
# Compute the right word for the quarter
# ----------------------------------------------------------------------

Quarter_Words = {
    1:"First",
    2:"Second",
    3:"Third",
    4:"Fourth"  }

QUARTER_WORD = Quarter_Words[args.QUARTER]

# ----------------------------------------------------------------------
# Initialize categories
# ----------------------------------------------------------------------

Categories = [

Category.Category("FreeBSD-Team-Reports","FreeBSD Team Reports",
"""Entries from the various official and semi-official teams, as found in the
link:../../administration/[Administration Page].""",
args.TeamReports.split()),

Category.Category("projects","Projects",
"""Projects that span multiple categories, from the kernel and userspace to the
Ports Collection or external projects.""",
args.Projects.split()),

Category.Category("userland","Userland",
"""Changes affecting the base system and programs in it.""",
args.Userland.split()),

Category.Category("kernel","Kernel",
"""Updates to kernel subsystems/features, driver support, filesystems, and more.""",
args.Kernel.split()),

Category.Category("architectures","Architectures",
"""Updating platform-specific features and bringing in support for the new hardware
platform.""",
args.Architectures.split()),

Category.Category("documentation","Documentation",
"""Noteworthy changes in the documentation tree, man-pages, or new external
books/documents.""",
args.Documentation.split()),

Category.Category("ports","Ports",
"""Changes affecting the Ports Collection, whether sweeping changes that touch most
of the tree, or individual ports themselves.""",
args.Ports.split()),

Category.Category("third-Party-Projects","Third Party Projects",
"""Many projects build upon FreeBSD or incorporate components of FreeBSD into their
project. As these projects may be of interest to the broader FreeBSD community,
we sometimes include brief updates submitted by these projects in our quarterly
report. The FreeBSD project makes no representation as to the accuracy or
veracity of any claims in these submissions.""",
args.ThirdParty.split()),

Category.Category("miscellaneous","Miscellaneous",
"""Objects that defy categorization.""",
args.Miscellaneous.split())

    ]

# ----------------------------------------------------------------------
# Print report's header, introduction and ToC
# ----------------------------------------------------------------------

print(
f"""---
title: "FreeBSD Quarterly Status Report {QUARTER_WORD} Quarter {args.YEAR}"
sidenav: about
---

= Introduction
:doctype: article
:toc: macro
:toclevels: 2
:icons: font
:!sectnums:
:source-highlighter: rouge
:experimental:
:reports-path: content/en/status/report-{args.YEAR}-{args.START:02}-{args.YEAR}-{args.STOP:02}

include::{{reports-path}}/intro.adoc[]

'''

toc::[]""")

# ----------------------------------------------------------------------
# Print reports, by categories
# ----------------------------------------------------------------------

for x in Categories:
    x.Print()
