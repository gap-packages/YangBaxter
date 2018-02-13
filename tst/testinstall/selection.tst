#############################################################################
##
##  selection.tst          YangBaxter package               Leandro Vendramin
##                                                        Alexander Konovalov

gap> START_TEST("ideals.tst");

# Simple calls
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
>      br->IdGroup(UnderlyingAdditiveGroup(br)),[8,1]);
[ <brace of size 8>, <brace of size 8>, <brace of size 8> ]
gap> AllSmallSkewBraces(8,IsTwoSided,false,
>      br->IdGroup(UnderlyingAdditiveGroup(br)),[8,1]);
[ <brace of size 8>, <brace of size 8> ]

# Error messages
gap> AllSmallSkewBraces(1024);
Error, skew braces of size 1024 are not implemented
gap> AllSmallBraces();
Error, You must specify at least one argument - the order of the brace
gap> AllSmallBraces(true);
Error, The first argument must be a positive integer or 'Size'
gap> AllSmallSkewBraces(Size,IsSimpleSkewBrace);
Error, The 2nd argument must be a positive integer - the order of the brace
gap> AllSmallSkewBraces(16,true);
Error, Expected a function, but got true
gap> AllSmallSkewBraces(8,IsTwoSided,true,[8,1]);
Error, Expected a function, but got [ 8, 1 ]
gap> STOP_TEST( "selection.tst", 1 );

#############################################################################
##
#E

