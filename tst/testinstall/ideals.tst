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
>   Print("This is wrong!\n");
> fi;
> if not IsLeftIdeal(br, soc) then
>   Print("This is wrong!\n");
> fi;
> od;

# Test quotients 
gap> br := SmallSkewBrace(16,300);;
gap> List(Ideals(br), x->Size(Quotient(br, x)));
[ 16, 8, 8, 8, 4, 2, 2, 2, 1 ]

# Test LeftSeries and IsLeftIdeal
gap> br := SmallSkewBrace(36,191);;
gap> ls := LeftSeries(br);
[ <skew brace of size 36>, <skew brace of size 18>, <brace of size 3> ]
gap> List(ls, x->IsLeftIdeal(br, x));
[ true, true, true ]
gap> List(ls, x->IsIdeal(br, x));
[ true, true, false ]
gap> add := UnderlyingAdditiveGroup(br);;
gap> Set(List(NormalSubgroups(add), Size));
[ 1, 9, 18, 36 ]
gap> List(ls, IdSkewBrace);
[ [ 36, 191 ], [ 18, 22 ], [ 3, 1 ] ]

# Test prime and semiprime
gap> br := SmallSkewBrace(24,708);;
gap> IsSimpleSkewBrace(br);
false
gap> IsPrime(br);
true
gap> IsSemiprime(br);
true
gap> Size(PrimeIdeals(br));
2
gap> Size(SemiprimeIdeals(br));
2

gap> STOP_TEST( "ideals.tst", 1 );
#############################################################################
##
#E

