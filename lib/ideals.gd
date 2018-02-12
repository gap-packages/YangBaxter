DeclareAttribute("Ideals", IsSkewBrace);
DeclareAttribute("Socle", IsSkewBrace);

# <#GAPDoc Label="LeftSeries">
# <ManSection>
#    <Oper Name="LeftSeries"
#          Arg="t"/>
#    <Returns>
#          A list of the elements of the left series
#    </Returns>
# <Description>
# The left series of a skew brace <A>obj</A> is defined
# recursively as $A^1=A$ and $A^{n+1}=A*A^n$ for $n\geq1$, where $a*b=\lambda_a(b)-b$. 
# <Example>
# <![CDATA[
# gap> br := SmallSkewBrace(8,20);
# <skew brace of size 8>
# gap> LeftSeries
# LeftSeries  
# gap> LeftSeries(br);
# [ <skew brace of size 8>, <brace of size 2>, <brace of size 1> ]
# ]]>
# </Example>
#
# </Description>
# </ManSection>
# <#/GAPDoc>
DeclareAttribute("LeftSeries", IsSkewBrace);

DeclareAttribute("RightSeries", IsSkewBrace);
DeclareAttribute("SocleSeries", IsSkewBrace);
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

