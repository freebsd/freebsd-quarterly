# SPDX-License-Identfier: BSD-2-Clause-FreeBSD
#
# Copyright (c) 2020 Lorenzo Salvadore
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

# Targets intended for use on the command line
#
# all-xml (default)	-	clean-xml + build xml report + check (build can have funny side effects if directory is not cleaned before)
# all-txt		-	build a text version of the report using the html version online
# check			-	print build tree and build summary
# clean			-	clean-xml + clean-txt
# clean-xml		-	remove built xml report and files needed for its construction
# clean-txt		-	remove html and txt version of the report
# extract-contacts	-	extract contacts from md reports

PERL_CMD?=		perl
LYNX_CMD?=		lynx
PYTHON3_CMD?=		python3.7

.if empty(LYNX_CMD:S/^/which /:sh)
.error "Please set the LYNX_CMD variable to a valid lynx binary."
.endif
.if empty(PERL_CMD:S/^/which /:sh)
.error "Please set the PERL_CMD variable to a valid perl binary."
.endif
.if empty(PYTHON3_CMD:S/^/which /:sh)
.error "Please set the PYTHON3_CMD variable to a valid python3 command."
.endif

MD2DOCBOOK_CMD=	${PYTHON3_CMD} ${.CURDIR}/../tools/md2docbook.py
PRETTIFY_CMD=	${PERL_CMD} ${.CURDIR}/../tools/prettify.perl

CATEGORIES=	TeamReports Projects Kernel Architectures Userland Documentation Ports ThirdParty Miscellaneous
SOURCES=	${TeamReports} ${Projects} ${Userland} ${Kernel} ${Architectures} ${Documentation} ${Ports} ${ThirdParty} ${Miscellaneous} intro.md
MD_FILES!=	ls *.md

.if ${QUARTER} == 1
QUARTER_WORD=	First
.elif ${QUARTER} == 2
QUARTER_WORD=	Second
.elif ${QUARTER} == 3
QUARTER_WORD=	Third
.elif ${QUARTER} == 4
QUARTER_WORD=	Fourth
.else
.error "The value you inserted for the QUARTER variable is unexpected. If you are sure that your value is valid, please edit tools/Makefile by adding a definition for the QUARTER_WORD variable corresponding to your QUARTER value."
.endif

all-xml: clean-xml report-${YEAR}-${START}-${YEAR}-${STOP}.xml check
all-txt: report-${YEAR}-${START}-${YEAR}-${STOP}.txt
clean:	clean-xml clean-txt

check:
	@echo ------------ Report build tree --------------
	@echo
	@echo "> Team reports"
	@for y in ${TeamReports}; do echo "  |-- $$y"; done
	@echo "> Projects"
	@for y in ${Projects}; do echo "  |-- $$y"; done
	@echo "> Kernel"
	@for y in ${Kernel}; do echo "  |-- $$y"; done
	@echo "> Architectures"
	@for y in ${Architectures}; do echo "  |-- $$y"; done
	@echo "> Userland"
	@for y in ${Userland}; do echo "  |-- $$y"; done
	@echo "> Documentation"
	@for y in ${Documentation}; do echo "  |-- $$y"; done
	@echo "> Ports"
	@for y in ${Ports}; do echo "  |-- $$y"; done
	@echo "> Third Party"
	@for y in ${ThirdParty}; do echo "  |-- $$y"; done
	@echo "> Miscellaneous"
	@for y in ${Miscellaneous}; do echo "  |-- $$y"; done
	@echo
	@echo ------------ Report build summary --------------
	@echo
	@echo -n "Md files included: "
	@for x in ${MD_FILES}; \
	do if test -n "$$(echo "${SOURCES}" | grep $$x)"; \
	then echo -n "$$x "; fi; done
	@echo
	@echo
	@echo -n "Md files not included: "
	@for x in ${MD_FILES}; \
	do if test -z "$$(echo "${SOURCES}" | grep $$x)"; \
	then echo -n "$$x "; fi; done
	@echo
	@echo
	@echo ------------------------------------------------

