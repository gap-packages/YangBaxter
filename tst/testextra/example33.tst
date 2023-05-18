#
gap> START_TEST("example33.tst");

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
[ <ideal in <skew brace of size 12>, (size 12)> ]

#
gap> STOP_TEST("example33.tst", 1);
