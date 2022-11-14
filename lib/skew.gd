#! @Chapter Preliminaries
#! In this section we define skew braces and list some of their
#! main properties
#! <Cite Key="MR3647970"/>.
#! @Section Definition and examples
#! A skew brace is a triple $(A,+,\circ)$, where $(A,+)$ and $(A,\circ)$
#! are two (not necessarily abelian) groups such that
#! the compatibility $a\circ (b+c)=a\circ b-a+a\circ c$ holds
#! for all $a,b,c\in A$.
#! Ones proves that the map $\lambda\colon (A,\circ)\to\mathrm{Aut}(A,+)$, $a\mapsto\lambda_a(b)$, 
#! $\lambda_a(b)=-a+a\circ b$, is a group homomorphism.
#! Notation: For $a,b\in A$, we write $a*b=\lambda_a(b)-b$.
DeclareCategory("IsSkewbrace", IsAttributeStoringRep);

DeclareCategory("IsSkewbraceElm", IsMultiplicativeElementWithInverse and IsAdditiveElementWithInverse);
DeclareCategoryCollections("IsSkewbraceElm");

DeclareRepresentation( "IsSkewbraceElmRep", IsPositionalObjectRep, [ 1 ]);

DeclareOperation("SkewbraceElmConstructor", [IsSkewbrace, IsPerm]);

BindGlobal("SkewbraceElmFamily", NewFamily("SkewbraceElmFamily", IsSkewbraceElm));
BindGlobal("SkewbraceElmType", NewType(SkewbraceElmFamily, IsSkewbraceElm));
BindGlobal("SkewbraceType", NewType(CollectionsFamily( SkewbraceElmFamily ), IsSkewbrace and IsAttributeStoringRep));

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
#! gap> Skewbrace([[(),()]]);
#! <brace of size 1>
#! gap> Skewbrace([[(),()],[(1,2),(1,2)]]);
#! <brace of size 2>
#! @EndExampleSession
DeclareOperation("Skewbrace", [IsList]);


#! @Arguments n,k
#! @Returns a skew brace 
#! @Description
#! The function returns the <A>k</A>-th skew brace from the database of skew braces of order <A>n</A>.
#! @ExampleSession
#! gap> SmallSkewbrace(8,3);
#! <brace of size 8>
#! @EndExampleSession
DeclareOperation("SmallSkewbrace", [IsInt, IsInt]);

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
#! gap> TrivialSkewbrace(DihedralGroup(10));
#! <skew brace of size 10>
#! @EndExampleSession
DeclareOperation("TrivialSkewbrace", [IsGroup]);

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
#! The function returns <A>[ n, k ]</A> if the skew brace <A>obj</A> is isomorphic to <A>SmallSkewbrace(n,k)</A>.
#! @ExampleSession
#! gap> IdSkewbrace(SmallSkewbrace(8,5));
#! [ 8, 5 ]
#! @EndExampleSession
DeclareAttribute("IdSkewbrace", IsSkewbrace);

#! @Arguments obj
#! @Returns a list
#! @Description
#! The function computes the automorphism group of a skew brace. 
#! @ExampleSession
#! gap> br := SmallSkewbrace(8,20);;
#! gap> AutomorphismGroup(br);
#! <group with 8 generators>
#! gap> StructureDescription(last);
#! "D8"
#! @EndExampleSession
#! @ExampleSession
#! gap> br := SmallSkewbrace(8,25);;
#! gap> aut := AutomorphismGroup(br);;
#! gap> f := Random(aut);;
#! gap> x := Random(br);;
#! gap> ImageElm(f, x) in br;
#! true
#! @EndExampleSession
DeclareAttribute("AutomorphismGroup", IsSkewbrace);

#! @Arguments obj
#! @Returns a list
#! @Description
#! The function returns <A>[ n, k ]</A> if the brace of abelian type <A>obj</A> is isomorphic to <A>SmallBrace(n,k)</A>.
#! @ExampleSession
#! gap> IdBrace(SmallBrace(8,5));
#! [ 8, 5 ]
#! @EndExampleSession
DeclareAttribute("IdBrace", IsSkewbrace);

