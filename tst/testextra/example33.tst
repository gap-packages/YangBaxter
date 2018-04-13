# Example 3.3
gap> br := SmallSkewbrace(12,22);;
gap> StructureDescription(UnderlyingAdditiveGroup(br));
"A4"
gap> StructureDescription(UnderlyingMultiplicativeGroup(br));
"C3 : C4"
gap> IsSimpleSkewbrace(br);
true
gap> LeftSeries(br);
[ <skew brace of size 12> ]
gap> RightSeries(br);
[ <skew brace of size 12> ]

