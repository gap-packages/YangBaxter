#############################################################################
##
##  ideals.tst               YangBaxter package               Leandro Vendramin
##

gap> START_TEST("ideals.tst");

# Test simple braces
gap> n := 12;;
gap> for k in [1..NrSmallSkewBraces(n)] do
> br := SmallSkewBrace(n,k);
> if is_simple(br) then
> Print("n=", n, ", k=", k, "\n");
> fi;
> od;
n=12, k=22
n=12, k=23

### Test solutions produced by braces
gap> n := 8;;
gap> for k in [1..NrSmallBraces(n)] do
> br := SmallBrace(n,k);
> yb := skewbrace2solution(br);
> if Order(yb2permutation(yb)) <> 2 then
> Print("This is wrong!\n");
> fi;
> od;

# Test the socle
# The results are matched with arXiv:1407.5224
gap> l := [];;
gap> for k in [1..NrSmallBraces(8)] do
> br := SmallBrace(8,k);
> Add(l, Size(socle(br)));
> od;
gap> Collected(l);
[ [ 1, 2 ], [ 2, 11 ], [ 4, 11 ], [ 8, 3 ] ]
gap> STOP_TEST( "ideals.tst", 1 );

#############################################################################
##
#E

