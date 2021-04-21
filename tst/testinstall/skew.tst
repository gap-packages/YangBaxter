#############################################################################
##
##  skew.tst               YangBaxter package               Leandro Vendramin
##
gap> START_TEST("skew.tst");
gap> List([2..10],NrSmallSkewbraces);
[ 1, 1, 4, 1, 6, 1, 47, 4, 6 ]

gap> br:=SmallSkewbrace(8,1);;
gap> Size(br);
8
gap> IdSkewbrace(br);
[ 8, 1 ]
gap> SkewbraceAList(br);
[ (), (1,2)(3,4)(5,6)(7,8), (1,3,2,4)(5,7,6,8), (1,4,2,3)(5,8,6,7), 
  (1,5,3,7,2,6,4,8), (1,6,3,8,2,5,4,7), (1,7,4,5,2,8,3,6), (1,8,4,6,2,7,3,5) ]
gap> SkewbraceMList(br);
[ (), (1,2)(3,4)(5,6)(7,8), (1,4,2,3)(5,8,6,7), (1,3,2,4)(5,7,6,8), 
  (1,7,3,6,2,8,4,5), (1,8,3,5,2,7,4,6), (1,5,4,8,2,6,3,7), (1,6,4,7,2,5,3,8) ]

# More testings
gap> br := SmallSkewbrace(8,25);;
gap> IdGroup(UnderlyingAdditiveGroup(br));
[ 8, 3 ]
gap> IdGroup(UnderlyingMultiplicativeGroup(br));
[ 8, 2 ]

# Check neutral elements
gap> br:=SmallSkewbrace(27,15);;
gap> for a in AsList(br) do
>      if a*One(br)<>a then
>        Print("zero fails\n");
>      fi;
>    od;
gap> for a in AsList(br) do
>      if a+Zero(br)<>a then
>        Print("one fails\n");
>      fi;
>    od;
gap> for a in AsList(br) do
>      if a*a^-1 <> One(br) or a-a <> Zero(br) then
>        Print("inverse fails\n");
>      fi;
>    od;

# Check the compatibility condition
gap> check_compatibility := function(obj)
> local a,b,c;
> for a in AsList(obj) do
>   for b in AsList(obj) do
>     for c in AsList(obj) do
>       if a*(b+c) <> (a*b)-a+(a*c) then
>         return false;
>       fi;
>     od;
>   od;
> od;
> return true;
> end;
function( obj ) ... end
gap> n := 8;
8
gap> for k in [1..NrSmallSkewbraces(n)] do
> br := SmallSkewbrace(n, k);
> if not check_compatibility(br) then 
>   Print("Compatibility fails for n=", n, " and k=", k, "\n");
> fi;
> od;

# Two-sided skew braces
gap> Number([1..NrSmallSkewbraces(8)], k->IsTwoSided(SmallSkewbrace(8,k)));
42
gap> NrSmallSkewbraces(8);
47

# Classical braces
gap> Number([1..NrSmallSkewbraces(8)], k->IsClassical(SmallSkewbrace(8,k)));
27
gap> NrSmallBraces(8);
27
gap> Number([1..NrSmallBraces(8)], k->IsClassical(SmallBrace(8,k)));
27

# Test Lambda
gap> br := SmallSkewbrace(16,40);;
gap> for a in AsList(br) do
> for b in AsList(br) do
> if a+Lambda(a,b) <> a*b then
> Print("This is wrong!\n");
> fi;
> od;
> od;

# Test the bijective 1-cocycle and its inverse
gap> f := Bijective1Cocycle(br);;
gap> for a in AsList(br) do
> for b in AsList(br) do
> if a*b <> Image(f, PreImageElm(f, a)*PreImageElm(f, b)) then
> Print("This is wrong!\n");
> fi;
> od;
> od;

# Test Lambda and its inverse
gap> br := SmallSkewbrace(8,25);;
gap> for a in br do
> for b in br do
> if Lambda(a,InverseLambda(a,b)) <> b then
> Print("This is wrong!\n");
> fi;
> od;
> od;
gap> for a in br do
> for b in br do
> if InverseLambda(a, Lambda(a,b)) <> b then
> Print("This is wrong!\n");
> fi;
> od;
> od;

