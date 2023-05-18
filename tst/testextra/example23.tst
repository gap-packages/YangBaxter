#
gap> START_TEST("example23.tst");

# Example 2.3
gap> br := SmallSkewbrace(6,1);;
gap> IsTrivialSkewbrace(br);
true
gap> add := UnderlyingAdditiveGroup(br);;
gap> StructureDescription(add);
"S3"
gap> mul := UnderlyingMultiplicativeGroup(br);;
gap> StructureDescription(mul);
"S3"
gap> Socle(br);
<ideal in <skew brace of size 6>, (size 1)>

#
gap> STOP_TEST("example23.tst", 1);
