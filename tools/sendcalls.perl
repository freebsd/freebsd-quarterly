#!/usr/bin/env perl
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

my $day;
my $month;
my $year;
my $quarter;
my $urgency_tag;

if(scalar @ARGV == 3)
{
	($day, $month, $year) = @ARGV;
	$month = $month - 1;
}
elsif(scalar @ARGV > 0)
{
	print <<EOT;
Usage: ./sendcalls.perl <day> <month> <year>
Example: ./sendcalls.perl 23 12 2000
EOT
	exit 1;
}
else
{
	(undef, undef, undef, $day, $month, $year, undef, undef, undef) = localtime();
	$year = $year + 1900;
}

if($day < 14)
{
	$urgency_tag = '';
}
elsif($day < 23)
{
	$urgency_tag = '[2 WEEKS LEFT REMINDER] ';
}
else
{
	$urgency_tag = '[LAST OFFICIAL REMINDER] ';
}

$quarter = int($month / 3) + 1;

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
