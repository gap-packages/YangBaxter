#
gap> START_TEST("example26.tst");

# Example 3.5
gap> br := SmallBrace(6,1);;
gap> IsTrivialSkewbrace(br);
false
gap> add := UnderlyingAdditiveGroup(br);;
gap> StructureDescription(add);
"C6"
gap> mul := UnderlyingMultiplicativeGroup(br);;
gap> StructureDescription(mul);
"S3"
gap> IdGroup(add);
[ 6, 2 ]
gap> IdGroup(mul);
[ 6, 1 ]
gap> left_ideals := ShallowCopy(LeftIdeals(br));;
gap> SortBy(left_ideals,Size);
gap> left_ideals;
[ <left ideal in <brace of size 6>, (size 1)>, <left ideal in <brace of size 6>, (size 2)>
    , <left ideal in <brace of size 6>, (size 3)>,
  <left ideal in <brace of size 6>, (size 6)> ]
gap> List(left_ideals, x->IsIdeal(br, x));
[ true, false, true, true ]
gap> SortedList(List(Ideals(br),Size));
[ 1, 3, 6 ]

#
gap> STOP_TEST("example26.tst", 1);
