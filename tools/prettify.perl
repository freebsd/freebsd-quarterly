#!/usr/local/bin/perl
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

my ($Filename, $QUARTER_WORD, $YEAR) = @ARGV;

use warnings;
use strict;

open INPUT, "<".$Filename or die "Error in opening $Filename: $!";
open OUTPUT, ">".$Filename.".out" or die "Error in opening $Filename.out: $!";

print OUTPUT "FreeBSD Project Quarterly Status Report - $QUARTER_WORD Quarter ${YEAR}\n";

my $Precedent_line = "";
my $Next_line_is_URL = 0;	#this variable keeps track of when the next line is an URL in the Links sections

while (<INPUT>)
{
	next if $. < 85;
	$_ =~ s%Napieral/a%Napierała%g;
	$_ =~ s%URL: *%\n    URL: %;
	if ($Next_line_is_URL == 1)
	{
		$_ =~ s%^ * %%;
		$Next_line_is_URL = 0;
	}
	if ($_ =~ m%URL: \n%)
	{
		$_ =~ s%URL: \n%URL: %;
		$Next_line_is_URL = 1;
	}
	if ($Precedent_line ne "")
	{
		if ($_ ne "\n" and not $_ =~ m%Contact: % and not $_ =~ m%    \*%)
		{
			my $Answer = "";
			print "Do you want to join\n".$Precedent_line."and\n".$_."(the new line would automatically break at the first space in the second joined line, if any)? (Y/N)";
			$Answer=<STDIN> while (not $Answer =~ m%Y|y|n|N%);
			if ($Answer =~ m%Y|y%)
			{
				$Precedent_line =~ s%\n%%;
				$_ =~ s/^[ ]*//;
				if ($_ =~ m% %)
				{
					$_ =~ s% %\n   %;
					$_ = $Precedent_line.$_;
					$Precedent_line = "";
				}
				else
				{
					if ($_ =~ m%https?://[^ ]*$%)
					{
						my $tmp = $_;
						$_ = $Precedent_line; 
						$Precedent_line = $tmp;
					}
					else
					{
						$_ = $Precedent_line.$_;
						$Precedent_line = $_;
						next;
					}
				}
			}
			else
			{
				$_ = $Precedent_line.$_;
				$Precedent_line = "";
			}
		}
		else
		{
			$_ = $Precedent_line.$_;
			$Precedent_line = "";
		}
	}
	elsif ($_ =~ m%https?://[^ ]*$%)
	{
		$Precedent_line = $_;
		next;
	}
	print OUTPUT $_;
}
