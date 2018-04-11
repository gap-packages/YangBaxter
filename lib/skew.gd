#! @Chapter Preliminaries
#! In this section we define skew braces and list some of their
#! main properties <URL>http://www.google.com</URL>
#! <Cite Key="MR3647970"/>,
#! @Section Definition and examples
#! A skew brace is a triple $(A,+,\circ)$, where $(A,+)$ and $(A,\circ)$
#! are two (not necessarily abelian) groups such that
#! the compatibility $a\circ (b+c)=a\circ b-a+a\circ c$ holds
#! for all $a,b,c\in A$.
#! Ones proves that the map $\lambda\colon (A,\circ)\to\mathrm{Aut}(A,+)$, $a\mapsto\lambda_a(b)$, 
#! $\lambda_a(b)=-a+a\circ b$, is a group homomorphism.
#! Notation: For $a,b\in A$, we write $a*b=\lambda_a(b)-b$.
DeclareCategory("IsSkewBrace", IsAttributeStoringRep);

DeclareCategory("IsSkewBraceElm", IsMultiplicativeElementWithInverse and IsAdditiveElementWithInverse);
DeclareCategoryCollections("IsSkewBraceElm");

DeclareRepresentation( "IsSkewBraceElmRep", IsPositionalObjectRep, [ 1 ]);

DeclareOperation("SkewBraceElmConstructor", [IsSkewBrace, IsPerm]);

BindGlobal("SkewBraceElmFamily", NewFamily("SkewBraceElmFamily", IsSkewBraceElm));
BindGlobal("SkewBraceElmType", NewType(SkewBraceElmFamily, IsSkewBraceElm));
BindGlobal("SkewBraceType", NewType(CollectionsFamily( SkewBraceElmFamily ), IsSkewBrace and IsAttributeStoringRep));

#! @Arguments list
#! @Returns a skew brace 
#! @Description
#! The argument <A>list</A> is a list of pairs of elements in a group. By Proposition 5.11 of 
#! <Cite Key="MR3647970"/>, 
#! skew braces over an abelian group $A$
#! are equivalent to pairs $(G,\pi)$, where $G$ is a group and $\pi\colon G\to A$ is a bijective $1$-cocycle,
#! a finite skew brace can be constructed from the set $\{(a_j,g_j):1\leq j\leq n\}$, where $G=\{g_1,\dots,g_n\}$ and
#! $A=\{a_1,\dots,a_n\}$ are permutation groups. This function is used to construct
#! skew braces. 
#! @ExampleSession
#! gap> SkewBrace([[(),()]]);
#! <brace of size 1>
#! gap> SkewBrace([[(),()],[(1,2),(1,2)]]);
#! <brace of size 2>
#! @EndExampleSession
DeclareOperation("SkewBrace", [IsList]);


#! @Arguments n,k
#! @Returns a skew brace 
#! @Description
#! The function returns the <A>k</A>-th skew brace from the database of skew braces of order <A>n</A>.
#! @ExampleSession
#! gap> SmallSkewBrace(8,3);
#! <brace of size 8>
#! @EndExampleSession
DeclareOperation("SmallSkewBrace", [IsInt, IsInt]);

#! @Arguments abelian_group
#! @Returns a brace 
#! @Description
#! This function returns the trivial brace over the abelian group <A>abelian_group</A>. Here <A>abelian_group</A> 
#! should be an abelian group!
#! @ExampleSession
#! gap> TrivialBrace(CyclicGroup(IsPermGroup, 5));
#! <brace of size 5>
#! @EndExampleSession
DeclareOperation("TrivialBrace", [IsGroup]);

#! @Arguments group
#! @Returns a skew brace 
#! @Description
#! This function returns the trivial skew brace over <A>group</A>.
#! @ExampleSession
#! gap> TrivialSkewBrace(DihedralGroup(10));
#! <skew brace of size 10>
#! @EndExampleSession
DeclareOperation("TrivialSkewBrace", [IsGroup]);

#! @Arguments n,k
#! @Returns a brace of abelian type
#! @Description
#! The function returns the <A>k</A>-th brace (of abelian type) from the database of braces of order <A>n</A>.
#! @ExampleSession
#! gap> SmallBrace(8,3);
#! <brace of size 8>
#! @EndExampleSession
DeclareOperation("SmallBrace", [IsInt, IsInt]);

#! @Arguments obj
#! @Returns a list
#! @Description
#! The function returns <A>[ n, k ]</A> if the skew brace <A>obj</A> is isomorphic to <A>SmallSkewBrace(n,k)</A>.
#! @ExampleSession
#! gap> IdSkewBrace(SmallSkewBrace(8,5));
#! [ 8, 5 ]
#! @EndExampleSession
DeclareAttribute("IdSkewBrace", IsSkewBrace);

