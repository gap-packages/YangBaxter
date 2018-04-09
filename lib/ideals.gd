DeclareAttribute("LeftIdeals", IsSkewBrace);
DeclareAttribute("Ideals", IsSkewBrace);
DeclareAttribute("Socle", IsSkewBrace);

#!
#! @Arguments obj
#! @Returns the left ideals of the left series of <A>obj</A>
#! @Description
#! The left series of a skew brace 0$A$ is defined recursively as 
#! $A^1=A$ and $A^{n+1}=A*A^n$ for $n\geq1$, where $a*b=\lambda_a(b)-b$
#! @ExampleSession
#! gap> br := SmallSkewBrace(8,20);
#! <skew brace of size 8>
#! gap> LeftSeries(br);
#! [ <skew brace of size 8>, <brace of size 2>, <brace of size 1> ]
#! @EndExampleSession
DeclareAttribute("LeftSeries", IsSkewBrace);

#!
#! @Arguments obj 
#! @Returns the list of ideals of the Smoktunowicz's series of <A>obj</A>
#! @Description
#! The Smoktunowicz's series of a skew brace $A$ is defined recursively as 
#! $A^{[1]}=A$ and 
#! $A^{[n+1]}=\sum_{i=1}^n A^{[i]}*A^{[n+1-i]}$ 
#! for $n\geq1$, where $a*b=\lambda_a(b)-b$. 
#! @ExampleSession
#! gap> br := SmallSkewBrace(10,2);
#! <skew brace of size 10>
#! gap> SmoktunowiczSeries(br);
#! [ <skew brace of size 10>, <brace of size 1> ]
#! @EndExampleSession
DeclareAttribute("SmoktunowiczSeries", IsSkewBrace);

#!
#! @Arguments obj
#! @Returns the ideals of the right series of <A>obj</A>
#! @Description
#! The right series of a skew brace 0$A$ is defined recursively as 
#! $A^{(1)}=A$ and $A^{(n+1)}=A*A^{(n)}$ for $n\geq1$, where $a*b=\lambda_a(b)-b$
#! @ExampleSession
#! gap> br := SmallSkewBrace(8,20);
#! <skew brace of size 8>
#! gap> RightSeries(br);
#! [ <skew brace of size 8>, <brace of size 2>, <brace of size 1> ]
#! @EndExampleSession
DeclareAttribute("RightSeries", IsSkewBrace);

#!
#! @Arguments obj
#! @Returns the ideals of the socle series of <A>obj</A>
#! @Description
#! The socle series of a skew brace $A$ is defined recursively as...
#! @ExampleSession
#! gap> br := SmallSkewBrace(8,20);;
#! gap> SocleSeries(br);
#! [ <skew brace of size 8>, <brace of size 4>, <brace of size 1> ]
#! @EndExampleSession
DeclareAttribute("SocleSeries", IsSkewBrace);

#!
DeclareAttribute("MultipermutationLevel", IsSkewBrace);
DeclareAttribute("Fix", IsSkewBrace);
DeclareAttribute("KernelOfLambda", IsSkewBrace);

DeclareProperty("IsSimpleSkewBrace", IsSkewBrace);
DeclareProperty("IsLeftNilpotent", IsSkewBrace);
DeclareProperty("IsRightNilpotent", IsSkewBrace);
DeclareProperty("IsMultipermutation", IsSkewBrace);

DeclareOperation("IsIdeal", [ IsSkewBrace, IsCollection ]);
DeclareOperation("IsLeftIdeal", [ IsSkewBrace, IsCollection ]);
DeclareOperation("AsIdeal", [ IsSkewBrace, IsCollection ]);

DeclareOperation("Quotient", [IsSkewBrace, IsSkewBrace]);

DeclareGlobalFunction("SubSkewBrace");

#!
#! @Arguments obj
#! @Returns <A>true</A> if the skew brace <A>obj</A> is prime
#! @Description
#! A skew brace $A$ is said to be prime if for all non-zero ideals $I$ and $J$ one has
#! $I*J\ne 0$ 
#! @ExampleSession
#! gap> IsPrime(SmallBrace(24,12));
#! false
#! gap> IsPrime(SmallBrace(24,94));
#! true
#! @EndExampleSession
DeclareAttribute("IsPrime", IsSkewBrace);