#! @Arguments obj1,obj2
#! @Returns an isomorphism of skew braces if <A>obj1</A> and <A>obj2</A> are isomorphic and <A>fail</A> otherwise.
#! @Description 
#! If $A$ and $B$ are skew braces, a skew brace homomorphism is a map 
#! $f\colon A\to B$ such that 
#! $$f(a+b)=f(a)+f(b)\quad 
#! f(a\circ b)=f(a)\circ f(b)$$ hold for all $a,b\in A$. A skew brace isomorphism is a bijective 
#! skew brace homomorphism. <A>IsomorphismSkewbraces</A> first computes all injective homomorphisms 
#! from $(A,+)$ to $(B,+)$ and then tries to find one $f$ such that 
#! $f(a\circ b)=f(a)\circ f(b)$ for all $a,b\in A$. 
DeclareGlobalFunction("IsomorphismSkewbraces");

#! @Arguments obj1,obj2
#! @Returns the direct product of <A>obj1</A> and <A>obj2</A>
#! @Description
#! @ExampleSession
#! gap> br1 := SmallBrace(8,18);;
#! gap> br2 := SmallBrace(12,2);;
#! gap> br := DirectProductSkewbraces(br1,br2);;
#! gap> IsLeftNilpotent(br);
#! false
#! gap> IsRightNilpotent(br);
#! false
#! gap> IsSolvable(br);
#! true
#! @EndExampleSession
DeclareOperation("DirectProductSkewbraces", [IsSkewbrace, IsSkewbrace]);
DeclareOperation("DirectProductOp", [IsList, IsSkewbrace]);

#! @Arguments obj
#! @Returns <A>true</A> if the skew brace is two sided, <A>false</A> otherwise
#! @Description
#! A skew brace $A$ is said to be **two-sided** if $(a+b)\circ c=a\circ c-c+b\circ c$ holds for all $a,b,c\in A$.
#! @ExampleSession
#! gap> IsTwoSided(SmallSkewbrace(8,2));
#! false
#! gap> IsTwoSided(SmallSkewbrace(8,4));
#! true
#! @EndExampleSession
DeclareProperty("IsTwoSided", IsSkewbrace);

#! @Arguments obj
#! @Returns <A>true</A> if the group is the automorphism group of a skew braces, <A>false</A> otherwise
#! @Description
#! 
#! @ExampleSession
#! gap> br := SmallSkewbrace(8,25);;
#! gap> aut := AutomorphismGroup(br);;
#! gap> Order(aut);
#! 4
#! gap> IsAutomorphismGroupOfSkewbrace(aut);
#! true
#! @EndExampleSession
DeclareProperty("IsAutomorphismGroupOfSkewbrace", IsAutomorphismGroup);

DeclareProperty("IsSkewbraceAutomorphism", IsGeneralMapping);

#! @Arguments obj
#! @Returns <A>true</A> if the skew brace is of abelian type, <A>false</A> otherwise
#! @Description
#! Let $\mathcal{X}$ be a property of groups. A skew brace $A$ is said to be of $\mathcal{X}$-type if its additive
#! group belongs to $\mathcal{X}$. In particular, skew braces of abelian type are those skew braces with
#! abelian additive group. Such skew braces were introduced by Rump in <Cite Key="MR2278047"/>.
DeclareProperty("IsClassical", IsSkewbrace);
DeclareProperty("IsOfAbelianType", IsSkewbrace);

#! @Arguments obj
#! @Returns <A>true</A> if the skew brace is a bi-skew brace, <A>false</A> otherwise
#! @Description
#! A skew brace $(A,+,\circ)$ is said to be a bi-skew brace if $(A,\circ,+)$ 
#! is a skew brace 
#! @ExampleSession
#! gap> Number([1..NrSmallSkewbraces(8)], k->IsBiSkewbrace(SmallSkewbrace(8,k)));
#! 39
#! @EndExampleSession
DeclareProperty("IsBiSkewbrace", IsSkewbrace);

