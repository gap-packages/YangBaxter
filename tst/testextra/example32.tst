#
gap> START_TEST("example32.tst");

# Example 3.2
gap> br := SmallBrace(16,73);;
gap> ideals := Ideals(br);;
gap> SortedList(List(ideals, IdBrace));
[ [ 1, 1 ], [ 2, 1 ], [ 4, 1 ], [ 4, 2 ], [ 4, 3 ], [ 8, 10 ], [ 8, 13 ], 
  [ 8, 19 ], [ 16, 73 ] ]
gap> x := ideals[ PositionProperty( [ 1.. Length(ideals)], i -> IdBrace(ideals[i])=[8,10]) ];;
gap> Star(x, x);
[ <()>, <( 1, 2)( 3, 4)( 5, 6)( 7, 8)( 9,10)(11,12)(13,14)(15,16)> ]
gap> IsIdeal(br, last);
false

#
gap> STOP_TEST("example32.tst", 1);
