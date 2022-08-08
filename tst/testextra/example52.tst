#
gap> START_TEST("example52.tst");

# Example 5.2
gap> br := SmallBrace(48,396);;
gap> solvable_series := SolvableSeries(br);;
gap> List(solvable_series, IdBrace);
[ [ 48, 396 ], [ 24, 58 ], [ 6, 1 ], [ 3, 1 ], [ 1, 1 ] ]
gap> List(solvable_series, x->IsIdeal(br, x));
[ true, true, false, true, true ]

#
gap> STOP_TEST("example52.tst", 1);