#!
#! @Arguments obj
#! @Returns <A>true</A> if the ideal <A>obj</A> is prime
#! @Description
#! An ideal $I$ of a skew brace $A$ is said to be prime if $A/I$ is a prime skew brace.
#! @ExampleSession
#! gap> br := SmallBrace(24,94);
#! <brace of size 24>
#! gap> IsPrime(br);
#! true
#! gap> Ideals(br);
#! [ <brace of size 24>, <brace of size 1> ]
#! gap> IsPrimeIdeal(last[2]);
#! true
#! @EndExampleSession
DeclareAttribute("IsPrimeIdeal", IsSkewBrace and IsIdealInParent);

#!
#! @Arguments obj
#! @Returns the list of prime ideals of the skew brace <A>obj</A> 
#! @Description
#! @ExampleSession
#! gap> PrimeIdeals(SmallBrace(24,94));
#! [ <brace of size 24>, <brace of size 1> ]
#! @EndExampleSession
DeclareAttribute("PrimeIdeals", IsSkewBrace);

#!
#! @Arguments obj
#! @Returns <A>true</A> if the skew brace <A>obj</A> is semiprime
#! @Description
#! @ExampleSession
#! gap> br := DirectProductSkewBraces(SmallSkewBrace(12,22),SmallSkewBrace(12,22));;
#! gap> IsSemiprime(br);
#! true
#! @EndExampleSession
DeclareAttribute("IsSemiprime", IsSkewBrace);

#!
#! @Arguments obj
#! @Returns <A>true</A> if the ideal <A>obj</A> is semiprime
#! @Description
#! An ideal $I$ of a skew brace $A$ is said to be semiprime if $A/I$ is a semiprime skew brace.
#! @ExampleSession
#! gap> SemiprimeIdeals(SmallSkewBrace(12,24));
#! [ <skew brace of size 12> ]
#! gap> IsSemiprimeIdeal(last[1]);
#! true
#! @EndExampleSession
DeclareAttribute("IsSemiprimeIdeal", IsSkewBrace and IsIdealInParent);

#!
#! @Arguments obj
#! @Returns the list of semiprime ideals of the skew brace <A>obj</A>
#! @Description
#! An ideal $I$ of a skew brace $A$ is said to be semiprime if it is semiprime as a skew brace.
#! @ExampleSession
#! gap> SemiprimeIdeals(SmallSkewBrace(12,22));
#! [ <skew brace of size 12>, <brace of size 1> ]
#! gap> SemiprimeIdeals(SmallSkewBrace(12,24));
#! [ <skew brace of size 12> ]
#! @EndExampleSession
DeclareAttribute("SemiprimeIdeals", IsSkewBrace);

#!
#! @Arguments ideal1,ideal2
#! @Returns the intersection of <A>ideal1</A> and <A>ideal2</A> 
#! @Description
#! @ExampleSession
#! gap> br := SmallSkewBrace(6,6);;
#! gap> Ideals(br);
#! [ <brace of size 6>, <brace of size 2>, <brace of size 3>, <brace of size 1> ]
#! gap> IntersectionOfTwoIdeals(last[2],last[3]);
#! <brace of size 1>
#! @EndExampleSession
DeclareOperation("IntersectionOfTwoIdeals", [ IsSkewBrace and IsIdealInParent, IsSkewBrace and IsIdealInParent ]);

#!
#! @Arguments ideal1,ideal2
#! @Returns the sum of <A>ideal1</A> and <A>ideal2</A> 
#! @Description
#! @ExampleSession
#! gap> br := SmallSkewBrace(6,6);;
#! gap> Ideals(br);
#! [ <brace of size 6>, <brace of size 2>, <brace of size 3>, <brace of size 1> ]
#! gap> SumOfTwoIdeals(last[2],last[3]);
#! <brace of size 6>
#! @EndExampleSession
DeclareOperation("SumOfTwoIdeals", [ IsSkewBrace and IsIdealInParent, IsSkewBrace and IsIdealInParent ]);

