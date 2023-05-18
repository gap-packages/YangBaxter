#
gap> START_TEST("example429.tst");

# Example 4.29
gap> br := SmallSkewbrace(6,2);;
gap> IdBrace(WedderburnRadical(br));
[ 3, 1 ]
gap> BaerRadical(br);
<ideal in <skew brace of size 6>, (size 6)>

	 

#
gap> STOP_TEST("example429.tst", 1);
