#############################################################################
##
##  skew.tst               YangBaxter package               Leandro Vendramin
##
gap> START_TEST("skew.tst");
gap> List([2..10],NrSmallSkewBraces);
[ 1, 1, 4, 1, 6, 1, 47, 4, 6 ]

gap> br:=SmallSkewBrace(8,1);;
gap> Size(br);
8
gap> IdSkewBrace(br);
[ 8, 1 ]
gap> SkewBraceAList(br);
[ (), (1,2)(3,4)(5,6)(7,8), (1,3,2,4)(5,7,6,8), (1,4,2,3)(5,8,6,7), 
  (1,5,3,7,2,6,4,8), (1,6,3,8,2,5,4,7), (1,7,4,5,2,8,3,6), (1,8,4,6,2,7,3,5) ]
gap> SkewBraceMList(br);
[ (), (1,2)(3,4)(5,6)(7,8), (1,4,2,3)(5,8,6,7), (1,3,2,4)(5,7,6,8), 
  (1,7,3,6,2,8,4,5), (1,8,3,5,2,7,4,6), (1,5,4,8,2,6,3,7), (1,6,4,7,2,5,3,8) ]

# More testings
gap> br := SmallSkewBrace(8,25);;
gap> IdGroup(UnderlyingAdditiveGroup(br));
[ 8, 3 ]
gap> IdGroup(UnderlyingMultiplicativeGroup(br));
[ 8, 2 ]

# Check neutral elements
gap> br:=SmallSkewBrace(27,15);;
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
gap> for k in [1..NrSmallSkewBraces(n)] do
> br := SmallSkewBrace(n, k);
> if not check_compatibility(br) then 
>   Print("Compatibility fails for n=", n, " and k=", k, "\n");
> fi;
> od;

# Two-sided skew braces
gap> Number([1..NrSmallSkewBraces(8)], k->IsTwoSidedSkewBrace(SmallSkewBrace(8,k)));
42
gap> NrSmallSkewBraces(8);
47

# Classical braces
gap> Number([1..NrSmallSkewBraces(8)], k->IsClassicalSkewBrace(SmallSkewBrace(8,k)));
27
gap> NrSmallBraces(8);
27
gap> Number([1..NrSmallBraces(8)], k->IsClassicalSkewBrace(SmallBrace(8,k)));
27

# Test Lambda
gap> br := SmallSkewBrace(16,40);;
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
gap> br := SmallSkewBrace(8,25);;
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
gap> br := SmallSkewBrace(8,15);
<brace of size 8>
gap> Display(br);
SmallSkewBrace(8,15)
gap> br := SmallBrace(8,25);
<brace of size 8>
gap> Display(br);
SmallBrace(8,25)

# Test IsClassicalSkewBrace 
gap> obj1 := SmallBrace(8,10);
<brace of size 8>
gap> Display(obj1);
SmallBrace(8,10)
gap> obj2 := SmallSkewBrace(8,2);
<brace of size 8>
gap> Display(obj2);
SmallSkewBrace(8,2)
gap> obj3 := SmallSkewBrace(10,4);
<skew brace of size 10>
gap> Display(obj3);
SmallSkewBrace(10,4)
gap> List([obj1,obj2,obj3], x->IsAbelian(UnderlyingAdditiveGroup(x)));
[ true, true, false ]


# Test the solution of the YBE associated with a (skew)brace
gap> Number([1..NrSmallSkewBraces(8)], k->IsInvolutive(SkewBrace2YB(SmallSkewBrace(8,k))));
27
gap> Number([1..NrSmallBraces(8)], k->IsInvolutive(SkewBrace2YB(SmallBrace(8,k))));
27

# Test how to convert classical braces to cycle sets
gap> br := SmallBrace(8,10);;
gap> Brace2CycleSet(br);
<A cycle set of size 8>
gap> Matrix(Brace2CycleSet(br));
[ [ 1, 2, 3, 4, 5, 6, 7, 8 ], [ 1, 2, 3, 4, 5, 6, 7, 8 ], 
  [ 1, 2, 3, 4, 5, 6, 7, 8 ], [ 1, 2, 3, 4, 5, 6, 7, 8 ], 
  [ 1, 2, 3, 4, 7, 8, 5, 6 ], [ 1, 2, 3, 4, 7, 8, 5, 6 ], 
  [ 1, 2, 3, 4, 7, 8, 5, 6 ], [ 1, 2, 3, 4, 7, 8, 5, 6 ] ]
gap> Permutations(Brace2CycleSet(br));
[ (), (), (), (), (5,7)(6,8), (5,7)(6,8), (5,7)(6,8), (5,7)(6,8) ]
gap> br := SmallSkewBrace(10,4);
<skew brace of size 10>
gap> Brace2CycleSet(br);
Error, this is not a classical brace

# Test the map lambda written as a permutation
gap> br := SmallSkewBrace(8,28);
<skew brace of size 8>
gap> gens := List(br, x->Lambda2Permutation(x));
[ (), (), (), (), (3,4)(7,8), (3,4)(7,8), (3,4)(7,8), (3,4)(7,8) ]
gap> Orbits(Group(gens));
[ [ 3, 4 ], [ 7, 8 ] ]
gap> STOP_TEST( "skew.tst", 1 );

#############################################################################
##
#E

