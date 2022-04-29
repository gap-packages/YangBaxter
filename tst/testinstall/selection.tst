#############################################################################
##
##  selection.tst          YangBaxter package               Leandro Vendramin
##                                                         Olexandr Konovalov

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
gap> AllSmallSkewbraces(4);
[ <brace of size 4>, <brace of size 4>, <brace of size 4>, <brace of size 4> ]
gap> AllSmallSkewbraces(Size,4);
[ <brace of size 4>, <brace of size 4>, <brace of size 4>, <brace of size 4> ]

# Supplying additional restrictions
gap> AllSmallSkewbraces(12,IsSimpleSkewbrace);
[ <skew brace of size 12>, <skew brace of size 12> ]
gap> AllSmallSkewbraces(4,IsTwoSided);
[ <brace of size 4>, <brace of size 4>, <brace of size 4>, <brace of size 4> ]
gap> AllSmallSkewbraces(10,IsTwoSided,false);
[ <brace of size 10> ]
gap> AllSmallSkewbraces(8,IsTwoSided,
>      br->IdGroup(UnderlyingAdditiveGroup(br)),[[8,1]]);
[ <brace of size 8>, <brace of size 8>, <brace of size 8> ]
gap> AllSmallSkewbraces(8,IsTwoSided,false,
>      br->IdGroup(UnderlyingAdditiveGroup(br)),[[8,1]] );
[ <brace of size 8>, <brace of size 8> ]

# Error messages
gap> AllSmallSkewbraces(1024);
Error, skew braces of sizes [ 1024 ] are not implemented
gap> AllSmallBraces();
Error, You must specify at least one argument
gap> AllSmallBraces(true);
Error, The 1st argument is not a positive integer or a list
gap> AllSmallBraces([true]);
Error, The 1st argument is not a list of positive integers
gap> AllSmallSkewbraces(Size,IsSimpleSkewbrace);
Error, The 2nd argument is not a positive integer or a list
gap> AllSmallSkewbraces(16,true);
Error, Expected a function, but got true
gap> AllSmallSkewbraces(8,IsTwoSided,true, [[8,1]]);
Error, Expected a function, but got [ [ 8, 1 ] ]
gap> STOP_TEST( "selection.tst", 1 );

#############################################################################
##
#E