# Test PrintObj and ViewObj for (skew)braces
gap> br := SmallSkewbrace(8,15);
<brace of size 8>
gap> Display(br);
SmallSkewbrace(8,15)
gap> br := SmallBrace(8,25);
<brace of size 8>
gap> Display(br);
SmallBrace(8,25)

# Test IsClassical
gap> obj1 := SmallBrace(8,10);
<brace of size 8>
gap> Display(obj1);
SmallBrace(8,10)
gap> obj2 := SmallSkewbrace(8,2);
<brace of size 8>
gap> Display(obj2);
SmallSkewbrace(8,2)
gap> obj3 := SmallSkewbrace(10,4);
<skew brace of size 10>
gap> Display(obj3);
SmallSkewbrace(10,4)
gap> List([obj1,obj2,obj3], x->IsAbelian(UnderlyingAdditiveGroup(x)));
[ true, true, false ]


# Test the solution of the YBE associated with a (skew)brace
gap> Number([1..NrSmallSkewbraces(8)], k->IsInvolutive(Skewbrace2YB(SmallSkewbrace(8,k))));
27
gap> Number([1..NrSmallBraces(8)], k->IsInvolutive(Skewbrace2YB(SmallBrace(8,k))));
27

# Test how to convert classical braces to cycle sets
gap> br := SmallBrace(8,10);;
gap> Brace2CycleSet(br);
<A cycle set of size 8>
gap> Matrix(Brace2CycleSet(br)) =
> [ [ 1, 2, 3, 4, 5, 6, 7, 8 ],
>   [ 1, 2, 3, 4, 5, 6, 7, 8 ],
>   [ 1, 2, 3, 4, 5, 6, 7, 8 ],
>   [ 1, 2, 3, 4, 5, 6, 7, 8 ],
>   [ 1, 2, 3, 4, 7, 8, 5, 6 ],
>   [ 1, 2, 3, 4, 7, 8, 5, 6 ],
>   [ 1, 2, 3, 4, 7, 8, 5, 6 ],
>   [ 1, 2, 3, 4, 7, 8, 5, 6 ] ];
true
gap> Permutations(Brace2CycleSet(br));
[ (), (), (), (), (5,7)(6,8), (5,7)(6,8), (5,7)(6,8), (5,7)(6,8) ]
gap> br := SmallSkewbrace(10,4);
<skew brace of size 10>
gap> Brace2CycleSet(br);
Error, this is not a classical brace

# Test the map lambda written as a permutation
gap> br := SmallSkewbrace(8,28);
<skew brace of size 8>
gap> gens := List(br, x->Lambda2Permutation(x));
[ (), (), (), (), (3,4)(7,8), (3,4)(7,8), (3,4)(7,8), (3,4)(7,8) ]
gap> Orbits(Group(gens));
[ [ 3, 4 ], [ 7, 8 ] ]

# Test isomorphisms and ids
gap> br := SmallSkewbrace(16,500);;
gap> IdSkewbrace(br);
[ 16, 500 ]
gap> IdBrace(br);
[ 16, 119 ]
gap> fail <> IsomorphismSkewbraces(br,br);
true
gap> for n in [2..7] do
> for k in [1..NrSmallSkewbraces(n)] do
> br := SmallSkewbrace(n,k);
> if IdSkewbrace(br) <> [n,k] then
> Print("This is wrong!\n");
> fi;
> od;
> od;

# Test for IdBrace 
gap> n := 12;;
gap> l := [];;
gap> for k in [1..NrSmallSkewbraces(n)] do
> br := SmallSkewbrace(n,k);
> if IsClassical(br) then
> Add(l, IdBrace(br));
> fi;
> od;
gap> l;
[ [ 12, 1 ], [ 12, 2 ], [ 12, 3 ], [ 12, 4 ], [ 12, 5 ], [ 12, 6 ], [ 12, 7 ], [ 12, 8 ], [ 12, 9 ], [ 12, 10 ] ]

# Test labels for solutions
gap> br := SmallSkewbrace(16,200);;
gap> yb := Skewbrace2YB(br);;
gap> perms := Permutations(yb);;
gap> l := AsList(br);;
gap> for i in [1..Size(br)] do
> a := l[i];
> for j in [1..Size(br)] do
> b := l[j];
> if Position(l, Lambda(a,b)) <> j^perms[1][i] or Position(l, Lambda(a,b)^(-1)*a*b) <> i^perms[2][j] then
> Print("This is wrong!\n");
> fi;
> od;
> od;

