# <#GAPDoc Label="IsSkewBrace">
# <ManSection>
#    <Filt Name="IsSkewBrace" />
# <Description>
# A category of skew braces.
# </Description>
# </ManSection>
# <#/GAPDoc>
DeclareCategory("IsSkewBrace", IsAttributeStoringRep);

# <#GAPDoc Label="IsSkewBraceElm">
# <ManSection>
#    <Filt Name="IsSkewBraceElm" />
# <Description>
# A category of skew brace elements.
# </Description>
# </ManSection>
# <#/GAPDoc>
DeclareCategory("IsSkewBraceElm", IsMultiplicativeElementWithInverse and IsAdditiveElementWithInverse);
DeclareCategoryCollections("IsSkewBraceElm");

DeclareRepresentation( "IsSkewBraceElmRep", IsPositionalObjectRep, [ 1 ]);

DeclareOperation("SkewBraceElmConstructor", [IsSkewBrace, IsPerm]);

BindGlobal("SkewBraceElmFamily", NewFamily("SkewBraceElmFamily", IsSkewBraceElm));
BindGlobal("SkewBraceElmType", NewType(SkewBraceElmFamily, IsSkewBraceElm));
BindGlobal("SkewBraceType", NewType(CollectionsFamily( SkewBraceElmFamily ), IsSkewBrace and IsAttributeStoringRep));

#!
#! @Arguments t
#! @Returns a skew brace 
#! @Description
#!  The argument <A>t</A> is a list of pairs of elements in a group.
#! @ExampleSession
#! gap> SkewBrace([[(),()]]);
#! <brace of size 1>
#! gap> SkewBrace([[(),()],[(1,2),(1,2)]]);
#! <brace of size 2>
#! gap> SkewBrace( [ [ (), () ], [ (1,2)(3,4), (1,2)(3,4) ], [ (1,3,2,4), (1,4,2,3) ], [ (1,4,2,3), (1,3,2,4) ] ] );
#! <brace of size 4>
#! @EndExampleSession
DeclareOperation("SkewBrace", [IsList]);

# <#GAPDoc Label="SmallSkewBrace">
# <ManSection>
#    <Oper Name="SmallSkewBrace"
#          Arg="k,n"/>
#    <Returns>
#          A skew brace
#    </Returns>
# <Description>
# <Ref Oper="SmallSkewBrace"/> returns an <A>n</A>-th skew brace from
# the database of skew braces of order <A>k</A>.
#
# <Example>
# <![CDATA[
# gap> SmallSkewBrace(8,3);
# <brace of size 8>
# ]]>
# </Example>
#
# </Description>
# </ManSection>
# <#/GAPDoc>
DeclareOperation("SmallSkewBrace", [IsInt, IsInt]);

DeclareOperation("SmallBrace", [IsInt, IsInt]);
DeclareAttribute("IdSkewBrace", IsSkewBrace);
DeclareAttribute("IdBrace", IsSkewBrace);
DeclareAttribute("ZeroImmutable", IsSkewBrace);
DeclareAttribute("OneImmutable", IsSkewBrace);
DeclareAttribute("Representative", IsSkewBrace);
DeclareAttribute("Enumerator", IsSkewBrace);

#DeclareOperation("IsIdeal", [IsSkewBrace, IsList]);

DeclareOperation("Lambda", [IsSkewBraceElm, IsSkewBraceElm]);
DeclareOperation("InverseLambda", [IsSkewBraceElm, IsSkewBraceElm]);
DeclareOperation("Star", [IsSkewBraceElm, IsSkewBraceElm]);
DeclareOperation("Star", [IsCollection, IsCollection]);
DeclareOperation("Lambda2Permutation", [IsSkewBraceElm]);

DeclareOperation("Random", [IsSkewBrace]);
DeclareOperation("IsSkewBraceImplemented", [IsInt]);
DeclareOperation("IsBraceImplemented", [IsInt]);
DeclareOperation("SkewBraceLambda", [IsSkewBrace, IsPerm, IsPerm]);
DeclareOperation("SkewBraceLambdaAsPermutation", [IsSkewBrace, IsPerm]);
DeclareOperation("Bijective1Cocycle", [IsSkewBrace]);
DeclareOperation("InverseBijective1Cocycle", [IsSkewBrace]);

#DeclareOperation("LambdaMap", [IsBrace, IsPerm]);
#DeclareOperation("InverseLambdaMap", [IsBrace, IsPerm]);

