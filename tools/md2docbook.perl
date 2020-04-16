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
	'INTRODUCTION'	=>	0b1,
	'PROJECT'	=>	0b10,
	'CONTACT'	=>	0b100,
	'LINKS'		=>	0b1000,
	'P'		=>	0b10000,
	'BODY'		=> 	0b100000,
	'I'		=>	0b1000000,
	'B'		=>	0b10000000,
	'CODEBLOCK'	=>	0b100000000,
	);

my $flags = $FLAGS_DICTIONARY{INTRODUCTION};

my %CATEGORIES = (
# string Category_title	=> (string category tag, boolean is_category_used,
# integer description_first_line_number_in_report-template,
# integer description_last_line_number_in_report-template)
	"# FreeBSD Team Reports #\n" => ["team", 0, 50, 59],
	"# Projects #\n" => ["proj", 0, 60, 68],
	"# Kernel Projects #\n" => ["kern", 0, 69, 77],
	"# Architectures #\n" => ["arch", 0, 78, 86],
	"# Userland Programs #\n" => ["bin", 0, 87, 95],
	"# Ports #\n" => ["ports", 0, 96, 104],
	"# Documentation #\n" => ["doc", 0, 105, 113],
	"# Miscellaneous #\n" => ["misc", 0, 114, 121],
	"# Third-Party Projects #\n" => ["third", 0, 122, 133],
	);

my @SORTED_CATEGORY_NAMES = (
	"# FreeBSD Team Reports #\n",
	"# Projects #\n",
	"# Kernel Projects #\n",
	"# Architectures #\n",
	"# Userland Programs #\n",
	"# Ports #\n",
	"# Documentation #\n",
	"# Miscellaneous #\n",
	"# Third-Party Projects #\n",
	);

my $current_category;

my @active_margins;

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
	$_ =~ s,<(.*@.*)>,<a href='mailto:$1'>$1</a>,g;
	$_ =~ s,\[([^\[]*)\]\(([^\(]*://[^\(]*)\),<a href='$2'>$1</a>,g;
	$_ =~ s/([^\w\\]|\A)[*_]{3}(\S)/$1<b><i>$2/g;
	$_ =~ s/([^\s\\])[*_]{3}(\W|\Z)/$1<\/i><\/b>$2/g;
	$_ =~ s/([^\w\\]|\A)[*_]{2}(\S)/$1<b>$2/g;
	$_ =~ s/([^\s\\])[*_]{2}(\W|\Z)/$1<\/b>$2/g;
	$_ =~ s/([^\w\\]|\A)[*_](\S)/$1<i>$2/g;
	$_ =~ s/([^\s\\])[*_](\W|\Z)/$1<\/i>$2/g;
	if(test('CODEBLOCK'))
	{
		clear('CODEBLOCK') if($_ =~ s/`{3}/<\/code><\/pre>/);
	}
	else
	{
		set('CODEBLOCK') if($_ =~ s/`{3}/<pre><code>/);
	}
	$_ =~ s/([^\w\\]|\A)`([^\s,\.;:])/$1<code>$2/g;
	$_ =~ s/([^\s\\])`(\W|\Z)/$1<\/code>$2/g;
	$_ =~ s/\\([_-])/$1/g;
	$_ =~ s/&/&amp;/g;
	if($_ =~ s/Link:\s*//)
	{
		print "<links>\n" if(not test('LINKS'));
		set('LINKS');
		$_ =~ s-(</?)a-$1url-g;
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
			if(test('P'))
			{
				print "</p>";
				clear('P')
			}
			print "</li></ul>\n" and pop @active_margins
			while (@active_margins);
			<report_template> foreach(29..47);
			my $line = <report_template>;
			print $line;
			clear('INTRODUCTION');
		}
		$current_category = $CATEGORIES{$_}[0];
		$CATEGORIES{$_}[1] = 1;
		next;
	}
	if($_ =~ m/^####.*####/)
	{
		if(test('P'))
		{
			print "</p>";
			clear('P')
		}
		print "</li></ul>\n" and pop @active_margins
		while (@active_margins);
		$_ =~ s/#### | ####|\n//g; 
		print <<"EOT";
<h4>$_</h4>
EOT
		next;
	}
	if($_ =~ m/^###.*###/)
	{
		if(test('P'))
		{
			print "</p>";
			clear('P')
		}
		print "</li></ul>\n" and pop @active_margins
		while (@active_margins);
		$_ =~ s/### | ###|\n//g; 
		print <<"EOT";
<h3>$_</h3>
EOT
		next;
	}
	if($_ =~ m/^##.*##/)
	{
		if(test('P'))
		{
			print "</p>";
			clear('P')
		}
		print "</li></ul>\n" and pop @active_margins
		while (@active_margins);
		if(test('PROJECT'))
		{
			print "</body></project>\n";
			clear('BODY');
		}
		$_ =~ s/## | ##|\n//g; 
		print <<"EOT";
<project cat='$current_category'>
<title>$_</title>
EOT
		set('PROJECT');
		next;
	}
	if($_ =~ m/^\s*[-\*] /)
	{
		$_ =~ m/[-\*]/;
		my $current_margin = index($_,$&);
		$_ =~ s/^\s*[-\*] //;
		print "</p>" if(test('P'));
		set('P');
		if(not @active_margins or $current_margin > $active_margins[-1])
		{
			push @active_margins, $current_margin;
			print "<ul>\n";
		}
		elsif($current_margin < $active_margins[-1])
		{
			print "</li></ul>\n" and pop @active_margins
			while ($active_margins[-1] != $current_margin);
			print "</li>";
		}
		else
		{
			print "</li>\n";
		}
		print "<li><p>".$_;
		next;
	}
	elsif(@active_margins and $_ !~ m/^( |\n)/)
	{
		print "</li></ul>\n" and pop @active_margins
		while (@active_margins);
		print $_;
		next;
	}
	if(test('P') and $_ =~ m/^\s*$/)
	{
		print "</p>";
		clear('P');
		print $_;
		next;
	}
	elsif(not test('P') and $_ !~ m/^\s*$/)
	{
		if(not test('BODY') and not test('INTRODUCTION'))
		{
			print "<body>";
			set('BODY');
		}
		print "<p>";
		set('P');
		$_ =~ s,  $,<br />,g;
		print $_;
		next;
	}
	$_ =~ s,  $,<br />,g;
	print $_;
}
if(test('P'))
{
	print "</p>";
	clear('P')
}
print "</li></ul>\n" and pop @active_margins
while (@active_margins);
print "</body></project>";
foreach(@SORTED_CATEGORY_NAMES)
{
	my $line;
	if($CATEGORIES{$_}[1])
	{
		foreach($CATEGORIES{$_}[2]..$CATEGORIES{$_}[3])
		{
			$line = <report_template>;
			print $line;
		}
	}
	else
	{
		foreach($CATEGORIES{$_}[2]..$CATEGORIES{$_}[3])
		{
			$line = <report_template>;
		}
	}
}
print <report_template>;
