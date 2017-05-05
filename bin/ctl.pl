#!/usr/bin/perl

use strict;
use warnings;

use FindBin qw( $Bin );
use lib "$Bin/../lib";

use hoge::fuga::Fugo;

print hoge::fuga::Fugo::pr(), "\n";

