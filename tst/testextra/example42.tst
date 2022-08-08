#
gap> START_TEST("example42.tst");

# Example 4.2
gap> br := SmallSkewbrace(24,708);;
gap> IsPrimeBrace(br);
true
gap> IsSimple(br);
false

#
gap> STOP_TEST("example42.tst", 1);
