#
gap> START_TEST("example31.tst");

# Example 3.1
gap> br := SmallSkewbrace(36,191);;
gap> left_series := LeftSeries(br);;
gap> List(left_series, IdSkewbrace);
[ [ 36, 191 ], [ 18, 22 ], [ 3, 1 ] ]
gap> List(left_series, x->IsIdeal(br, x));
[ true, true, false ]

#
gap> STOP_TEST("example31.tst", 1);
