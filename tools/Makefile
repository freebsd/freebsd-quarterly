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
#
# Makefile targets:
# all		make build test
# build		make _index.adoc
# test		run many checks on _index.adoc

SEPARATOR_STRING?=	==========================================
ERROR_STRING?=		[ERROR]

ECHO_CMD?=	echo

RUBY_CMD?=	ruby
RUBY_FLAGS?=	-I ${TOOLS_DIR}

TOOLS_DIR=	../tools

TITLE_LEVEL=	===

.if empty(ECHO_CMD:S/^/which /:sh)
.	error "Please set ECHO_CMD to a valid ruby binary."
.endif
.if empty(RUBY_CMD:S/^/which /:sh)
.	error "Please set RUBY_CMD to a valid ruby binary."
.endif

all: build test

build: _index.adoc

# Use ! instead of : because the content of _index.adoc is independent from the
# content of the .adoc files, but we still want to check for their existence
_index.adoc!	intro.adoc \
		${TeamReports} \
		${Projects} \
		${Userland} \
		${Kernel} \
		${Architectures} \
		${Documentation} \
		${Ports} \
		${ThirdParty} \
		${Miscellaneous}
	${RUBY_CMD} ${RUBY_FLAGS} ${TOOLS_DIR}/generate-index.rb \
		${START} \
		${STOP} \
		${YEAR} \
		${QUARTER} \
		"${TeamReports}" \
		"${Projects}" \
		"${Userland}" \
		"${Kernel}" \
		"${Architectures}" \
		"${Documentation}" \
		"${Ports}" \
		"${ThirdParty}" \
		"${Miscellaneous}" > $@

test:	check_all_reports \
	check_titles

check_all_reports: _index.adoc
	@${ECHO_CMD} ${SEPARATOR_STRING}
	@${ECHO_CMD} "Verify if all reports have been included:"
	@${ECHO_CMD} ${SEPARATOR_STRING}
	@for report in *.adoc; \
	do \
		if test "$${report}" != "$>"; \
		then \
			${ECHO_CMD} -n "$${report}..."; \
			if test -n \
			"$$(grep "include::{reports-path}/$${report}\[\]" $>)"; \
			then \
				${ECHO_CMD} "found."; \
			else \
				${ECHO_CMD} "${ERROR_STRING} not found."; \
			fi; \
		fi; \
	done

check_titles:
	@${ECHO_CMD} ${SEPARATOR_STRING}
	@${ECHO_CMD} "Verify if section levels for all reports are set properly:"
	@${ECHO_CMD} ${SEPARATOR_STRING}
	@for report in *.adoc; \
	do \
		if	test "$${report}" != "_index.adoc" && \
			test "$${report}" != "intro.adoc" ; \
		then \
			${ECHO_CMD} -n "$${report}..."; \
			if test -n \
			"$$(grep = $${report} | head -n 1 | grep "^${TITLE_LEVEL} ")"; \
			then \
				${ECHO_CMD} "looks fine."; \
			else \
				${ECHO_CMD} "${ERROR_STRING} expected section level: ${TITLE_LEVEL}."; \
			fi; \
		fi; \
	done

clean:
	rm -f _index.adoc
