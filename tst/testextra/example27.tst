#
gap> START_TEST("example27.tst");

# Example 3.7
gap> br := SmallBrace(8,18);;
gap> ideals := Ideals(br);;
gap> SortedList(List(ideals, IdBrace));
[ [ 1, 1 ], [ 4, 3 ], [ 8, 18 ] ]
gap> Star(AsIdeal(br, br), ideals[2]);
[ <()>, <(1,2)(3,4)(5,6)(7,8)> ]

#
gap> STOP_TEST("example27.tst", 1);
