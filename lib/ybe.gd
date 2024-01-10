#! @Chapter Algebraic Properties of Braces
#! @Section Braces and Yang-Baxter Equation

DeclareCategory("IsYB", IsAttributeStoringRep);

DeclareOperation("SmallIYB", [IsInt, IsInt]);
DeclareOperation("YB", [IsList, IsList]);

DeclareOperation("InverseYB", [IsYB]);

#! @Arguments table
#! @Returns the solution given by the table 
#! @Description
#! Given the table with $r(x,y)$ in the position $(x,y)$ find the corresponding $r$  
#! @ExampleSession
#! gap> l := Table(SmallIYB(4,13));;
#! gap> t := Table2YB(l);;
#! gap> IdCycleSet(YB2CycleSet(t));
#! [ 4, 13 ]
#! @EndExampleSession
DeclareOperation("Table2YB", [IsList]);

DeclareOperation("Permutations2YB", [IsList, IsList]);
DeclareOperation("TableYB", [IsYB, IsInt, IsInt]);

#! @Arguments obj,pair
#! @Returns a pair of two integers
#! @Description
#! Given the pair $(x,y)$ this function returns $r(x,y)$. 
#! @ExampleSession
#! gap> cs := SmallCycleSet(4,13);;
#! gap> yb := CycleSet2YB(cs);;
#! gap> Permutations(yb);
#! [ [ (3,4), (1,3,2,4), (1,4,2,3), (1,2) ], 
#!   [ (2,4), (1,4,3,2), (1,2,3,4), (1,3) ] ]
#! gap> Evaluate(yb, [1,2]);
#! [ 2, 4 ]
#! gap> Evaluate(yb, [1,3]); 
#! [ 4, 2 ]
#! @EndExampleSession
DeclareOperation("Evaluate", [IsYB, IsList]);

DeclareOperation("IsInvariant", [IsYB, IsList]);
DeclareOperation("RestrictedYB", [IsYB, IsList]);
DeclareOperation("TrivialYB", [IsInt]);

#! @Arguments size,f,g
#! @Returns a permutation solution to the YBE
#! @Description
#! Finite Lyubashenko (or permutation) solutions are defined as follows: Let 
#! $X=\{1,\dots,n\}$ and $f,g\colon X\to X$ be bijective functions such that 
#! $fg=gf$. Then $(X,r)$, where $r(x,y)=(f(y),g(x))$, is a set-theoretic 
#! solution to the YBE.
#! @ExampleSession
#! gap> yb := LyubashenkoYB(4, (1,2),(3,4));
#! <A set-theoretical solution of size 4>
#! gap> Permutations(last);
#! [ [ (1,2), (1,2), (1,2), (1,2) ], [ (3,4), (3,4), (3,4), (3,4) ] ]
#! @EndExampleSession
DeclareOperation("LyubashenkoYB", [IsInt, IsPerm, IsPerm]);

DeclareOperation("CartesianProduct", [IsYB, IsYB]);
DeclareOperation("DerivedRack", [IsYB]);
DeclareOperation("YB2Permutation", [IsYB]);

### YB
DeclareProperty("IsSquareFree", IsYB);
DeclareProperty("IsLeftNonDegenerate", IsYB);
DeclareProperty("IsRightNonDegenerate", IsYB);
DeclareProperty("IsNonDegenerate", IsYB);
DeclareProperty("IsRetractable", IsYB);
DeclareProperty("IsMultipermutation", IsYB);
DeclareProperty("IsInvolutive", IsYB);
#DeclareProperty("IsSymmetric", IsYB);
DeclareProperty("IsBiquandle", IsYB);

#! @Arguments X
#! @Returns true if the involutive solutions is indecomposable
#! @Description 
DeclareProperty("IsIndecomposable", IsYB);

# gap> cs := SmallCycleSet(4,13);;
# gap> yb := CycleSet2YB(cs);;
# gap> Permutations(yb);
# [ [ (3,4), (1,3,2,4), (1,4,2,3), (1,2) ], [ (2,4), (1,4,3,2), (1,2,3,4), (1,3) ] ]
# gap> YB_xy(yb, 1, 3);
# [ 4, 2 ]

DeclareGlobalFunction("YB_xy");
#DeclareGlobalFunction("SmallIYB");
DeclareGlobalFunction("NrSmallIYB");

#DeclareGlobalFunction("YB_ij");
DeclareGlobalFunction("YB_IsBraidedSet");

DeclareAttribute("LPerms", IsYB);
DeclareAttribute("RPerms", IsYB);
DeclareAttribute("LMatrix", IsYB);
DeclareAttribute("RMatrix", IsYB);