#! @Arguments obj
#! @Returns <A>true</A> if the skew brace is of nilpotent type, <A>false</A> otherwise
#! @Description
#! Let $\mathcal{X}$ be a property of groups. A skew brace $A$ is said to be of $\mathcal{X}$-type if its additive
#! group belongs to $\mathcal{X}$. In particular, skew braces of nilpotent type are those skew braces with
#! nilpotent additive group. 
DeclareProperty("IsOfNilpotentType", IsSkewbrace);

#! @Arguments obj
#! @Returns <A>true</A> if the skew brace is trivial, <A>false</A> otherwise
#! @Description
#! The function returns <A>true</A> if the skew brace $A$ is trivial, i.e., $a\circ b=a+b$ for all $a,b\in A$.
#! WARNING: The property IsTrivial applied to a skew brace will return
#! true if and only if the skew brace has only one element. 
#! @ExampleSession
#! gap> br := SmallSkewbrace(9,1);;
#! gap> IsTrivialSkewbrace(br);
#! true
#! gap> IsTrivial(br);
#! false
#! @EndExampleSession
DeclareProperty("IsTrivialSkewbrace", IsSkewbrace);

#! @Arguments obj
#! @Returns the set-theoretic solution associated with the skew brace <A>obj</A>
#! @Description
#! If $A$ is a skew brace, the map $r_A\colon A\times A\to A\times A$
#! $$r_A(a,b)=(\lambda_a(b),\lambda_a(b)'\circ a\circ b)$$
#! is a non-degenerate
#! set-theoretic solution of the Yang--Baxter equation. Furthermore, $r_A$ is involutive
#! if and only if $A$ is of abelian type (i.e., the additive group of $A$ is abelian).
#! @ExampleSession
#! gap> Skewbrace2YB(TrivialBrace(CyclicGroup(6)));
#! <A set-theoretical solution of size 6>
#! @EndExampleSession
DeclareAttribute("Skewbrace2YB", IsSkewbrace);
DeclareAttribute("Brace2YB", IsSkewbrace);

#! @Arguments obj
#! @Returns the set-theoretic solution associated with a given subset of a skew brace 
#! @Description
#! @ExampleSession
#! gap> br := TrivialSkewbrace(SymmetricGroup(3));;
#! gap> AsList(br);
#! [ <()>, <(2,3)>, <(1,2)>, <(1,2,3)>, <(1,3,2)>, <(1,3)> ]
#! gap> SkewbraceSubset2YB(br, last{[4,5]});
#! <A set-theoretical solution of size 2>
#! @EndExampleSession
DeclareOperation("SkewbraceSubset2YB", [ IsSkewbrace, IsCollection ]);

DeclareOperation("EvaluateSkewbraceAction", [ IsSkewbraceElm, IsSkewbraceElm, IsGeneralMapping ]);

DeclareOperation("SkewbraceActions", [ IsSkewbrace, IsSkewbrace ]);

#! @Arguments A, B, s
#! @Returns the semidirect product of skew braces
#! @Description
#! Let $A$ and $B$ be two skew braces and $\sigma$ be a skew brace 
#! action of $B$ on $A$, this is a group homomorphism 
#! $\sigma\colon (B,\circ)\to Aut_{\mathrm{Br}}(A)$ 
#! from the multiplicative group of $B$ to the skew brace
#! automorphism of $A$. The semidirect product of $A$ and $B$ with
#! with respect to $\sigma$ is the skew brace $A\rtimes_{\sigma}B$ with
#! operations 
#! $$
#! (a_1,b_1)+(a_2,b_2)=(a_1+a_2,b_1+b_2),
#! \quad
#! (a_1,b_1)\circ (b_2,b_2)=(a_1\circ\sigma(b_1)(a_2),b_1\circ b_2)
#! $$
#! @ExampleSession
#! gap> A := SmallSkewbrace(4,2);;
#! gap> B := SmallSkewbrace(3,1);;
#! gap> s := SkewbraceActions(B,A);;
#! gap> Size(s);
#! 1
#! gap> IdSkewbrace(SemidirectProduct(A,B,s[1]));
#! [ 12, 11 ]
#! gap> IdSkewbrace(DirectProduct(A,B));
#! [ 12, 11 ]
#! @EndExampleSession
DeclareOperation("SemidirectProduct", [ IsSkewbrace, IsSkewbrace, IsGeneralMapping ]);