#! @Arguments obj
#! @Returns a list
#! @Description
#! The function returns <A>[ n, k ]</A> if the brace of abelian type <A>obj</A> is isomorphic to <A>SmallBrace(n,k)</A>.
#! @ExampleSession
#! gap> IdBrace(SmallBrace(8,5));
#! [ 8, 5 ]
#! @EndExampleSession
DeclareAttribute("IdBrace", IsSkewBrace);

#! @Arguments obj1,obj2
#! @Returns an isomorphism of skew braces if <A>obj1</A> and <A>obj2</A> are isomorphic and <A>fail</A> otherwise.
#! @Description 
#! If $A$ and $B$ are skew braces, a skew brace homomorphism is a map 
#! $f\colon A\to B$ such that 
#! $$f(a+b)=f(a)+f(b)\quad 
#! f(a\circ b)=f(a)\circ f(b)$$ hold for all $a,b\in A$. A skew brace isomorphism is a bijective 
#! skew brace homomorphism. <A>IsomorphismSkewBraces</A> first computes all injective homomorphisms 
#! from $(A,+)$ to $(B,+)$ and then tries to find one $f$ such that 
#! $f(a\circ b)=f(a)\circ f(b)$ for all $a,b\in A$. 
DeclareGlobalFunction("IsomorphismSkewBraces");

#! @Arguments obj1,obj2
#! @Returns the direct product of <A>obj1</A> and <A>obj2</A>
#! @Description
#! @ExampleSession
#! gap> br1 := SmallBrace(8,18);;
#! gap> br2 := SmallBrace(12,2);;
#! gap> br := DirectProductSkewBraces(br1,br2);;
#! gap> IsLeftNilpotent(br);
#! false
#! gap> IsRightNilpotent(br);
#! false
#! gap> IsSolvable(br);
#! true
#! @EndExampleSession
DeclareOperation("DirectProductSkewBraces", [IsSkewBrace, IsSkewBrace]);

#! @Arguments obj
#! @Returns <A>true</A> if the skew brace is two sided, <A>false</A> otherwise
#! @Description
#! A skew brace $A$ is said to be **two-sided** if $(a+b)\circ c=a\circ c-c+b\circ c$ holds for all $a,b,c\in A$.
#! @ExampleSession
#! gap> IsTwoSided(SmallSkewBrace(8,2));
#! false
#! gap> IsTwoSided(SmallSkewBrace(8,4));
#! true
#! @EndExampleSession
DeclareProperty("IsTwoSided", IsSkewBrace);

#! @Arguments obj
#! @Returns <A>true</A> if the skew brace is of abelian type, <A>false</A> otherwise
#! @Description
#! Let $\mathcal{X}$ be a property of groups. A skew brace $A$ is said to be of $\mathcal{X}$-type if its additive
#! group belongs to $\mathcal{X}$. In particular, skew braces of abelian type are those skew braces with
#! abelian additive group. Such skew braces were introduced by Rump in <Cite Key="MR2278047"/>.
DeclareProperty("IsClassical", IsSkewBrace);

#! @Arguments obj
#! @Returns <A>true</A> if the skew brace is trivial, <A>false</A> otherwise
#! @Description
#! The function returns <A>true</A> if the skew brace $A$ is trivial, i.e., $a\circ b=a+b$ for all $a,b\in A$.
DeclareProperty("IsTrivialSkewBrace", IsSkewBrace);

#! @DoNotReadRestOfFile

DeclareAttribute("UnderlyingAdditiveGroup", IsSkewBrace);
DeclareAttribute("UnderlyingMultiplicativeGroup", IsSkewBrace);
DeclareAttribute("SkewBraceAList", IsSkewBrace);
DeclareAttribute("SkewBraceMList", IsSkewBrace);
DeclareAttribute("AsList", IsSkewBrace);
DeclareAttribute("Is2Sided", IsSkewBrace);
DeclareAttribute("SkewBrace2YB", IsSkewBrace);
DeclareAttribute("Labels", IsSkewBrace);
DeclareAttribute("Brace2CycleSet", IsSkewBrace);

DeclareAttribute("ZeroImmutable", IsSkewBrace);
DeclareAttribute("OneImmutable", IsSkewBrace);
DeclareAttribute("Representative", IsSkewBrace);
DeclareAttribute("Enumerator", IsSkewBrace);

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



# Construction
DeclareGlobalFunction("BraceP2");

DeclareOperation("\/", [IsSkewBrace, IsSkewBrace and IsIdealInParent]);

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

