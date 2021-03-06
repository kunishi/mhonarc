##---------------------------------------------------------------------------##
##  File:
##	$Id: ewhutil.pl,v 2.17 2012/01/29 18:32:36 ehood Exp $
##  Author:
##      Earl Hood       mhonarc@mhonarc.org
##  Description:
##      Generic utility routines
##---------------------------------------------------------------------------##
##    Copyright (C) 1996-2001,2012	Earl Hood, mhonarc@mhonarc.org
##
##    This program is free software; you can redistribute it and/or modify
##    it under the terms of the GNU General Public License as published by
##    the Free Software Foundation; either version 2 of the License, or
##    (at your option) any later version.
##
##    This program is distributed in the hope that it will be useful,
##    but WITHOUT ANY WARRANTY; without even the implied warranty of
##    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##    GNU General Public License for more details.
##
##    You should have received a copy of the GNU General Public License
##    along with this program; if not, write to the Free Software
##    Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
##    02111-1307, USA
##---------------------------------------------------------------------------##

package MHonArc::EwhUtil;
use HTML::Entities;
use URI::Escape;

my $HTMLSpecials = '"&<>';
my %HTMLSpecials = (
  '"'	=> '&quot;',
  '&'	=> '&amp;',
  '<'	=> '&lt;',
  '>'	=> '&gt;',
  # '@'	=> '&#x40;',  # XXX: Screws up ISO-2022-JP conversion
);

##---------------------------------------------------------------------------
##	Remove duplicates in an array.
##	Returns list with duplicates removed.
##
sub remove_dups {
    my $a = shift;
    return ()  unless scalar(@$a);
    my %dup = ();
    grep(!$dup{$_}++, @$a);
}

##---------------------------------------------------------------------------
##	"Entify" special characters

sub htmlize {			# Older name
    return HTML::Entities::encode_entities($_[0]);
}

sub entify {			# Alternate name
    return HTML::Entities::encode_entities($_[0]);
}

##	commentize entifies certain characters to avoid problems when a
##	string will be included in a comment declaration

sub commentize {
    my($txt) = $_[0];
    $txt =~ s/([\-&<])/'&#'.unpack('C',$1).';'/ge;
    $txt;
}

sub uncommentize {
    my($txt) = $_[0];
    $txt =~ s/&#(\d+);/pack("C",$1)/ge;
    $txt;
}

##---------------------------------------------------------------------------
##	Copy a file.
##
sub cp {
    my($src, $dst) = @_;
    open(SRC, $src) || die("ERROR: Unable to open $src\n");
    open(DST, "> $dst") || die("ERROR: Unable to create $dst\n");
    print DST <SRC>;
    close(SRC);
    close(DST);
}

##---------------------------------------------------------------------------
##	Translate html string back to regular string
##
sub dehtmlize {
    return HTML::Entities::decode_entities($_[0]);
}

##---------------------------------------------------------------------------
##	Escape special characters in string for URL use.
##
sub urlize {
    my($url) = shift || "";
    return URI::Escape::uri_escape($url);
}

sub urlize_path {
    my($url) = shift || "";
    return URI::Escape::uri_escape($url, "^A-Za-z0-9\-_.!~*'()/");
}

##---------------------------------------------------------------------------##
##	Perform a "modified" rot13 on a string.  This version includes
##	the '@' character so addresses can be munged a little better.
##
sub mrot13 {
    my $str	= shift;
    $str =~ tr/@A-Z[a-z/N-Z[@A-Mn-za-m/;
    $str;
}

##---------------------------------------------------------------------------##
1;
