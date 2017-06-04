#!/usr/bin/perl

use strict;
use warnings;

use Test::More;
use Test::Output;

use FindBin qw( $Bin );
use lib "$Bin/../../../../lib";

BEGIN {
  use_ok( 'hoge::fuga::Fugo' ) || BAIL_OUT();
}

my $stdout;

$stdout = stdout_from { hoge::fuga::Fugo::sendMessage( "$Bin/msg" ) };
print "[$stdout]\n";

$stdout = stdout_from { hoge::fuga::Fugo::sendMessage( "$Bin/msg2" ) };
print "[$stdout]\n";

my $pid = fork();

if( $pid == 0 ) {
  # child
  $stdout = stdout_from { hoge::fuga::Fugo::sendMessage( "$Bin/msg3" ) };
  print "[$stdout]\n";
  exit;

} elsif( $pid > 0 ) {
  # parent
  sleep 1;
  my $cmdPid = `ps -ef |awk '{ if( \$3 == $pid ) print \$2 }'`;
  #my $cmdPid = `ps -ef`;
  print "[$cmdPid]$pid\n";
  my $cnt = kill 'HUP', $cmdPid;
  print "cnt=[$cnt]\n";
  my $ps = `ps -ef`;
  print "[$ps]\n";
  my $wait = wait;
  print "wait=$wait\n";

} else {
  print "fork failed: $!\n";
}

done_testing;
