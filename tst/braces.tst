#############################################################################
##
##  braces.tst             YangBaxter package               Leandro Vendramin
##
gap> START_TEST("Example package: testall.tst");
gap> br:=SmallSkewBrace(8,1);
A skew brace of size 8
gap> CategoriesOfObject(br);
[ "IsSkewBrace" ]
gap> SkewBraceAGroup(br);
Group([ (), (1,7,4,5,2,8,3,6), (1,4,2,3)(5,8,6,7), (1,2)(3,4)(5,6)(7,8), (1,5,3,7,
2,6,4,8), (1,3,2,4)(5,7,6,8), (1,8,4,6,2,7,3,5), (1,6,3,8,2,5,4,7) ])
gap> SkewBraceMGroup(br);
Group([ (), (1,5,4,8,2,6,3,7), (1,3,2,4)(5,7,6,8), (1,2)(3,4)(5,6)(7,8), (1,7,3,6,
2,8,4,5), (1,4,2,3)(5,8,6,7), (1,6,4,7,2,5,3,8), (1,8,3,5,2,7,4,6) ])
gap> STOP_TEST( "braces.tst", 1 );

#############################################################################
##
#E
