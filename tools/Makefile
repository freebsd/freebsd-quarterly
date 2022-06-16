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
# test		run many checks on _index.adoc and reports
# autofix	fix all errors reported by test that can be fixed automatically

ALL_REPORTS=	${TeamReports} \
		${Projects} \
		${Userland} \
		${Kernel} \
		${Architectures} \
		${Documentation} \
		${Ports} \
		${ThirdParty} \
		${Miscellaneous} \

SEPARATOR_STRING?=	==========================================
ERROR_STRING?=		[ERROR]
WARNING_STRING?=	[WARNING]

TOOLS_DIR=	../tools

TITLE_LEVEL=	===

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
	check_pluses \
	check_titles

autofix:	fix_titles

check_all_reports: _index.adoc
	@${ECHO_CMD} ${SEPARATOR_STRING}
	@${ECHO_CMD} "Verify if all reports have been included:"
	@${ECHO_CMD} ${SEPARATOR_STRING}
	@for report in $$(${LS_CMD} *.adoc | ${SED_CMD} "s/$>//"); \
	do \
		${ECHO_CMD} -n "$${report}..."; \
		if ${TEST_CMD} -n \
		"$$(grep "include::{reports-path}/$${report}\[\]" $>)"; \
		then \
			${ECHO_CMD} "found."; \
		else \
			${ECHO_CMD} "${ERROR_STRING} not found."; \
		fi; \
	done

check_pluses:
	@${ECHO_CMD} ${SEPARATOR_STRING}
	@${ECHO_CMD} "Search for pluses:"
	@${ECHO_CMD} ${SEPARATOR_STRING}
	for report in ${ALL_REPORTS} intro.adoc; \
	do \
		${ECHO_CMD} -n "$${report}..."; \
		lines="$$(\
		${GREP_CMD} '+' $${report} | \
		${GREP_CMD} -v ' +$$' | \
		${GREP_CMD} -v '^+$$' | \
		${GREP_CMD} -v 'link:[^ ]*\[' || \
		${TRUE_CMD})"; \
		if test -n "$$lines"; \
		then \
			${ECHO_CMD} "${WARNING_STRING} please check the following lines:"; \
			${ECHO_CMD} $$lines; \
		else \
			${ECHO_CMD} "looks fine."; \
		fi \
	done

check_titles:
	@${ECHO_CMD} ${SEPARATOR_STRING}
	@${ECHO_CMD} "Verify if section levels for all reports are set properly:"
	@${ECHO_CMD} ${SEPARATOR_STRING}
	@for report in ${ALL_REPORTS}; \
	do \
		${ECHO_CMD} -n "$${report}..."; \
		if ${TEST_CMD} -n \
		"$$(${GREP_CMD} = $${report} | ${HEAD_CMD} -n 1 | ${GREP_CMD} "^${TITLE_LEVEL} ")"; \
		then \
			${ECHO_CMD} "looks fine."; \
		else \
			${ECHO_CMD} "${ERROR_STRING} expected section level: ${TITLE_LEVEL}."; \
		fi; \
	done

fix_titles:
	@${ECHO_CMD} ${SEPARATOR_STRING}
	@${ECHO_CMD} -n "Fixing section levels..."

	# About SED_CMD:
	# The first line fixes the title and exits if the title is in the first line.
	# The second line fixes the title if it is not in the first line.
	# Two different cases must be treated because 1,/^=+/ would change the level
	# for two occurrences of /^=+/ if the title is at line 1 (assuming that two
	# occurrences exist in the report).

	@for report in ${ALL_REPORTS} ; \
	do \
		${SED_CMD} ${SED_FLAGS} -i '' \
					-e "1s/^=+/${TITLE_LEVEL}/;t" \
					-e "1,/^=+/s/^=+/${TITLE_LEVEL}/" $$report; \
	done

	@${ECHO_CMD} "done."
	@${ECHO_CMD} ${SEPARATOR_STRING}

clean:
	rm -f _index.adoc

.include "Makefile.commands"
