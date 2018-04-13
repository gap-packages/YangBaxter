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
<brace of size 1>

