# Example 4.7
gap> br := SmallSkewbrace(12,22);;
gap> IsSimple(br);
true
gap> IsPrime(br);
true
gap> prod := DirectProductSkewbraces(br,br);;
gap> IsSimple(prod);
false
gap> IsPrime(prod);
false
gap> IsSemiprime(prod);
true

