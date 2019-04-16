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

# Test YB2Permutation
gap> Collected(List(List([1..NrSmallIYB(5)], k->YB2Permutation(SmallIYB(5,k))), Order));
[ [ 2, 88 ] ]

# Test for RestrictedYB
gap> yb := SmallIYB(8,500);;
gap> RestrictedYB(yb, [1,2,3]);
<A set-theoretical solution of size 3>
gap> RestrictedYB(yb, [1,2,4]);
fail

# Test Dehornoy's linear representation
gap> cs := SmallCycleSet(4,13);;
gap> yb := CycleSet2YB(cs);;
gap> Permutations(yb);
[ [ (3,4), (1,3,2,4), (1,4,2,3), (1,2) ], 
  [ (2,4), (1,4,3,2), (1,2,3,4), (1,3) ] ]
gap> field := FunctionField(Rationals, 1);;
gap> q := IndeterminatesOfFunctionField(field)[1];;
gap> G := DehornoyRepresentationOfStructureGroup(yb, q);;
gap> x1 := G.1;;
gap> x2 := G.2;;
gap> x3 := G.3;;
gap> x4 := G.4;;
gap> x1*x2=x2*x4;
true
gap> x1*x3=x4*x2;
true
gap> x1*x4=x3*x3;
true
gap> x2*x1=x3*x4;
true
gap> x2*x2=x4*x1;
true
gap> x3*x1=x4*x3;
true

# Test the class of an involutive solution
gap> cs := SmallCycleSet(4,13);;
gap> yb := CycleSet2YB(cs);;
gap> DehornoyClass(yb);
2
gap> cs := SmallCycleSet(4,19);;
gap> yb := CycleSet2YB(cs);;
gap> DehornoyClass(yb);
4
gap> STOP_TEST( "ybe.tst", 1 );
#############################################################################
##
#E