#! @Arguments obj
#! @Returns a table with the image of the solution 
#! @Description
#! The table shows the value of $r(x,y)$ for each $(x,y)$
#! @ExampleSession
#! gap> yb := SmallIYB(3,2);;
#! gap> Table(yb);
#! [ [ [ 1, 1 ], [ 2, 1 ], [ 3, 2 ] ], [ [ 1, 2 ], [ 2, 2 ], [ 3, 1 ] ], [ [ 2, 3 ], [ 1, 3 ], [ 3, 3 ] ] ]
#! @EndExampleSession
DeclareAttribute("Table", IsYB);

DeclareAttribute("YBPermutationGroup", IsYB);
DeclareAttribute("IYBGroup", IsYB);
DeclareAttribute("LeftPermutations", IsYB);
DeclareAttribute("RightPermutations", IsYB);
DeclareAttribute("Retract", IsYB);
DeclareAttribute("MultipermutationLevel", IsYB);
DeclareAttribute("YB2CycleSet", IsYB);
DeclareAttribute("StructureGroup", IsYB);
#DeclareAttribute("YB2Permutation", IsYB);
DeclareAttribute("DerivedLeftRack", IsYB);
DeclareAttribute("DerivedRightRack", IsYB);

#! @Arguments obj
#! @Returns The class of an involutive solution
#! @Description
#! @ExampleSession
#! gap> cs := SmallCycleSet(4,13);;
#! gap> yb := CycleSet2YB(cs);;
#! gap> DehornoyClass(yb);
#! 2
#! gap> cs := SmallCycleSet(4,19);;
#! gap> yb := CycleSet2YB(cs);;
#! gap> DehornoyClass(yb);
#! 4
#! @EndExampleSession
DeclareAttribute("DehornoyClass", IsYB);

DeclareOperation("Wada", [IsGroup]);

#! @Arguments obj,variable
#! @Returns A faithful linear representation of the structure group of <A>obj</A>
#! @Description
#! 
#! @ExampleSession
#! gap> cs := SmallCycleSet(4,13);;
#! gap> yb := CycleSet2YB(cs);;
#! gap> Permutations(yb);
#! [ [ (3,4), (1,3,2,4), (1,4,2,3), (1,2) ], 
#!   [ (2,4), (1,4,3,2), (1,2,3,4), (1,3) ] ]
#! gap> field := FunctionField(Rationals, 1);;
#! gap> q := IndeterminatesOfFunctionField(field)[1];;
#! gap> G := DehornoyRepresentationOfStructureGroup(yb, q);;
#! gap> x1 := G.1;;
#! gap> x2 := G.2;;
#! gap> x3 := G.3;;
#! gap> x4 := G.4;;
#! gap> x1*x2=x2*x4;
#! true
#! gap> x1*x3=x4*x2;
#! true
#! gap> x1*x4=x3*x3;
#! true
#! gap> x2*x1=x3*x4;
#! true
#! gap> x2*x2=x4*x1;
#! true
#! gap> x3*x1=x4*x3;
#! true
#! @EndExampleSession
DeclareOperation("DehornoyRepresentationOfStructureGroup", [ IsYB, IsObject ]);

#! @Arguments obj
#! @Returns the identification number of <A>obj</A>
#! @Description
#! 
#! @ExampleSession
#! gap> cs := SmallCycleSet(5,10);;
#! gap> IdCycleSet(cs);
#! [ 5, 10 ]
#! gap> cs := SmallCycleSet(4,3);;
#! gap> yb := CycleSet2YB(cs);;
#! gap> IdYB(yb);
#! [ 4, 3 ]
#! @EndExampleSession
DeclareAttribute("IdYB", IsYB);

#! @Arguments obj
#! @Returns the permutation brace of the involutive solution of <A>obj</A>
#! @Description
#! 
#! @BeginLog
#! gap> yb := SmallIYB(5,86);;
#! gap> IdBrace(IYBBrace(yb));
#! [ 6, 2 ]
#! @EndLog
# This example is excluded from the test since it goes into an
# infinite recursion at assertion level 2
DeclareAttribute("IYBBrace", IsYB);

#! @Arguments obj
#! @Returns a linear representation of the structure group of a finite involutive solution
#! @Description
#! 
#! @ExampleSession
#! gap> yb := SmallIYB(5,86);;
#! gap> gr := LinearRepresentationOfStructureGroup(yb);;
#! gap> gens := GeneratorsOfGroup(gr);;
#! gap> Display(gens[1]);
#! [ [  0,  1,  0,  0,  0,  1 ],
#!   [  1,  0,  0,  0,  0,  0 ],
#!   [  0,  0,  0,  0,  1,  0 ],
#!   [  0,  0,  1,  0,  0,  0 ],
#!   [  0,  0,  0,  1,  0,  0 ],
#!   [  0,  0,  0,  0,  0,  1 ] ]
#! @EndExampleSession
DeclareAttribute("LinearRepresentationOfStructureGroup", IsYB);
