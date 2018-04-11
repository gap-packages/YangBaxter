# Example 2.3
gap> br := SmallSkewBrace(6,1);;
gap> IsTrivialSkewBrace(br);
true
gap> add := UnderlyingAdditiveGroup(br);;
gap> StructureDescription(add);
"S3"
gap> mul := UnderlyingMultiplicativeGroup(br);;
gap> StructureDescription(mul);
"S3"
gap> Socle(br);
<brace of size 1>

