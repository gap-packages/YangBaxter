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
[ <brace of size 1>, <brace of size 2>, <brace of size 3>, <brace of size 6> ]
gap> List(left_ideals, x->IsIdeal(br, x));
[ true, false, true, true ]
gap> SortedList(List(Ideals(br),Size));
[ 1, 3, 6 ]
