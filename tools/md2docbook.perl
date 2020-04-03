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

my %FLAGS_DICTIONARY	= (
	'INTRODUCTION' => 0b1,
	'PROJECT' => 	0b10,
	'CONTACT' => 	0b100,
	'LINKS' => 	0b1000,
	'UL' => 	0b10000
	);

my $flags = $FLAGS_DICTIONARY{INTRODUCTION};

my %CATEGORIES = (
	"# FreeBSD Team Reports #\n" => "team",
	"# Projects #\n" => "proj",
	"# Userland Programs #\n" => "bin",
	"# Kernel Projects #\n" => "kern",
	"# Architectures #\n" => "arch",
	"# Documentation #\n" => "doc",
	"# Ports #\n" => "ports",
	"# Third-Party Projects #\n" => "third",
	"# Miscellaneous #\n" => "misc"
	);

my $current_category;

sub clear
{
	$flags = $flags & ~ $FLAGS_DICTIONARY{$_[0]};
}

sub set
{
	$flags = $flags | $FLAGS_DICTIONARY{$_[0]};
}

sub test
{
	return $flags & $FLAGS_DICTIONARY{$_[0]};
}

open(report_template, '<', "report-template.xml") or
die "Could not open report-template.xml: $!";

foreach(1..28)
{
	my $line = <report_template>;
	print $line;
}
while(<>)
{
	if($_ =~ m/^Contact: .*@.*/)
	{
		$_ =~ m-Contact:([^,]*)[ ,]*<(.*)>-;
		my $name = $1;
		my $email = $2;
		$name =~ s/^ *| *$//g;
		print "<contact>\n" if(not test('CONTACT'));
		print <<"EOT";
<person>
<name>$name</name>
<email>$email</email>
</person>
EOT
		set('CONTACT');
		next;
	}
	elsif(test('CONTACT'))
	{
		print "</contact>\n";
		clear('CONTACT');
	}
	$_ =~ s,\[(.*)\](\(.*://.*\)),<a href='$2'>$1</a>,g;
	if($_ =~ s/Link:\s*//)
	{
		print "<links>\n" if(not test('LINKS'));
		set('LINKS');
		print $_;
		next;
	}
	elsif(test('LINKS'))
	{
		print "</links>\n";
		clear('LINKS');
	}
	if(exists $CATEGORIES{$_})
	{
		if(test('INTRODUCTION'))
		{
			<report_template> foreach (29..49);
			foreach(50..134)
			{
				my $line = <report_template>;
				print $line;
			}
			clear('INTRODUCTION');
			$current_category = $CATEGORIES{$_};
		}
		next;
	}
	if($_ =~ m/^###.*###/)
	{
		$_ =~ s/### | ###|\n//g; 
		print <<"EOT";
<h3>$_</h3>
EOT
		next;
	}
	if($_ =~ m/^##.*##/)
	{
		if(test('UL'))
		{
					print "</li></ul>\n";
			clear('UL');
		}
		print "</project>\n" if(test('PROJECT'));
		$_ =~ s/## | ##|\n//g; 
		print <<"EOT";
<project cat='$current_category'>
<title>$_</title>
EOT
		set('PROJECT');
		next;
	}
	if($_ =~ s/^[-\*] //)
	{
		test('UL') ? print "</li>\n" : print "<ul>\n";
		set('UL');
		print "<li>".$_;
		next;
	}
	if($_ !~ m/^ / and test('UL'))
	{
		print "</li></ul>\n";
		clear('UL');
		next;
	}
	print $_;
}
print <report_template>
