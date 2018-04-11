# Example 3.5
gap> br := SmallBrace(6,1);;
gap> IsTrivialSkewBrace(br);
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
gap> LeftIdeals(br);
[ <brace of size 1>, <brace of size 2>, <brace of size 3>, <brace of size 6> ]
gap> List(last, x->IsIdeal(br, x));
[ true, false, true, true ]
gap> Ideals(br);
[ <brace of size 1>, <brace of size 3>, <brace of size 6> ]

