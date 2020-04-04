#!/usr/bin/env perl
#
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

use strict;
use warnings;

if(scalar @ARGV != 3)
{
	print <<'EOT';
Usage: ./sendcalls.perl <year> <quarter> <urgency>
- year: 4 digits year of reference of the call
- quarter: can be 1, 2, 3 or 4
- urgency: can be "none", "2weeks" or "last"
Example: "./sendcalls.perl 2020 1 2weeks" will send a call with object:
"[2 WEEKS LEFT REMINDER] Call for 2020Q1 quarterly status reports".
EOT
	exit 1;
}

my ($year, $quarter, $urgency) = @ARGV;

if($year < 1970)
{
	print <<'EOT';
It looks like you specified a year preceding 1970...
That must be wrong.
EOT
	exit 1;
}

if(not "$quarter" =~ "1|2|3|4")
{
	print <<'EOT';
The second argument should be a quarter (1, 2, 3 or 4).
EOT
	exit 1;
}

my $urgency_tag;

if($urgency eq "none") {$urgency_tag = '';}
elsif($urgency eq "2weeks") {$urgency_tag = '[2 WEEKS LEFT REMINDER] ';}
elsif($urgency eq "last") {$urgency_tag = '[LAST OFFICIAL REMINDER] ';}
else
{
	print "The urgency argument (third argument) must be 'none' or '2weeks' or 'last'.";
	exit 1;
}

my $summary = $urgency_tag."Call for ".$year."Q".$quarter." quarterly status reports";

open(destinataries_always, '<', "destinataries_always") or
die "Could not open destinataries_always: $!.";
open(destinataries_others, '<', "destinataries_others") or
die "Could not open destinataries_others: $!";
open(destinataries_optin, '<', "destinataries_optin") or
die "Could not open destinataries_optin: $!";

system "cat quarterly-mail | mail -s \"".$summary."\" ".$_ while(<destinataries_always>);
system "cat quarterly-mail | mail -s \"".$summary."\" ".$_ while(<destinataries_others>);
system "cat quarterly-mail | mail -s \"".$summary."\" ".$_ while(<destinataries_optin>);
