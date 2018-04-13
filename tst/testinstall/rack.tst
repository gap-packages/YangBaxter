#############################################################################
##
##  rack.tst              YangBaxter package               Leandro Vendramin
##

gap> START_TEST("rack.tst");

# Test basic stuff
gap> obj := DerivedRack(Skewbrace2YB(SmallSkewbrace(10,4)));
<A rack of size 10>
gap> Matrix(obj);
[ [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ], [ 1, 2, 3, 4, 5, 9, 10, 6, 7, 8 ], 
  [ 1, 2, 3, 4, 5, 7, 8, 9, 10, 6 ], [ 1, 2, 3, 4, 5, 10, 6, 7, 8, 9 ], 
  [ 1, 2, 3, 4, 5, 8, 9, 10, 6, 7 ], [ 1, 5, 4, 3, 2, 6, 10, 9, 8, 7 ], 
  [ 1, 5, 4, 3, 2, 8, 7, 6, 10, 9 ], [ 1, 5, 4, 3, 2, 10, 9, 8, 7, 6 ], 
  [ 1, 5, 4, 3, 2, 7, 6, 10, 9, 8 ], [ 1, 5, 4, 3, 2, 9, 8, 7, 6, 10 ] ]
gap> for x in obj do
> for y in obj do
> for z in obj do
> if x*(y*z) <> (x*y)*(x*z) then
> Print("This is wrong!\n");
> fi;
> od;
> od;
> od;
gap> Rack([[2,1],[1,2]]);
Error, this is not a rack
gap> r := Rack([[1,2],[1,2]]);
<A rack of size 2>
gap> r := Rack([[1,2],[1,2]]);;
gap> Display(r);
Rack( [ [ 1, 2 ], [ 1, 2 ] ] )
gap> Rack2YB(r);
<A set-theoretical solution of size 2>
gap> STOP_TEST( "rack.tst", 1 );

#############################################################################
##
#E