#!
#! @Arguments obj
#! @Returns the Baer radical of the skew brace <A>obj</A>
#! @Description
#! @ExampleSession
#! gap> br := SmallSkewBrace(6,2);;
#! gap> IsBaer(br);
#! true
#! gap> BaerRadical(br);
#! <skew brace of size 6>
#! @EndExampleSession
DeclareAttribute("BaerRadical", IsSkewBrace);
DeclareProperty("IsBaer", IsSkewBrace);

#!
#! @Arguments obj
#! @Returns the Wedderburn radical of the skew brace <A>obj</A>
#! @Description The Wedderburn radical of a skew brace is the intersection of all its prime ideals
#! @ExampleSession
#! gap> br := SmallSkewBrace(6,2);;
#! gap> WedderburnRadical(br);
#! <brace of size 3>
#! @EndExampleSession
DeclareAttribute("WedderburnRadical", IsSkewBrace);

#!
#! @Arguments obj,subset
#! @Returns the ideal of <A>obj</A> generated by the given <A>subset</A>
#! @Description 
#! The ideal of a skew brace $A$ generated by a subset $X$ is the intersection of all the ideals of $A$ containing $X$.
#! @ExampleSession
#! gap> br := SmallSkewBrace(6,6);;
#! gap> AsList(br);
#! [ <()>, <(1,2,3)(4,5,6)>, <(1,3,2)(4,6,5)>, <(1,4)(2,5)(3,6)>, 
#!   <(1,5,3,4,2,6)>, <(1,6,2,4,3,5)> ]
#! gap> IdealGeneratedBy(br, [last[2]]);
#! <brace of size 3>
#! @EndExampleSession
DeclareOperation("IdealGeneratedBy", [ IsSkewBrace, IsCollection ]);

#!
#! @Arguments obj
#! @Returns the list of right or left nilpotent ideals of <A>obj</A>
#! @Description 
#! An ideal $I$ of a skew brace $A$ is said to be right (resp. left nilpotent) if
#! it is right (resp. left) nilpotent as a skew brace.
#! @ExampleSession
#! gap> br := SmallBrace(8,18);;
#! gap> IsLeftNilpotent(br);
#! true
#! gap> LeftNilpotentIdeals(br);
#! [ <brace of size 8>, <brace of size 4>, <brace of size 1> ]
#! gap> IsRightNilpotent(br);
#! false
#! gap> RightNilpotentIdeals(br);
#! [ <brace of size 4>, <brace of size 1> ]
#! @EndExampleSession
DeclareAttribute("RightNilpotentIdeals", IsSkewBrace);
DeclareAttribute("LeftNilpotentIdeals", IsSkewBrace);

#!
#! @Arguments obj
#! @Returns a list with the solvable series of the skew brace <A>obj</A>
#! @Description
#! The solvable series of a skew brace $A$ is defined recursively as 
#! $A_{1}=A$ and $A_{n+1}=A_{n}*A_{n}$ for $n\geq1$, where $a*b=\lambda_a(b)-b$
#! @ExampleSession
#! gap> br := SmallSkewBrace(8,20);;
#! gap> IsSolvable(br);
#! true
#! gap> SolvableSeries(br);
#! [ <skew brace of size 8>, <brace of size 2>, <brace of size 1> ]
#! gap> br := SmallSkewBrace(12,23);;
#! gap> IsSolvable(br);
#! false
#! @EndExampleSession
DeclareAttribute("SolvableSeries", IsSkewBrace);

#! @Arguments obj
#! @Returns true if the skew brace <A>obj</A> is solvable 
#! @Description
#! A skew brace $A$ is solvable if there exists some $n$ such that $A_{\{n\}}=\{0\}$. 
#! @ExampleSession
#! gap> br := SmallSkewBrace(8,20);;
#! gap> IsSolvable(br);
#! true
#! gap> SolvableSeries(br);
#! [ <skew brace of size 8>, <brace of size 2>, <brace of size 1> ]
#! gap> br := SmallSkewBrace(12,23);;
#! gap> IsSolvable(br);
#! false
#! gap> SolvableSeries(br);
#! [ <skew brace of size 12> ]
#! @EndExampleSession
# DeclareProperty("IsSolvable", IsSkewBrace);


