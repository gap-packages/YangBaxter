# Example 4.7
gap> br := SmallSkewBrace(12,22);;
gap> IsSimple(br);
true
gap> IsPrime(br);
true
gap> prod := DirectProductSkewBraces(br,br);;
gap> IsSimple(prod);
false
gap> IsPrime(prod);
false
gap> IsSemiprime(prod);
true

