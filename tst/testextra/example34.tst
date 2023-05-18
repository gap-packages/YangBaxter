#
gap> START_TEST("example34.tst");

# Example 3.4
gap> br :=SmallSkewbrace(24,50);;
gap> add := UnderlyingAdditiveGroup(br);;
gap> StructureDescription(add);
"SL(2,3)"
gap> mul :=  UnderlyingMultiplicativeGroup(br);;
gap> StructureDescription(mul);
"C3 : C8"
gap> LeftSeries(br);
[ <skew brace of size 24> ]
gap> RightSeries(br);
[ <ideal in <skew brace of size 24>, (size 24)> ]
gap> Socle(br);
<ideal in <skew brace of size 24>, (size 2)>

#
gap> STOP_TEST("example34.tst", 1);
