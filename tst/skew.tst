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
gap> SkewBraceAGroup(br);
[ (), (1,2)(3,4)(5,6)(7,8), (1,3,2,4)(5,7,6,8), (1,4,2,3)(5,8,6,7), 
  (1,5,3,7,2,6,4,8), (1,6,3,8,2,5,4,7), (1,7,4,5,2,8,3,6), (1,8,4,6,2,7,3,5) ]
gap> SkewBraceMGroup(br);
[ (), (1,2)(3,4)(5,6)(7,8), (1,4,2,3)(5,8,6,7), (1,3,2,4)(5,7,6,8), 
  (1,7,3,6,2,8,4,5), (1,8,3,5,2,7,4,6), (1,5,4,8,2,6,3,7), (1,6,4,7,2,5,3,8) ]

# Check brace compatibility condition
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
gap> STOP_TEST( "skew.tst", 1 );

#############################################################################
##
#E

