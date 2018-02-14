#############################################################################
##
##  selection.tst          YangBaxter package               Leandro Vendramin
##                                                        Alexander Konovalov

gap> START_TEST("ideals.tst");

# Simple calls
gap> AllSmallBraces([1..3]);
[ <brace of size 1>, <brace of size 2>, <brace of size 3> ]
gap> AllSmallBraces([1,3,5]);
[ <brace of size 1>, <brace of size 3>, <brace of size 5> ]
gap> AllSmallBraces(9);
[ <brace of size 9>, <brace of size 9>, <brace of size 9>, <brace of size 9> ]
gap>  AllSmallBraces(Size,9);
[ <brace of size 9>, <brace of size 9>, <brace of size 9>, <brace of size 9> ]
gap> AllSmallSkewBraces(4);
[ <brace of size 4>, <brace of size 4>, <brace of size 4>, <brace of size 4> ]
gap> AllSmallSkewBraces(Size,4);
[ <brace of size 4>, <brace of size 4>, <brace of size 4>, <brace of size 4> ]

# Supplying additional restrictions
gap> AllSmallSkewBraces(12,IsSimpleSkewBrace);
[ <skew brace of size 12>, <skew brace of size 12> ]
gap> AllSmallSkewBraces(4,IsTwoSided);
[ <brace of size 4>, <brace of size 4>, <brace of size 4>, <brace of size 4> ]
gap> AllSmallSkewBraces(10,IsTwoSided,false);
[ <brace of size 10> ]
gap> AllSmallSkewBraces(8,IsTwoSided,
>      br->IdGroup(UnderlyingAdditiveGroup(br)),[[8,1]]);
[ <brace of size 8>, <brace of size 8>, <brace of size 8> ]
gap> AllSmallSkewBraces(8,IsTwoSided,false,
>      br->IdGroup(UnderlyingAdditiveGroup(br)),[[8,1]] );
[ <brace of size 8>, <brace of size 8> ]

# Error messages
gap> AllSmallSkewBraces(1024);
Error, skew braces of sizes [ 1024 ] are not implemented
gap> AllSmallBraces();
Error, You must specify at least one argument
gap> AllSmallBraces(true);
Error, The 1st argument is not a positive integer or a list
gap> AllSmallBraces([true]);
Error, The 1st argument is not a list of positive integers
gap> AllSmallSkewBraces(Size,IsSimpleSkewBrace);
Error, The 2nd argument is not a positive integer or a list
gap> AllSmallSkewBraces(16,true);
Error, Expected a function, but got true
gap> AllSmallSkewBraces(8,IsTwoSided,true, [[8,1]]);
Error, Expected a function, but got [ [ 8, 1 ] ]
gap> STOP_TEST( "selection.tst", 1 );

#############################################################################
##
#E

