# Example 4.7
gap> br := SmallSkewbrace(12,22);;
gap> IsSimple(br);
true
gap> IsPrimeBrace(br);
true
gap> prod := DirectProductSkewbraces(br,br);;
gap> IsSimple(prod);
false
gap> IsPrimeBrace(prod);
false
gap> IsSemiprime(prod);
true