# Test number of braces
gap> l := [];;
gap> for n in [1..100] do
> if n in [32,64,81,96] then
> Add(l, -1);
> else
> Add(l, NrSmallBraces(n));
> fi;
> od;
gap> l;
[ 1, 1, 1, 4, 1, 2, 1, 27, 4, 2, 1, 10, 1, 2, 1, 357, 1, 8, 1, 11, 2, 2, 1, 
  96, 4, 2, 37, 9, 1, 4, 1, -1, 1, 2, 1, 46, 1, 2, 2, 106, 1, 6, 1, 9, 4, 2, 
  1, 1708, 4, 8, 1, 11, 1, 80, 2, 91, 2, 2, 1, 28, 1, 2, 11, -1, 1, 4, 1, 11, 
  1, 4, 1, 489, 1, 2, 5, 9, 1, 6, 1, 1985, -1, 2, 1, 34, 1, 2, 1, 90, 1, 16, 
  1, 9, 2, 2, 1, -1, 1, 8, 4, 51 ]

# Test braces of size p and p^2
gap> IsBraceImplemented(19^2);
true
gap> IsSkewbraceImplemented(23^2);
true
gap> List([1..4], k->IdBrace(SmallBrace(9,k)));
[ [ 9, 1 ], [ 9, 2 ], [ 9, 3 ], [ 9, 4 ] ]
gap> List([1..4], k->IdSkewbrace(SmallBrace(9,k)));
[ [ 9, 1 ], [ 9, 2 ], [ 9, 3 ], [ 9, 4 ] ]
gap> List([1..4], k->IdSkewbrace(SmallSkewbrace(9,k)));
[ [ 9, 1 ], [ 9, 2 ], [ 9, 3 ], [ 9, 4 ] ]
gap> NrSmallBraces(23^2);
4
gap> NrSmallBraces(23);
1
gap> NrSmallSkewbraces(23);
1
gap> NrSmallSkewbraces(29^2);
4

# Test direct product of skew braces
gap> br1 := SmallSkewbrace(1,1);;
gap> br2 := SmallSkewbrace(12,22);;
gap> br3 := SmallSkewbrace(4,3);;
gap> IS_BRACE(DirectProductSkewbraces(br1,br2));
true
gap> IS_BRACE(DirectProductSkewbraces(br2,br3));
true
gap> IdSkewbrace(DirectProduct(br1,br2));
[ 12, 22 ]
gap> IdSkewbrace(DirectProduct(br2,br1));
[ 12, 22 ]
gap> IdBrace(DirectProduct(SmallBrace(8,12),SmallBrace(3,1)));
[ 24, 27 ]
gap> IdBrace(DirectProduct(SmallBrace(3,1),SmallBrace(8,12)));
[ 24, 27 ]
gap> IdBrace(DirectProduct(SmallBrace(3,1),SmallBrace(4,2),SmallBrace(3,1)));
[ 36, 18 ]
gap> IdBrace(DirectProduct(SmallBrace(4,2),SmallBrace(3,1),SmallBrace(3,1)));
[ 36, 18 ]
gap> IdBrace(DirectProduct(SmallBrace(3,1),SmallBrace(3,1),SmallBrace(4,2)));
[ 36, 18 ]

# Test automorphism groups
gap> br := SmallSkewbrace(8,20);;
gap> AutomorphismGroup(br);
<group with 8 generators>
gap> StructureDescription(last);
"D8"

# Test for ImageElm
gap> br := SmallSkewbrace(8,25);;
gap> aut := AutomorphismGroup(br);;
gap> f := Random(aut);;
gap> x := Random(br);;
gap> ImageElm(f, x) in br;
true

# Test for IsBiSkewbrace
gap> Number([1..NrSmallSkewbraces(8)], k->IsBiSkewbrace(SmallSkewbrace(8,k)));
39

# Test for SemidirectProduct
gap> A := SmallSkewbrace(12,22);;
gap> B := SmallSkewbrace(4,2);;
gap> s := SkewbraceActions(B,A);;
gap> List(s, f->IS_BRACE(SemidirectProduct(A,B,f)));
[ true, true, true, true ]

gap> STOP_TEST( "skew.tst", 1 );
#############################################################################
##
#E