DeclareGlobalFunction("NrSmallSkewBraces");
DeclareGlobalFunction("NrSmallBraces");

#!
DeclareGlobalFunction("AllSmallSkewBraces");

#! @Arguments n
#! @Returns a list
#! @Description 
#!  Returns a list of small braces 
DeclareGlobalFunction("AllSmallBraces");
DeclareGlobalFunction("IsSkewBraceHomomorphism");
DeclareGlobalFunction("SkewBraceElm");
DeclareGlobalFunction("IsomorphismSkewBraces");

#DeclareAttribute("Brace2CycleSet", IsBrace);
#DeclareAttribute("Brace2LinearCycleSet", IsBrace);
#DeclareAttribute("Socle", IsBrace);
DeclareAttribute("UnderlyingAdditiveGroup", IsSkewBrace);
DeclareAttribute("UnderlyingMultiplicativeGroup", IsSkewBrace);
DeclareAttribute("SkewBraceAList", IsSkewBrace);
DeclareAttribute("SkewBraceMList", IsSkewBrace);
DeclareAttribute("AsList", IsSkewBrace);
DeclareAttribute("Is2Sided", IsSkewBrace);
DeclareAttribute("IsClassical", IsSkewBrace);
DeclareAttribute("SkewBrace2YB", IsSkewBrace);
DeclareAttribute("Labels", IsSkewBrace);
DeclareAttribute("Brace2CycleSet", IsSkewBrace);

#! 
#! @Returns true if the skew brace is two sided, false otherwise
#! @Description
#!  A skew brace $A$ is said to be two-sided if $(a+b)\circ c=a\circ c-c+b\circ c$ holds for all $a,b,c\in A$.
#! @ExampleSession
#! gap> IsTwoSided(SmallSkewBrace(8,2));
#! false
#! gap> IsTwoSided(SmallSkewBrace(8,4));
#! true
#! @EndExampleSession
DeclareProperty("IsTwoSided", IsSkewBrace);

DeclareProperty("IsClassicalSkewBrace", IsSkewBrace);

# Conversion utilities
DeclareGlobalFunction("FromMul2Add");
DeclareGlobalFunction("FromAdd2Mul");
DeclareGlobalFunction("FromSkewBrace2Add");
DeclareGlobalFunction("FromSkewBrace2Mul");
DeclareGlobalFunction("FromAdd2SkewBrace");
DeclareGlobalFunction("FromMul2SkewBrace");

### Skew braces of size <15
ReadPackage("yangbaxter", "data/SBsize1.g");
ReadPackage("yangbaxter", "data/SBsize2.g");
ReadPackage("yangbaxter", "data/SBsize3.g");
ReadPackage("yangbaxter", "data/SBsize4.g");
ReadPackage("yangbaxter", "data/SBsize5.g");
ReadPackage("yangbaxter", "data/SBsize6.g");
ReadPackage("yangbaxter", "data/SBsize7.g");
ReadPackage("yangbaxter", "data/SBsize8.g");
ReadPackage("yangbaxter", "data/SBsize9.g");
ReadPackage("yangbaxter", "data/SBsize10.g");
ReadPackage("yangbaxter", "data/SBsize11.g");
ReadPackage("yangbaxter", "data/SBsize12.g");
ReadPackage("yangbaxter", "data/SBsize13.g");
ReadPackage("yangbaxter", "data/SBsize14.g");
ReadPackage("yangbaxter", "data/SBsize15.g");

### Braces of size <15
ReadPackage("yangbaxter", "data/Bsize1.g");
ReadPackage("yangbaxter", "data/Bsize2.g");
ReadPackage("yangbaxter", "data/Bsize3.g");
ReadPackage("yangbaxter", "data/Bsize4.g");
ReadPackage("yangbaxter", "data/Bsize5.g");
ReadPackage("yangbaxter", "data/Bsize6.g");
ReadPackage("yangbaxter", "data/Bsize7.g");
ReadPackage("yangbaxter", "data/Bsize8.g");
ReadPackage("yangbaxter", "data/Bsize9.g");
ReadPackage("yangbaxter", "data/Bsize10.g");
ReadPackage("yangbaxter", "data/Bsize11.g");
ReadPackage("yangbaxter", "data/Bsize12.g");
ReadPackage("yangbaxter", "data/Bsize13.g");
ReadPackage("yangbaxter", "data/Bsize14.g");
ReadPackage("yangbaxter", "data/Bsize15.g");

