LoadPackage( "yangbaxter" );

TestDirectory( Concatenation(
  DirectoriesPackageLibrary("yangbaxter","tst/testextra"),
  DirectoriesPackageLibrary("yangbaxter","tst/manualexamples"),
  DirectoriesPackageLibrary("yangbaxter","tst/testinstall")
  ), rec(exitGAP     := true,
      testOptions := rec(compareFunction := "uptowhitespace") ) );

FORCE_QUIT_GAP(1); # if we ever get here, there was an error

