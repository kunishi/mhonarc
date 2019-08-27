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

