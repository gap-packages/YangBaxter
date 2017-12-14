#############################################################################
##
##  ybe.tst               YangBaxter package               Leandro Vendramin
##

gap> START_TEST("ybe.tst");

# Test basic stuff
gap> cs := SmallCycleSet(8,1601);;
gap> yb := CycleSet2YB(cs);;
gap> IsInvolutive(yb);
true
gap> IsRetractable(yb);
true
gap> Permutations(cs);
[ (7,8), (7,8), (1,2)(7,8), (1,8,2,7), (1,8,2,7), (1,8,2,7)(4,5), (1,2), (1,2) ]

# Test the counterexample to a conjecture of Gateva-Ivanova
gap> yb := SmallIYB(8,1680);;
gap> IsSquareFree(yb);
true
gap> IsRetractable(yb);
false
gap> IsInvolutive(yb);
true
gap> Permutations(yb);
[ [ (7,8), (5,6), (2,5)(4,6)(7,8), (1,7)(3,8)(5,6), (2,4), (1,7)(2,4)(3,8), (1,3), (1,3)(2,5)(4,6) ], [ (7,8), (5,6), (2,5)(4,6)(7,8), (1,7)(3,8)(5,6), (2,4), (1,7)(2,4)(3,8), (1,3), (1,3)(2,5)(4,6) ] ]
gap> STOP_TEST( "ybe.tst", 1 );

#############################################################################
##
#E

