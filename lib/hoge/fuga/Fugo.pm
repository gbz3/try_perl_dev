package hoge::fuga::Fugo;

sub pr {
  if( $ENV{ TEST_PATH2JSON } ) {
    if( -e $ENV{ TEST_PATH2JSON } ) {
      return "found.";
    } else {
      return "not found.";
    }
  }
  return "fugo.";
}

sub sendMessage {
  my $path = shift;
  system $path '/bin/aaa', 'arg1=1','arg2=2';

  if( $? == -1 ) {
    print "p> failed to execute: $!\n";
  } elsif( $? & 127 ) {
    printf "p> child died with signal %d\n", ( $? & 127 );
  } else {
    printf "p> child exited with value %d\n", $? >> 8;
  }

}


1;
