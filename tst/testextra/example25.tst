# Example 2.5
gap> br := SmallBrace(6,2);;
gap> List(LeftIdeals(br), IdBrace);
[ [ 1, 1 ], [ 2, 1 ], [ 3, 1 ], [ 6, 2 ] ]
gap> add := UnderlyingAdditiveGroup(br);
Group([ (1,5,3,4,2,6) ])
gap> mul := UnderlyingMultiplicativeGroup(br);
Group([ (1,5,3,4,2,6) ])
gap> IdGroup(add);
[ 6, 2 ]
gap> IdGroup(mul);
[ 6, 2 ]
gap> StructureDescription(add);
"C6"
gap> StructureDescription(mul);
"C6"
gap> l := [];;
gap> for k in [1..NrSmallBraces(6)] do
> x := SmallBrace(6,k);
> if IdGroup(UnderlyingAdditiveGroup(x))=IdGroup(add)\
> and IdGroup(UnderlyingMultiplicativeGroup(x))=IdGroup(mul) then
> Add(l,k);
> fi;
> od;
gap> l;
[ 2 ]
gap> left_ideals := LeftIdeals(br);;
gap> List(left_ideals, IdBrace);
[ [ 1, 1 ], [ 2, 1 ], [ 3, 1 ], [ 6, 2 ] ]
gap> List(left_ideals, x->IsIdeal(br, x));
[ true, true, true, true ]
gap> 

