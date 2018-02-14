DeclareAttribute("LeftIdeals", IsSkewBrace);
DeclareAttribute("Ideals", IsSkewBrace);
DeclareAttribute("Socle", IsSkewBrace);

#!
#! @Arguments A
#! @Returns a list of left ideals 
#! @Description
#! The left series of a skew brace $A$ is defined recursively as 
#! $A^1=A$ and $A^{n+1}=A*A^n$ for $n\geq1$, where $a*b=\lambda_a(b)-b$
#! @ExampleSession
#! gap> br := SmallSkewBrace(8,20);
#! <skew brace of size 8>
#! gap> LeftSeries(br);
#! [ <skew brace of size 8>, <brace of size 2>, <brace of size 1> ]
#! @EndExampleSession
DeclareAttribute("LeftSeries", IsSkewBrace);

#!
#! @Arguments A 
#! @Returns a list of ideals 
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
DeclareAttribute("RightSeries", IsSkewBrace);

#!
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

