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

1;
