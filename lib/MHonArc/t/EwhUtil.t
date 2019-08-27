#!/usr/bin/env perl
# -*- mode: perl; coding: utf-8-unix; -*-
use utf8;
use strict;
use warnings;
use Test::More qw(no_plan);
use MHonArc::EwhUtil;

is( MHonArc::EwhUtil::htmlize('"'), "&quot;", "htmlize" );
is( MHonArc::EwhUtil::htmlize('&'), "&amp;",  "htmlize" );
is( MHonArc::EwhUtil::htmlize('<'), "&lt;",   "htmlize" );
is( MHonArc::EwhUtil::htmlize('>'), "&gt;",   "htmlize" );
is( MHonArc::EwhUtil::htmlize('@'), "@",      "htmlize" );

is( MHonArc::EwhUtil::entify('"'), "&quot;", "entify" );
is( MHonArc::EwhUtil::entify('&'), "&amp;",  "entify" );
is( MHonArc::EwhUtil::entify('<'), "&lt;",   "entify" );
is( MHonArc::EwhUtil::entify('>'), "&gt;",   "entify" );
is( MHonArc::EwhUtil::entify('@'), "@",      "entify" );

is( MHonArc::EwhUtil::commentize('-'), "&#45;", "commentize" );
is( MHonArc::EwhUtil::commentize('&'), "&#38;", "commentize" );
is( MHonArc::EwhUtil::commentize('<'), "&#60;", "commentize" );

is( MHonArc::EwhUtil::uncommentize('&#45;'), '-', "uncommentize" );
is( MHonArc::EwhUtil::uncommentize('&#38;'), '&', "uncommentize" );
is( MHonArc::EwhUtil::uncommentize('&#60;'), '<', "uncommentize" );

is( MHonArc::EwhUtil::dehtmlize('&lt;'), '<', "dehtmlize" );
is( MHonArc::EwhUtil::dehtmlize('&gt;'), '>', "dehtmlize" );
is( MHonArc::EwhUtil::dehtmlize('&#x40;'), '@', "dehtmlize" );
is( MHonArc::EwhUtil::dehtmlize('&#X40;'), '@', "dehtmlize" );
is( MHonArc::EwhUtil::dehtmlize('&#64;'), '@', "dehtmlize" );
is( MHonArc::EwhUtil::dehtmlize('&quot;'), '"', "dehtmlize" );
is( MHonArc::EwhUtil::dehtmlize('&amp;'), '&', "dehtmlize" );

is( MHonArc::EwhUtil::urlize('foo@example.com'), 'foo%40example.com', "urlize" );
is( MHonArc::EwhUtil::urlize('/file.txt'), '%2Ffile.txt', "urlize" );
is( MHonArc::EwhUtil::urlize_path('foo@example.com'), 'foo%40example.com', "urlize_path" );
is( MHonArc::EwhUtil::urlize_path('/file.txt'), '/file.txt', "urlize_path" );
