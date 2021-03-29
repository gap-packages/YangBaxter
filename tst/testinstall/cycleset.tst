#############################################################################
##
##  cycleset.tst            YangBaxter package               Leandro Vendramin
##

gap> START_TEST("cycleset.tst");

# Test basic stuff
gap> obj := SmallCycleSet(8,100);;
gap> for a in obj do
> for b in obj do
> for c in obj do
> if (a*b)*(a*c) <> (b*a)*(b*c) then
> Print("This is wrong!\n");
> fi;
> od;
> od;
> od;
gap> Permutations(obj);
[ (), (), (), (), (), (3,5,4), (3,5,4), (1,2)(3,5,4) ]
gap> Matrix(obj);
[ [ 1, 2, 3, 4, 5, 6, 7, 8 ], [ 1, 2, 3, 4, 5, 6, 7, 8 ], 
  [ 1, 2, 3, 4, 5, 6, 7, 8 ], [ 1, 2, 3, 4, 5, 6, 7, 8 ], 
  [ 1, 2, 3, 4, 5, 6, 7, 8 ], [ 1, 2, 5, 3, 4, 6, 7, 8 ], 
  [ 1, 2, 5, 3, 4, 6, 7, 8 ], [ 2, 1, 5, 3, 4, 6, 7, 8 ] ]
gap> AsList(obj);
[ <1>, <2>, <3>, <4>, <5>, <6>, <7>, <8> ]
gap> List([1..8], k->NrSmallCycleSets(k));
[ 1, 2, 5, 23, 88, 595, 3456, 34530 ]
gap> Number(List([1..NrSmallCycleSets(5)], k->SmallCycleSet(5,k)), IsSquareFree);
17
gap> cs := SmallCycleSet(5,10);;
gap> yb := CycleSet2YB(cs);;
gap> IsInvolutive(yb);
true
gap> IsRetractable(yb);
true
gap> IsSquareFree(cs);
false
gap> IsSquareFree(yb);
false
gap> STOP_TEST( "cycleset.tst", 1 );

#############################################################################
##
#E

