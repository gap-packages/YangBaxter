#
gap> START_TEST("example24.tst");

# Example 2.4
gap> br := SmallBrace(8,5);;
gap> add := UnderlyingAdditiveGroup(br);;
gap> mul := UnderlyingMultiplicativeGroup(br);;
gap> IdGroup(add);
[ 8, 1 ]
gap> StructureDescription(add);
"C8"
gap> IdGroup(mul);
[ 8, 2 ]
gap> StructureDescription(mul);
"C4 x C2"
gap> l := [];;
gap> for k in [1..NrSmallBraces(8)] do
> x := SmallBrace(8,k);;
> if IdGroup(UnderlyingAdditiveGroup(x))=IdGroup(add)\
> and IdGroup(UnderlyingMultiplicativeGroup(x))=IdGroup(mul) then
> Add(l,k);
> fi;
> od;
gap> l;
[ 5 ]
gap> ideals := ShallowCopy(Ideals(br));;
gap> SortBy(ideals,Size);
gap> List(ideals, IdBrace);
[ [ 1, 1 ], [ 2, 1 ], [ 4, 1 ], [ 8, 5 ] ]
gap> List(ideals, x->IdBrace(br/x));
[ [ 8, 5 ], [ 4, 2 ], [ 2, 1 ], [ 1, 1 ] ]

#
gap> STOP_TEST("example24.tst", 1);
