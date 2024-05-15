#############################################################################
##
##  ideals.tst               YangBaxter package               Leandro Vendramin
##

gap> START_TEST("ideals.tst");

# Test simple braces
gap> n := 12;;
gap> for k in [1..NrSmallSkewbraces(n)] do
> br := SmallSkewbrace(n,k);
> if IsSimpleSkewbrace(br) then
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
gap> for k in [1..NrSmallSkewbraces(8)] do
> br := SmallSkewbrace(8,k);
> soc := Socle(br);
> if not IsIdeal(br, soc) then
>   Print("This is wrong!\n");
> fi;
> if not IsLeftIdeal(br, soc) then
>   Print("This is wrong!\n");
> fi;
> od;

# Test quotients 
gap> br := SmallSkewbrace(16,300);;
gap> SortedList(List(Ideals(br), x->Size(Quotient(br, x))));
[ 1, 2, 2, 2, 4, 8, 8, 8, 16 ]

# Test LeftSeries and IsLeftIdeal
gap> br := SmallSkewbrace(36,191);;
gap> ls := LeftSeries(br);
[ <skew brace of size 36>, <left ideal in <skew brace of size 36>, (size 18)>,
  <left ideal in <skew brace of size 36>, (size 3)> ]
gap> List(ls, x->IsLeftIdeal(br, x));
[ true, true, true ]
gap> List(ls, x->IsIdeal(br, x));
[ true, true, false ]
gap> add := UnderlyingAdditiveGroup(br);;
gap> Set(List(NormalSubgroups(add), Size));
[ 1, 9, 18, 36 ]
gap> List(ls, IdSkewbrace);
[ [ 36, 191 ], [ 18, 22 ], [ 3, 1 ] ]

# Test prime and semiprime
gap> br := SmallSkewbrace(24,708);;
gap> IsSimpleSkewbrace(br);
false
gap> IsPrimeBrace(br);
true
gap> IsSemiprime(br);
true
gap> Size(PrimeIdeals(br));
2
gap> Size(SemiprimeIdeals(br));
2

# Test  ViewObj for left ideals and ideals
gap> br := SmallSkewbrace(8,15);
<brace of size 8>
gap> left_ideals := LeftIdeals(br);;
gap> ViewObj(left_ideals[3]);
<left ideal in <brace of size 8>, (size 4)>
gap> left_ideal:=left_ideals[3];
<left ideal in <brace of size 8>, (size 4)>
gap> left_ideals_of_left_ideals:= LeftIdeals(left_ideal);
[ <left ideal in <skew brace of size 4>, (size 1)>,
  <left ideal in <skew brace of size 4>, (size 2)>,
  <left ideal in <skew brace of size 4>, (size 4)> ]
gap> ViewObj(left_ideals_of_left_ideals[2]);
<left ideal in <skew brace of size 4>, (size 2)>
gap> ideals := Ideals(br);;
gap> ideal := First(ideals, x -> Size(x) = 4);
<ideal in <brace of size 8>, (size 4)>
gap> ideals_of_ideals:= Ideals(ideal);;
gap> SortedList(List(ideals_of_ideals, Size));
[ 1, 2, 4 ]

# Test IsIdealInParent for left ideals
gap> br := SmallSkewbrace(12,12);
<brace of size 12>
gap> ideals := Ideals(br);;
gap> SortedList(List(ideals, Size));
[ 1, 2, 3, 6, 12 ]
gap> ForAll(ideals, IsIdealInParent);
true
gap> left_ideals := LeftIdeals(br);
[ <left ideal in <brace of size 12>, (size 1)>, <left ideal in <brace of size 12>, (size 2)>,
  <left ideal in <brace of size 12>, (size 3)>, <left ideal in <brace of size 12>, (size 4)>,
  <left ideal in <brace of size 12>, (size 6)>, <left ideal in <brace of size 12>, (size 12)> ]
gap> Collected(List(left_ideals, IsIdealInParent));
[ [ true, 5 ], [ false, 1 ] ]

gap> STOP_TEST( "ideals.tst", 1 );
#############################################################################
##
#E