#! @Arguments A
#! @Returns the underlying multiplicative group of the skew brace
#! @Description
#! @ExampleSession
#! gap> br := SmallBrace(4,2);;
#! gap> G:=UnderlyingMultiplicativeGroup(br);;
#! gap> StructureDescription(G);
#! "C2 x C2"
#! @EndExampleSession
DeclareAttribute("UnderlyingAdditiveGroup", IsSkewbrace);

#! @Arguments A
#! @Returns the underlying additive group of the skew brace
#! @Description
#! @ExampleSession
#! gap> br := SmallSkewbrace(6,2);;
#! gap> G:=UnderlyingAdditiveGroup(br);;
#! gap> IsAbelian(G);
#! false
#! @EndExampleSession
DeclareAttribute("UnderlyingMultiplicativeGroup", IsSkewbrace);

#! @DoNotReadRestOfFile

DeclareAttribute("SkewbraceAList", IsSkewbrace);
DeclareAttribute("SkewbraceMList", IsSkewbrace);
DeclareAttribute("AsList", IsSkewbrace);
DeclareAttribute("Is2Sided", IsSkewbrace);
DeclareAttribute("Labels", IsSkewbrace);
DeclareAttribute("Brace2CycleSet", IsSkewbrace);

DeclareAttribute("ZeroImmutable", IsSkewbrace);
DeclareAttribute("OneImmutable", IsSkewbrace);
DeclareAttribute("Representative", IsSkewbrace);
DeclareAttribute("Enumerator", IsSkewbrace);

DeclareOperation("Lambda", [IsSkewbraceElm, IsSkewbraceElm]);
DeclareOperation("InverseLambda", [IsSkewbraceElm, IsSkewbraceElm]);
DeclareOperation("Star", [IsSkewbraceElm, IsSkewbraceElm]);
DeclareOperation("Star", [IsCollection, IsCollection]);
DeclareOperation("Lambda2Permutation", [IsSkewbraceElm]);

DeclareOperation("Random", [IsSkewbrace]);
DeclareOperation("IsSkewbraceImplemented", [IsInt]);
DeclareOperation("IsBraceImplemented", [IsInt]);
DeclareOperation("SkewbraceLambda", [IsSkewbrace, IsPerm, IsPerm]);
DeclareOperation("SkewbraceLambdaAsPermutation", [IsSkewbrace, IsPerm]);
DeclareOperation("Bijective1Cocycle", [IsSkewbrace]);
DeclareOperation("InverseBijective1Cocycle", [IsSkewbrace]);

#DeclareOperation("LambdaMap", [IsBrace, IsPerm]);
#DeclareOperation("InverseLambdaMap", [IsBrace, IsPerm]);

DeclareGlobalFunction("NrSmallSkewbraces");
DeclareGlobalFunction("NrSmallBraces");

#!
DeclareGlobalFunction("AllSmallSkewbraces");

#! @Arguments n
#! @Returns a list
#! @Description 
#!  Returns a list of small braces 
DeclareGlobalFunction("AllSmallBraces");
DeclareGlobalFunction("IsSkewbraceHomomorphism");
DeclareGlobalFunction("SkewbraceElm");


# Construction
DeclareGlobalFunction("BraceP2");

DeclareOperation("\/", [IsSkewbrace, IsSkewbrace and IsIdealInParent]);

# Conversion utilities
DeclareGlobalFunction("FromMul2Add");
DeclareGlobalFunction("FromAdd2Mul");
DeclareGlobalFunction("FromSkewbrace2Add");
DeclareGlobalFunction("FromSkewbrace2Mul");
DeclareGlobalFunction("FromAdd2Skewbrace");
DeclareGlobalFunction("FromMul2Skewbrace");

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

