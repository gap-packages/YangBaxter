#############################################################################
##
##  ideals.tst               YangBaxter package               Leandro Vendramin
##

gap> START_TEST("ideals.tst");

# Test simple braces
gap> n := 12;;
gap> for k in [1..NrSmallSkewBraces(n)] do
> br := SmallSkewBrace(n,k);
> if IsSimpleSkewBrace(br) then
> Print("n=", n, ", k=", k, "\n");
> fi;
> od;
n=12, k=22
n=12, k=23

# Test the socle
# The results are matched with arXiv:1407.5224
gap> l := [];;
gap> for k in [1..NrSmallBraces(8)] do
> br := SmallBrace(8,k);
> Add(l, Size(Socle(br)));
> od;
gap> Collected(l);
[ [ 1, 2 ], [ 2, 11 ], [ 4, 11 ], [ 8, 3 ] ]

# Test IsIdeal
gap> for k in [1..NrSmallSkewBraces(8)] do
> br := SmallSkewBrace(8,k);
> soc := Socle(br);
> if not IsIdeal(br, soc) then
> Print("This is wrong!\n");
> fi;
> od;
gap> STOP_TEST( "ideals.tst", 1 );

#############################################################################
##
#E