report-${YEAR}-${START}-${YEAR}-${STOP}.xml: report-${YEAR}-${START}-${YEAR}-${STOP}.md
	${MD2DOCBOOK_CMD} ${>} $@
	# Replace variables
	sed -i '' 's/%%START%%/${START}/g' $@
	sed -i '' 's/%%STOP%%/${STOP}/g' $@
	sed -i '' 's/%%YEAR%%/${YEAR}/g' $@
	# Work around bugs in md2docbook
	sed -i '' 's,\([^ ]\)[ ]*</ul>,\1 </li></ul>,g' $@
	sed -i '' 's,\\_,_,g' $@
	sed -i '' 's,\\\*,\*,g' $@
	sed -i '' 's,@TEXTIT@,<i>,g' $@
	sed -i '' 's,@TEXTITC@,</i>,g' $@
	sed -i '' 's,@TEXTBF@,<b>,g' $@
	sed -i '' 's,@TEXTBFC@,</b>,g' $@

report-${YEAR}-${START}-${YEAR}-${STOP}.md: intro.md ${CATEGORIES:S/$/.md/g}
	cat $> >> $@
	# Work around bugs in md2docbook
	sed -i '' 's/\*\*\([^*]\{2,\}\)\*\*/@TEXTBF@\1@TEXTBFC@/g' $@
	sed -i '' 's/\*\([^*]\{2,\}\)\*/@TEXTIT@\1@TEXTITC@/g' $@

report-${YEAR}-${START}-${YEAR}-${STOP}.txt: report-${YEAR}-${START}-${YEAR}-${STOP}.html
	${LYNX_CMD} -dump -nolist $> | /usr/bin/iconv -f ISO-8859-1 -t UTF-8 > $@
	${PRETTIFY_CMD} $@ ${QUARTER_WORD} ${YEAR}
	mv $@.out $@

report-${YEAR}-${START}-${YEAR}-${STOP}.html:
	fetch -o $@ https://www.freebsd.org/news/status/report-${YEAR}-${START}-${YEAR}-${STOP}.html

clean-xml:
	rm -f	${CATEGORIES:S/$/.md/g} \
		report-${YEAR}-${START}-${YEAR}-${STOP}.xml \
		report-${YEAR}-${START}-${YEAR}-${STOP}.md \
		intro

clean-txt:
	rm -f	report-${YEAR}-${START}-${YEAR}-${STOP}.html \
		report-${YEAR}-${START}-${YEAR}-${STOP}.txt

extract-contacts: ${TeamReports} ${Projects} ${Userland} ${Kernel} ${Architectures} ${Documentation} ${Ports} ${ThirdParty} ${Miscellaneous}
	cat $> | grep 'Contact:' | grep -o -E '<.*@.*>' | tr -d '<>'

TeamReports.md: ${TeamReports}
	if test -n "$$(echo '$>' | tr -d ' \t')"; then echo "# FreeBSD Team Reports # " >> $@ && cat $> >> $@; else touch $@; fi

Projects.md: ${Projects}
	if test -n "$$(echo '$>' | tr -d ' \t')"; then echo "# Projects # " >> $@ && cat $> >> $@; else touch $@; fi

Userland.md: ${Userland}
	if test -n "$$(echo '$>' | tr -d ' \t')"; then echo "# Userland Programs # " >> $@ && cat $> >> $@; else touch $@; fi

Kernel.md: ${Kernel}
	if test -n "$$(echo '$>' | tr -d ' \t')"; then echo "# Kernel Projects # " >> $@ && cat $> >> $@; else touch $@; fi

Architectures.md: ${Architectures}
	if test -n "$$(echo '$>' | tr -d ' \t')"; then echo "# Architectures # " >> $@ && cat $> >> $@; else touch $@; fi

Documentation.md: ${Documentation}
	if test -n "$$(echo '$>' | tr -d ' \t')"; then echo "# Documentation # " >> $@ && cat $> >> $@; else touch $@; fi

Ports.md: ${Ports}
	if test -n "$$(echo '$>' | tr -d ' \t')"; then echo "# Ports # " >> $@ && cat $> >> $@; else touch $@; fi

ThirdParty.md: ${ThirdParty}
	if test -n "$$(echo '$>' | tr -d ' \t')"; then echo "# Third-Party Projects # " >> $@ && cat $> >> $@; else touch $@; fi

Miscellaneous.md: ${Miscellaneous}
	if test -n "$$(echo '$>' | tr -d ' \t')"; then echo "# Miscellaneous # " >> $@ && cat $> >> $@; else touch $@; fi
